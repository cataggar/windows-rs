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
    .{ "GetNumberOfPhysicalMonitorsFromHMONITOR", MethodRecord{ .library = "dxva2", .import = "GetNumberOfPhysicalMonitorsFromHMONITOR", .signature = "\x00\x02\x11\x59\x11\x8e\xed\x0f\x09" } },
    .{ "GetNumberOfPhysicalMonitorsFromIDirect3DDevice9", MethodRecord{ .library = "dxva2", .import = "GetNumberOfPhysicalMonitorsFromIDirect3DDevice9", .signature = "\x00\x02\x11\x79\x12\x94\xdd\x0f\x09" } },
    .{ "GetPhysicalMonitorsFromHMONITOR", MethodRecord{ .library = "dxva2", .import = "GetPhysicalMonitorsFromHMONITOR", .signature = "\x00\x03\x11\x59\x11\x8e\xed\x09\x0f\x11\xaa\xb5" } },
    .{ "GetPhysicalMonitorsFromIDirect3DDevice9", MethodRecord{ .library = "dxva2", .import = "GetPhysicalMonitorsFromIDirect3DDevice9", .signature = "\x00\x03\x11\x79\x12\x94\xdd\x09\x0f\x11\xaa\xb5" } },
    .{ "DestroyPhysicalMonitor", MethodRecord{ .library = "dxva2", .import = "DestroyPhysicalMonitor", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DestroyPhysicalMonitors", MethodRecord{ .library = "dxva2", .import = "DestroyPhysicalMonitors", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xaa\xb5" } },
    .{ "GetVCPFeatureAndVCPFeatureReply", MethodRecord{ .library = "dxva2", .import = "GetVCPFeatureAndVCPFeatureReply", .signature = "\x00\x05\x08\x11\x80\x85\x05\x0f\x11\xaa\xb9\x0f\x09\x0f\x09" } },
    .{ "SetVCPFeature", MethodRecord{ .library = "dxva2", .import = "SetVCPFeature", .signature = "\x00\x03\x08\x11\x80\x85\x05\x09" } },
    .{ "SaveCurrentSettings", MethodRecord{ .library = "dxva2", .import = "SaveCurrentSettings", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "GetCapabilitiesStringLength", MethodRecord{ .library = "dxva2", .import = "GetCapabilitiesStringLength", .signature = "\x00\x02\x08\x11\x80\x85\x0f\x09" } },
    .{ "CapabilitiesRequestAndCapabilitiesReply", MethodRecord{ .library = "dxva2", .import = "CapabilitiesRequestAndCapabilitiesReply", .signature = "\x00\x03\x08\x11\x80\x85\x11\x3d\x09" } },
    .{ "GetTimingReport", MethodRecord{ .library = "dxva2", .import = "GetTimingReport", .signature = "\x00\x02\x08\x11\x80\x85\x0f\x11\xaa\xbd" } },
    .{ "GetMonitorCapabilities", MethodRecord{ .library = "dxva2", .import = "GetMonitorCapabilities", .signature = "\x00\x03\x08\x11\x80\x85\x0f\x09\x0f\x09" } },
    .{ "SaveCurrentMonitorSettings", MethodRecord{ .library = "dxva2", .import = "SaveCurrentMonitorSettings", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "GetMonitorTechnologyType", MethodRecord{ .library = "dxva2", .import = "GetMonitorTechnologyType", .signature = "\x00\x02\x08\x11\x80\x85\x0f\x11\xaa\xc1" } },
    .{ "GetMonitorBrightness", MethodRecord{ .library = "dxva2", .import = "GetMonitorBrightness", .signature = "\x00\x04\x08\x11\x80\x85\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetMonitorContrast", MethodRecord{ .library = "dxva2", .import = "GetMonitorContrast", .signature = "\x00\x04\x08\x11\x80\x85\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetMonitorColorTemperature", MethodRecord{ .library = "dxva2", .import = "GetMonitorColorTemperature", .signature = "\x00\x02\x08\x11\x80\x85\x0f\x11\xaa\xc5" } },
    .{ "GetMonitorRedGreenOrBlueDrive", MethodRecord{ .library = "dxva2", .import = "GetMonitorRedGreenOrBlueDrive", .signature = "\x00\x05\x08\x11\x80\x85\x11\xaa\xc9\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetMonitorRedGreenOrBlueGain", MethodRecord{ .library = "dxva2", .import = "GetMonitorRedGreenOrBlueGain", .signature = "\x00\x05\x08\x11\x80\x85\x11\xaa\xcd\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "SetMonitorBrightness", MethodRecord{ .library = "dxva2", .import = "SetMonitorBrightness", .signature = "\x00\x02\x08\x11\x80\x85\x09" } },
    .{ "SetMonitorContrast", MethodRecord{ .library = "dxva2", .import = "SetMonitorContrast", .signature = "\x00\x02\x08\x11\x80\x85\x09" } },
    .{ "SetMonitorColorTemperature", MethodRecord{ .library = "dxva2", .import = "SetMonitorColorTemperature", .signature = "\x00\x02\x08\x11\x80\x85\x11\xaa\xc5" } },
    .{ "SetMonitorRedGreenOrBlueDrive", MethodRecord{ .library = "dxva2", .import = "SetMonitorRedGreenOrBlueDrive", .signature = "\x00\x03\x08\x11\x80\x85\x11\xaa\xc9\x09" } },
    .{ "SetMonitorRedGreenOrBlueGain", MethodRecord{ .library = "dxva2", .import = "SetMonitorRedGreenOrBlueGain", .signature = "\x00\x03\x08\x11\x80\x85\x11\xaa\xcd\x09" } },
    .{ "DegaussMonitor", MethodRecord{ .library = "dxva2", .import = "DegaussMonitor", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "GetMonitorDisplayAreaSize", MethodRecord{ .library = "dxva2", .import = "GetMonitorDisplayAreaSize", .signature = "\x00\x05\x08\x11\x80\x85\x11\xaa\xd1\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetMonitorDisplayAreaPosition", MethodRecord{ .library = "dxva2", .import = "GetMonitorDisplayAreaPosition", .signature = "\x00\x05\x08\x11\x80\x85\x11\xaa\xd5\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "SetMonitorDisplayAreaSize", MethodRecord{ .library = "dxva2", .import = "SetMonitorDisplayAreaSize", .signature = "\x00\x03\x08\x11\x80\x85\x11\xaa\xd1\x09" } },
    .{ "SetMonitorDisplayAreaPosition", MethodRecord{ .library = "dxva2", .import = "SetMonitorDisplayAreaPosition", .signature = "\x00\x03\x08\x11\x80\x85\x11\xaa\xd5\x09" } },
    .{ "RestoreMonitorFactoryColorDefaults", MethodRecord{ .library = "dxva2", .import = "RestoreMonitorFactoryColorDefaults", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "RestoreMonitorFactoryDefaults", MethodRecord{ .library = "dxva2", .import = "RestoreMonitorFactoryDefaults", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "BRUSHOBJ_pvAllocRbrush", MethodRecord{ .library = "GDI32", .import = "BRUSHOBJ_pvAllocRbrush", .signature = "\x00\x02\x0f\x01\x0f\x11\xaa\xd9\x09" } },
    .{ "BRUSHOBJ_pvGetRbrush", MethodRecord{ .library = "GDI32", .import = "BRUSHOBJ_pvGetRbrush", .signature = "\x00\x01\x0f\x01\x0f\x11\xaa\xd9" } },
    .{ "BRUSHOBJ_ulGetBrushColor", MethodRecord{ .library = "GDI32", .import = "BRUSHOBJ_ulGetBrushColor", .signature = "\x00\x01\x09\x0f\x11\xaa\xd9" } },
    .{ "BRUSHOBJ_hGetColorTransform", MethodRecord{ .library = "GDI32", .import = "BRUSHOBJ_hGetColorTransform", .signature = "\x00\x01\x11\x80\x85\x0f\x11\xaa\xd9" } },
    .{ "CLIPOBJ_cEnumStart", MethodRecord{ .library = "GDI32", .import = "CLIPOBJ_cEnumStart", .signature = "\x00\x05\x09\x0f\x11\xaa\xdd\x11\x59\x09\x09\x09" } },
    .{ "CLIPOBJ_bEnum", MethodRecord{ .library = "GDI32", .import = "CLIPOBJ_bEnum", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\xdd\x09\x0f\x09" } },
    .{ "CLIPOBJ_ppoGetPath", MethodRecord{ .library = "GDI32", .import = "CLIPOBJ_ppoGetPath", .signature = "\x00\x01\x0f\x11\xaa\xe1\x0f\x11\xaa\xdd" } },
    .{ "FONTOBJ_cGetAllGlyphHandles", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_cGetAllGlyphHandles", .signature = "\x00\x02\x09\x0f\x11\xaa\xe5\x0f\x09" } },
    .{ "FONTOBJ_vGetInfo", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_vGetInfo", .signature = "\x00\x03\x01\x0f\x11\xaa\xe5\x09\x0f\x11\xaa\xe9" } },
    .{ "FONTOBJ_cGetGlyphs", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_cGetGlyphs", .signature = "\x00\x05\x09\x0f\x11\xaa\xe5\x09\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "FONTOBJ_pxoGetXform", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_pxoGetXform", .signature = "\x00\x01\x0f\x11\xaa\xed\x0f\x11\xaa\xe5" } },
    .{ "FONTOBJ_pifi", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_pifi", .signature = "\x00\x01\x0f\x11\xaa\xf1\x0f\x11\xaa\xe5" } },
    .{ "FONTOBJ_pfdg", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_pfdg", .signature = "\x00\x01\x0f\x11\xaa\xf5\x0f\x11\xaa\xe5" } },
    .{ "FONTOBJ_pvTrueTypeFontFile", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_pvTrueTypeFontFile", .signature = "\x00\x02\x0f\x01\x0f\x11\xaa\xe5\x0f\x09" } },
    .{ "FONTOBJ_pQueryGlyphAttrs", MethodRecord{ .library = "GDI32", .import = "FONTOBJ_pQueryGlyphAttrs", .signature = "\x00\x02\x0f\x11\xaa\xf9\x0f\x11\xaa\xe5\x09" } },
    .{ "PATHOBJ_vEnumStart", MethodRecord{ .library = "GDI32", .import = "PATHOBJ_vEnumStart", .signature = "\x00\x01\x01\x0f\x11\xaa\xe1" } },
    .{ "PATHOBJ_bEnum", MethodRecord{ .library = "GDI32", .import = "PATHOBJ_bEnum", .signature = "\x00\x02\x11\x59\x0f\x11\xaa\xe1\x0f\x11\xaa\xfd" } },
    .{ "PATHOBJ_vEnumStartClipLines", MethodRecord{ .library = "GDI32", .import = "PATHOBJ_vEnumStartClipLines", .signature = "\x00\x04\x01\x0f\x11\xaa\xe1\x0f\x11\xaa\xdd\x0f\x11\xab\x01\x0f\x11\xab\x05" } },
    .{ "PATHOBJ_bEnumClipLines", MethodRecord{ .library = "GDI32", .import = "PATHOBJ_bEnumClipLines", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\xe1\x09\x0f\x11\xab\x09" } },
    .{ "PATHOBJ_vGetBounds", MethodRecord{ .library = "GDI32", .import = "PATHOBJ_vGetBounds", .signature = "\x00\x02\x01\x0f\x11\xaa\xe1\x0f\x11\xab\x0d" } },
    .{ "STROBJ_vEnumStart", MethodRecord{ .library = "GDI32", .import = "STROBJ_vEnumStart", .signature = "\x00\x01\x01\x0f\x11\xab\x11" } },
    .{ "STROBJ_bEnum", MethodRecord{ .library = "GDI32", .import = "STROBJ_bEnum", .signature = "\x00\x03\x11\x59\x0f\x11\xab\x11\x0f\x09\x0f\x0f\x11\xab\x15" } },
    .{ "STROBJ_bEnumPositionsOnly", MethodRecord{ .library = "GDI32", .import = "STROBJ_bEnumPositionsOnly", .signature = "\x00\x03\x11\x59\x0f\x11\xab\x11\x0f\x09\x0f\x0f\x11\xab\x15" } },
    .{ "STROBJ_dwGetCodePage", MethodRecord{ .library = "GDI32", .import = "STROBJ_dwGetCodePage", .signature = "\x00\x01\x09\x0f\x11\xab\x11" } },
    .{ "STROBJ_bGetAdvanceWidths", MethodRecord{ .library = "GDI32", .import = "STROBJ_bGetAdvanceWidths", .signature = "\x00\x04\x11\x59\x0f\x11\xab\x11\x09\x09\x0f\x11\xab\x19" } },
    .{ "XFORMOBJ_iGetXform", MethodRecord{ .library = "GDI32", .import = "XFORMOBJ_iGetXform", .signature = "\x00\x02\x09\x0f\x11\xaa\xed\x0f\x11\xab\x1d" } },
    .{ "XFORMOBJ_bApplyXform", MethodRecord{ .library = "GDI32", .import = "XFORMOBJ_bApplyXform", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\xed\x09\x09\x0f\x01\x0f\x01" } },
    .{ "XLATEOBJ_iXlate", MethodRecord{ .library = "GDI32", .import = "XLATEOBJ_iXlate", .signature = "\x00\x02\x09\x0f\x11\xab\x21\x09" } },
    .{ "XLATEOBJ_piVector", MethodRecord{ .library = "GDI32", .import = "XLATEOBJ_piVector", .signature = "\x00\x01\x0f\x09\x0f\x11\xab\x21" } },
    .{ "XLATEOBJ_cGetPalette", MethodRecord{ .library = "GDI32", .import = "XLATEOBJ_cGetPalette", .signature = "\x00\x04\x09\x0f\x11\xab\x21\x09\x09\x0f\x09" } },
    .{ "XLATEOBJ_hGetColorTransform", MethodRecord{ .library = "GDI32", .import = "XLATEOBJ_hGetColorTransform", .signature = "\x00\x01\x11\x80\x85\x0f\x11\xab\x21" } },
    .{ "EngCreateBitmap", MethodRecord{ .library = "GDI32", .import = "EngCreateBitmap", .signature = "\x00\x05\x11\x83\x51\x11\x83\xe9\x08\x09\x09\x0f\x01" } },
    .{ "EngCreateDeviceSurface", MethodRecord{ .library = "GDI32", .import = "EngCreateDeviceSurface", .signature = "\x00\x03\x11\xab\x25\x11\xab\x29\x11\x83\xe9\x09" } },
    .{ "EngCreateDeviceBitmap", MethodRecord{ .library = "GDI32", .import = "EngCreateDeviceBitmap", .signature = "\x00\x03\x11\x83\x51\x11\xab\x29\x11\x83\xe9\x09" } },
    .{ "EngDeleteSurface", MethodRecord{ .library = "GDI32", .import = "EngDeleteSurface", .signature = "\x00\x01\x11\x59\x11\xab\x25" } },
    .{ "EngLockSurface", MethodRecord{ .library = "GDI32", .import = "EngLockSurface", .signature = "\x00\x01\x0f\x11\xab\x01\x11\xab\x25" } },
    .{ "EngUnlockSurface", MethodRecord{ .library = "GDI32", .import = "EngUnlockSurface", .signature = "\x00\x01\x01\x0f\x11\xab\x01" } },
    .{ "EngEraseSurface", MethodRecord{ .library = "GDI32", .import = "EngEraseSurface", .signature = "\x00\x03\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x2d\x09" } },
    .{ "EngAssociateSurface", MethodRecord{ .library = "GDI32", .import = "EngAssociateSurface", .signature = "\x00\x03\x11\x59\x11\xab\x25\x11\xab\x31\x09" } },
    .{ "EngMarkBandingSurface", MethodRecord{ .library = "GDI32", .import = "EngMarkBandingSurface", .signature = "\x00\x01\x11\x59\x11\xab\x25" } },
    .{ "EngCheckAbort", MethodRecord{ .library = "GDI32", .import = "EngCheckAbort", .signature = "\x00\x01\x11\x59\x0f\x11\xab\x01" } },
    .{ "EngDeletePath", MethodRecord{ .library = "GDI32", .import = "EngDeletePath", .signature = "\x00\x01\x01\x0f\x11\xaa\xe1" } },
    .{ "EngCreatePalette", MethodRecord{ .library = "GDI32", .import = "EngCreatePalette", .signature = "\x00\x06\x11\x8d\x65\x09\x09\x0f\x09\x09\x09\x09" } },
    .{ "EngDeletePalette", MethodRecord{ .library = "GDI32", .import = "EngDeletePalette", .signature = "\x00\x01\x11\x59\x11\x8d\x65" } },
    .{ "EngCreateClip", MethodRecord{ .library = "GDI32", .import = "EngCreateClip", .signature = "\x00\x00\x0f\x11\xaa\xdd" } },
    .{ "EngDeleteClip", MethodRecord{ .library = "GDI32", .import = "EngDeleteClip", .signature = "\x00\x01\x01\x0f\x11\xaa\xdd" } },
    .{ "EngBitBlt", MethodRecord{ .library = "GDI32", .import = "EngBitBlt", .signature = "\x00\x0b\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\xab\x2d\x0f\x11\xab\x35\x0f\x11\xab\x35\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x09" } },
    .{ "EngLineTo", MethodRecord{ .library = "GDI32", .import = "EngLineTo", .signature = "\x00\x09\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xaa\xd9\x08\x08\x08\x08\x0f\x11\xab\x2d\x09" } },
    .{ "EngStretchBlt", MethodRecord{ .library = "GDI32", .import = "EngStretchBlt", .signature = "\x00\x0b\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\x8e\x59\x0f\x11\xab\x35\x0f\x11\xab\x2d\x0f\x11\xab\x2d\x0f\x11\xab\x35\x09" } },
    .{ "EngStretchBltROP", MethodRecord{ .library = "GDI32", .import = "EngStretchBltROP", .signature = "\x00\x0d\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\x8e\x59\x0f\x11\xab\x35\x0f\x11\xab\x2d\x0f\x11\xab\x2d\x0f\x11\xab\x35\x09\x0f\x11\xaa\xd9\x09" } },
    .{ "EngAlphaBlend", MethodRecord{ .library = "GDI32", .import = "EngAlphaBlend", .signature = "\x00\x07\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\xab\x2d\x0f\x11\xab\x2d\x0f\x11\xab\x39" } },
    .{ "EngGradientFill", MethodRecord{ .library = "GDI32", .import = "EngGradientFill", .signature = "\x00\x0a\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\x8e\x2d\x09\x0f\x01\x09\x0f\x11\xab\x2d\x0f\x11\xab\x35\x09" } },
    .{ "EngTransparentBlt", MethodRecord{ .library = "GDI32", .import = "EngTransparentBlt", .signature = "\x00\x08\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\xab\x2d\x0f\x11\xab\x2d\x09\x09" } },
    .{ "EngTextOut", MethodRecord{ .library = "GDI32", .import = "EngTextOut", .signature = "\x00\x0a\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x11\x0f\x11\xaa\xe5\x0f\x11\xaa\xdd\x0f\x11\xab\x2d\x0f\x11\xab\x2d\x0f\x11\xaa\xd9\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x09" } },
    .{ "EngStrokePath", MethodRecord{ .library = "GDI32", .import = "EngStrokePath", .signature = "\x00\x08\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xe1\x0f\x11\xaa\xdd\x0f\x11\xaa\xed\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x0f\x11\xab\x05\x09" } },
    .{ "EngFillPath", MethodRecord{ .library = "GDI32", .import = "EngFillPath", .signature = "\x00\x07\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xe1\x0f\x11\xaa\xdd\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x09\x09" } },
    .{ "EngStrokeAndFillPath", MethodRecord{ .library = "GDI32", .import = "EngStrokeAndFillPath", .signature = "\x00\x0a\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xe1\x0f\x11\xaa\xdd\x0f\x11\xaa\xed\x0f\x11\xaa\xd9\x0f\x11\xab\x05\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x09\x09" } },
    .{ "EngPaint", MethodRecord{ .library = "GDI32", .import = "EngPaint", .signature = "\x00\x05\x11\x59\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xaa\xd9\x0f\x11\xab\x35\x09" } },
    .{ "EngCopyBits", MethodRecord{ .library = "GDI32", .import = "EngCopyBits", .signature = "\x00\x06\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\xab\x2d\x0f\x11\xab\x35" } },
    .{ "EngPlgBlt", MethodRecord{ .library = "GDI32", .import = "EngPlgBlt", .signature = "\x00\x0b\x11\x59\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xab\x01\x0f\x11\xaa\xdd\x0f\x11\xab\x21\x0f\x11\x8e\x59\x0f\x11\xab\x35\x0f\x11\xab\x3d\x0f\x11\xab\x2d\x0f\x11\xab\x35\x09" } },
    .{ "HT_Get8BPPFormatPalette", MethodRecord{ .library = "GDI32", .import = "HT_Get8BPPFormatPalette", .signature = "\x00\x04\x08\x0f\x11\x8d\x69\x07\x07\x07" } },
    .{ "HT_Get8BPPMaskPalette", MethodRecord{ .library = "GDI32", .import = "HT_Get8BPPMaskPalette", .signature = "\x00\x06\x08\x0f\x11\x8d\x69\x11\x59\x05\x07\x07\x07" } },
    .{ "EngGetPrinterDataFileName", MethodRecord{ .library = "GDI32", .import = "EngGetPrinterDataFileName", .signature = "\x00\x01\x11\x05\x11\xab\x31" } },
    .{ "EngGetDriverName", MethodRecord{ .library = "GDI32", .import = "EngGetDriverName", .signature = "\x00\x01\x11\x05\x11\xab\x31" } },
    .{ "EngLoadModule", MethodRecord{ .library = "GDI32", .import = "EngLoadModule", .signature = "\x00\x01\x11\x80\x85\x11\x05" } },
    .{ "EngFindResource", MethodRecord{ .library = "GDI32", .import = "EngFindResource", .signature = "\x00\x04\x0f\x01\x11\x80\x85\x08\x08\x0f\x09" } },
    .{ "EngFreeModule", MethodRecord{ .library = "GDI32", .import = "EngFreeModule", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "EngCreateSemaphore", MethodRecord{ .library = "GDI32", .import = "EngCreateSemaphore", .signature = "\x00\x00\x11\xab\x41" } },
    .{ "EngAcquireSemaphore", MethodRecord{ .library = "GDI32", .import = "EngAcquireSemaphore", .signature = "\x00\x01\x01\x11\xab\x41" } },
    .{ "EngReleaseSemaphore", MethodRecord{ .library = "GDI32", .import = "EngReleaseSemaphore", .signature = "\x00\x01\x01\x11\xab\x41" } },
    .{ "EngDeleteSemaphore", MethodRecord{ .library = "GDI32", .import = "EngDeleteSemaphore", .signature = "\x00\x01\x01\x11\xab\x41" } },
    .{ "EngMultiByteToUnicodeN", MethodRecord{ .library = "GDI32", .import = "EngMultiByteToUnicodeN", .signature = "\x00\x05\x01\x11\x05\x09\x0f\x09\x11\x3d\x09" } },
    .{ "EngUnicodeToMultiByteN", MethodRecord{ .library = "GDI32", .import = "EngUnicodeToMultiByteN", .signature = "\x00\x05\x01\x11\x3d\x09\x0f\x09\x11\x05\x09" } },
    .{ "EngQueryLocalTime", MethodRecord{ .library = "GDI32", .import = "EngQueryLocalTime", .signature = "\x00\x01\x01\x0f\x11\xab\x45" } },
    .{ "EngComputeGlyphSet", MethodRecord{ .library = "GDI32", .import = "EngComputeGlyphSet", .signature = "\x00\x03\x0f\x11\xaa\xf5\x08\x08\x08" } },
    .{ "EngMultiByteToWideChar", MethodRecord{ .library = "GDI32", .import = "EngMultiByteToWideChar", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x3d\x08" } },
    .{ "EngWideCharToMultiByte", MethodRecord{ .library = "GDI32", .import = "EngWideCharToMultiByte", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x3d\x08" } },
    .{ "EngGetCurrentCodePage", MethodRecord{ .library = "GDI32", .import = "EngGetCurrentCodePage", .signature = "\x00\x02\x01\x0f\x07\x0f\x07" } },
    .{ "EngQueryEMFInfo", MethodRecord{ .library = "GDI32", .import = "EngQueryEMFInfo", .signature = "\x00\x02\x11\x59\x11\xab\x31\x0f\x11\xab\x49" } },
    .{ "GetDisplayConfigBufferSizes", MethodRecord{ .library = "USER32", .import = "GetDisplayConfigBufferSizes", .signature = "\x00\x03\x11\x81\x01\x11\x8a\x31\x0f\x09\x0f\x09" } },
    .{ "SetDisplayConfig", MethodRecord{ .library = "USER32", .import = "SetDisplayConfig", .signature = "\x00\x05\x08\x09\x0f\x11\xab\x4d\x09\x0f\x11\xab\x51\x11\x8a\x2d" } },
    .{ "QueryDisplayConfig", MethodRecord{ .library = "USER32", .import = "QueryDisplayConfig", .signature = "\x00\x06\x11\x81\x01\x11\x8a\x31\x0f\x09\x0f\x11\xab\x4d\x0f\x09\x0f\x11\xab\x51\x0f\x11\xab\x55" } },
    .{ "DisplayConfigGetDeviceInfo", MethodRecord{ .library = "USER32", .import = "DisplayConfigGetDeviceInfo", .signature = "\x00\x01\x08\x0f\x11\xab\x59" } },
    .{ "DisplayConfigSetDeviceInfo", MethodRecord{ .library = "USER32", .import = "DisplayConfigSetDeviceInfo", .signature = "\x00\x01\x08\x0f\x11\xab\x59" } },
    .{ "GetAutoRotationState", MethodRecord{ .library = "USER32", .import = "GetAutoRotationState", .signature = "\x00\x01\x11\x59\x0f\x11\xab\x5d" } },
    .{ "GetDisplayAutoRotationPreferences", MethodRecord{ .library = "USER32", .import = "GetDisplayAutoRotationPreferences", .signature = "\x00\x01\x11\x59\x0f\x11\xab\x61" } },
    .{ "SetDisplayAutoRotationPreferences", MethodRecord{ .library = "USER32", .import = "SetDisplayAutoRotationPreferences", .signature = "\x00\x01\x11\x59\x11\xab\x61" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x3e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SIZE" },
        0xa2d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "SET_DISPLAY_CONFIG_FLAGS" },
        0xa31 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "QUERY_DISPLAY_CONFIG_FLAGS" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0xd69 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "PALETTEENTRY" },
        0xe2d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TRIVERTEX" },
        0xe59 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "COLORADJUSTMENT" },
        0xeed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMONITOR" },
        0x14dd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D9", .name = "IDirect3DDevice9" },
        0x2ab5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "PHYSICAL_MONITOR" },
        0x2ab9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_VCP_CODE_TYPE" },
        0x2abd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_TIMING_REPORT" },
        0x2ac1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_DISPLAY_TECHNOLOGY_TYPE" },
        0x2ac5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_COLOR_TEMPERATURE" },
        0x2ac9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_DRIVE_TYPE" },
        0x2acd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_GAIN_TYPE" },
        0x2ad1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_SIZE_TYPE" },
        0x2ad5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "MC_POSITION_TYPE" },
        0x2ad9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "BRUSHOBJ" },
        0x2add => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "CLIPOBJ" },
        0x2ae1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "PATHOBJ" },
        0x2ae5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "FONTOBJ" },
        0x2ae9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "FONTINFO" },
        0x2aed => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "XFORMOBJ" },
        0x2af1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "IFIMETRICS" },
        0x2af5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "FD_GLYPHSET" },
        0x2af9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "FD_GLYPHATTR" },
        0x2afd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "PATHDATA" },
        0x2b01 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "SURFOBJ" },
        0x2b05 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "LINEATTRS" },
        0x2b09 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "CLIPLINE" },
        0x2b0d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "RECTFX" },
        0x2b11 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "STROBJ" },
        0x2b15 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "GLYPHPOS" },
        0x2b19 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "POINTQF" },
        0x2b1d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "XFORML" },
        0x2b21 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "XLATEOBJ" },
        0x2b25 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "HSURF" },
        0x2b29 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "DHSURF" },
        0x2b2d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECTL" },
        0x2b31 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "HDEV" },
        0x2b35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINTL" },
        0x2b39 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "BLENDOBJ" },
        0x2b3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "POINTFIX" },
        0x2b41 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "HSEMAPHORE" },
        0x2b45 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "ENG_TIME_FIELDS" },
        0x2b49 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "EMFINFO" },
        0x2b4d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "DISPLAYCONFIG_PATH_INFO" },
        0x2b51 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "DISPLAYCONFIG_MODE_INFO" },
        0x2b55 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "DISPLAYCONFIG_TOPOLOGY_ID" },
        0x2b59 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "DISPLAYCONFIG_DEVICE_INFO_HEADER" },
        0x2b5d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "AR_STATE" },
        0x2b61 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Display", .name = "ORIENTATION_PREFERENCE" },
        else => null,
    };
}

pub const SDC_USE_DATABASE_CURRENT = 15;
pub const SDC_TOPOLOGY_INTERNAL = 1;
pub const SDC_TOPOLOGY_CLONE = 2;
pub const SDC_TOPOLOGY_EXTEND = 4;
pub const SDC_TOPOLOGY_EXTERNAL = 8;
pub const SDC_TOPOLOGY_SUPPLIED = 16;
pub const SDC_USE_SUPPLIED_DISPLAY_CONFIG = 32;
pub const SDC_VALIDATE = 64;
pub const SDC_APPLY = 128;
pub const SDC_NO_OPTIMIZATION = 256;
pub const SDC_SAVE_TO_DATABASE = 512;
pub const SDC_ALLOW_CHANGES = 1024;
pub const SDC_PATH_PERSIST_IF_REQUIRED = 2048;
pub const SDC_FORCE_MODE_ENUMERATION = 4096;
pub const SDC_ALLOW_PATH_ORDER_CHANGES = 8192;
pub const SDC_VIRTUAL_MODE_AWARE = 32768;
pub const SDC_VIRTUAL_REFRESH_RATE_AWARE = 131072;
pub const QDC_ALL_PATHS = 1;
pub const QDC_ONLY_ACTIVE_PATHS = 2;
pub const QDC_DATABASE_CURRENT = 4;
pub const QDC_VIRTUAL_MODE_AWARE = 16;
pub const QDC_INCLUDE_HMD = 32;
pub const QDC_VIRTUAL_REFRESH_RATE_AWARE = 64;
pub const INDIRECT_DISPLAY_INFO_FLAGS_CREATED_IDDCX_ADAPTER = 1;
pub const INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16 = 2;
pub const IOCTL_VIDEO_DISABLE_VDM = 2293764;
pub const IOCTL_VIDEO_REGISTER_VDM = 2293768;
pub const IOCTL_VIDEO_SET_OUTPUT_DEVICE_POWER_STATE = 2293772;
pub const IOCTL_VIDEO_GET_OUTPUT_DEVICE_POWER_STATE = 2293776;
pub const IOCTL_VIDEO_MONITOR_DEVICE = 2293780;
pub const IOCTL_VIDEO_ENUM_MONITOR_PDO = 2293784;
pub const IOCTL_VIDEO_INIT_WIN32K_CALLBACKS = 2293788;
pub const IOCTL_VIDEO_IS_VGA_DEVICE = 2293796;
pub const IOCTL_VIDEO_USE_DEVICE_IN_SESSION = 2293800;
pub const IOCTL_VIDEO_PREPARE_FOR_EARECOVERY = 2293804;
pub const IOCTL_VIDEO_ENABLE_VDM = 2293760;
pub const IOCTL_VIDEO_SAVE_HARDWARE_STATE = 2294272;
pub const IOCTL_VIDEO_RESTORE_HARDWARE_STATE = 2294276;
pub const IOCTL_VIDEO_HANDLE_VIDEOPARAMETERS = 2293792;
pub const IOCTL_VIDEO_QUERY_AVAIL_MODES = 2294784;
pub const IOCTL_VIDEO_QUERY_NUM_AVAIL_MODES = 2294788;
pub const IOCTL_VIDEO_QUERY_CURRENT_MODE = 2294792;
pub const IOCTL_VIDEO_SET_CURRENT_MODE = 2294796;
pub const IOCTL_VIDEO_RESET_DEVICE = 2294800;
pub const IOCTL_VIDEO_LOAD_AND_SET_FONT = 2294804;
pub const IOCTL_VIDEO_SET_PALETTE_REGISTERS = 2294808;
pub const IOCTL_VIDEO_SET_COLOR_REGISTERS = 2294812;
pub const IOCTL_VIDEO_ENABLE_CURSOR = 2294816;
pub const IOCTL_VIDEO_DISABLE_CURSOR = 2294820;
pub const IOCTL_VIDEO_SET_CURSOR_ATTR = 2294824;
pub const IOCTL_VIDEO_QUERY_CURSOR_ATTR = 2294828;
pub const IOCTL_VIDEO_SET_CURSOR_POSITION = 2294832;
pub const IOCTL_VIDEO_QUERY_CURSOR_POSITION = 2294836;
pub const IOCTL_VIDEO_ENABLE_POINTER = 2294840;
pub const IOCTL_VIDEO_DISABLE_POINTER = 2294844;
pub const IOCTL_VIDEO_SET_POINTER_ATTR = 2294848;
pub const IOCTL_VIDEO_QUERY_POINTER_ATTR = 2294852;
pub const IOCTL_VIDEO_SET_POINTER_POSITION = 2294856;
pub const IOCTL_VIDEO_QUERY_POINTER_POSITION = 2294860;
pub const IOCTL_VIDEO_QUERY_POINTER_CAPABILITIES = 2294864;
pub const IOCTL_VIDEO_GET_BANK_SELECT_CODE = 2294868;
pub const IOCTL_VIDEO_MAP_VIDEO_MEMORY = 2294872;
pub const IOCTL_VIDEO_UNMAP_VIDEO_MEMORY = 2294876;
pub const IOCTL_VIDEO_QUERY_PUBLIC_ACCESS_RANGES = 2294880;
pub const IOCTL_VIDEO_FREE_PUBLIC_ACCESS_RANGES = 2294884;
pub const IOCTL_VIDEO_QUERY_COLOR_CAPABILITIES = 2294888;
pub const IOCTL_VIDEO_SET_POWER_MANAGEMENT = 2294892;
pub const IOCTL_VIDEO_GET_POWER_MANAGEMENT = 2294896;
pub const IOCTL_VIDEO_SHARE_VIDEO_MEMORY = 2294900;
pub const IOCTL_VIDEO_UNSHARE_VIDEO_MEMORY = 2294904;
pub const IOCTL_VIDEO_SET_COLOR_LUT_DATA = 2294908;
pub const IOCTL_VIDEO_GET_CHILD_STATE = 2294912;
pub const IOCTL_VIDEO_VALIDATE_CHILD_STATE_CONFIGURATION = 2294916;
pub const IOCTL_VIDEO_SET_CHILD_STATE_CONFIGURATION = 2294920;
pub const IOCTL_VIDEO_SWITCH_DUALVIEW = 2294924;
pub const IOCTL_VIDEO_SET_BANK_POSITION = 2294928;
pub const IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS = 2294932;
pub const IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS = 2294936;
pub const IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS = 2294940;
pub const IOCTL_FSVIDEO_COPY_FRAME_BUFFER = 3409920;
pub const IOCTL_FSVIDEO_WRITE_TO_FRAME_BUFFER = 3409924;
pub const IOCTL_FSVIDEO_REVERSE_MOUSE_POINTER = 3409928;
pub const IOCTL_FSVIDEO_SET_CURRENT_MODE = 3409932;
pub const IOCTL_FSVIDEO_SET_SCREEN_INFORMATION = 3409936;
pub const IOCTL_FSVIDEO_SET_CURSOR_POSITION = 3409940;
pub const IOCTL_PANEL_QUERY_BRIGHTNESS_CAPS = 2296832;
pub const IOCTL_PANEL_QUERY_BRIGHTNESS_RANGES = 2296836;
pub const IOCTL_PANEL_GET_BRIGHTNESS = 2296840;
pub const IOCTL_PANEL_SET_BRIGHTNESS = 2296844;
pub const IOCTL_PANEL_SET_BRIGHTNESS_STATE = 2296848;
pub const IOCTL_PANEL_SET_BACKLIGHT_OPTIMIZATION = 2296852;
pub const IOCTL_PANEL_GET_BACKLIGHT_REDUCTION = 2296856;
pub const IOCTL_PANEL_GET_MANUFACTURING_MODE = 2296860;
pub const IOCTL_COLORSPACE_TRANSFORM_QUERY_TARGET_CAPS = 2297856;
pub const IOCTL_COLORSPACE_TRANSFORM_SET = 2297860;
pub const IOCTL_SET_ACTIVE_COLOR_PROFILE_NAME = 2297864;
pub const IOCTL_GET_SCALAR_MULTIPLIER_CAPS = 2297868;
pub const IOCTL_SET_SCALAR_MULTIPLIER = 2297872;
pub const IOCTL_MIPI_DSI_QUERY_CAPS = 2298880;
pub const IOCTL_MIPI_DSI_TRANSMISSION = 2298884;
pub const IOCTL_MIPI_DSI_RESET = 2298888;
pub const DXGK_WIN32K_PARAM_FLAG_UPDATEREGISTRY = 1;
pub const DXGK_WIN32K_PARAM_FLAG_MODESWITCH = 2;
pub const DXGK_WIN32K_PARAM_FLAG_DISABLEVIEW = 4;
pub const VIDEO_DUALVIEW_REMOVABLE = 1;
pub const VIDEO_DUALVIEW_PRIMARY = 2147483648;
pub const VIDEO_DUALVIEW_SECONDARY = 1073741824;
pub const VIDEO_DUALVIEW_WDDM_VGA = 536870912;
pub const VIDEO_STATE_NON_STANDARD_VGA = 1;
pub const VIDEO_STATE_UNEMULATED_VGA_STATE = 2;
pub const VIDEO_STATE_PACKED_CHAIN4_MODE = 4;
pub const VIDEO_MODE_NO_ZERO_MEMORY = 2147483648;
pub const VIDEO_MODE_MAP_MEM_LINEAR = 1073741824;
pub const VIDEO_MODE_COLOR = 1;
pub const VIDEO_MODE_GRAPHICS = 2;
pub const VIDEO_MODE_PALETTE_DRIVEN = 4;
pub const VIDEO_MODE_MANAGED_PALETTE = 8;
pub const VIDEO_MODE_INTERLACED = 16;
pub const VIDEO_MODE_NO_OFF_SCREEN = 32;
pub const VIDEO_MODE_NO_64_BIT_ACCESS = 64;
pub const VIDEO_MODE_BANKED = 128;
pub const VIDEO_MODE_LINEAR = 256;
pub const VIDEO_MODE_ASYNC_POINTER = 1;
pub const VIDEO_MODE_MONO_POINTER = 2;
pub const VIDEO_MODE_COLOR_POINTER = 4;
pub const VIDEO_MODE_ANIMATE_START = 8;
pub const VIDEO_MODE_ANIMATE_UPDATE = 16;
pub const PLANAR_HC = 1;
pub const VIDEO_DEVICE_COLOR = 1;
pub const VIDEO_OPTIONAL_GAMMET_TABLE = 2;
pub const VIDEO_COLOR_LUT_DATA_FORMAT_RGB256WORDS = 1;
pub const VIDEO_COLOR_LUT_DATA_FORMAT_PRIVATEFORMAT = 2147483648;
pub const DISPLAYPOLICY_AC = 1;
pub const DISPLAYPOLICY_DC = 2;
pub const BITMAP_BITS_BYTE_ALIGN = 8;
pub const BITMAP_BITS_WORD_ALIGN = 16;
pub const BITMAP_ARRAY_BYTE = 3;
pub const BITMAP_PLANES = 1;
pub const BITMAP_BITS_PIXEL = 1;
pub const VIDEO_REASON_NONE = 0;
pub const VIDEO_REASON_POLICY1 = 1;
pub const VIDEO_REASON_POLICY2 = 2;
pub const VIDEO_REASON_POLICY3 = 3;
pub const VIDEO_REASON_POLICY4 = 4;
pub const VIDEO_REASON_LOCK = 5;
pub const VIDEO_REASON_FAILED_ROTATION = 5;
pub const VIDEO_REASON_ALLOCATION = 6;
pub const VIDEO_REASON_SCRATCH = 8;
pub const VIDEO_REASON_CONFIGURATION = 9;
pub const VIDEO_MAX_REASON = 9;
pub const BRIGHTNESS_MAX_LEVEL_COUNT = 103;
pub const BRIGHTNESS_MAX_NIT_RANGE_COUNT = 16;
pub const DSI_PACKET_EMBEDDED_PAYLOAD_SIZE = 8;
pub const MAX_PACKET_COUNT = 128;
pub const DSI_INVALID_PACKET_INDEX = 255;
pub const DSI_SOT_ERROR = 1;
pub const DSI_SOT_SYNC_ERROR = 2;
pub const DSI_EOT_SYNC_ERROR = 4;
pub const DSI_ESCAPE_MODE_ENTRY_COMMAND_ERROR = 8;
pub const DSI_LOW_POWER_TRANSMIT_SYNC_ERROR = 16;
pub const DSI_PERIPHERAL_TIMEOUT_ERROR = 32;
pub const DSI_FALSE_CONTROL_ERROR = 64;
pub const DSI_CONTENTION_DETECTED = 128;
pub const DSI_CHECKSUM_ERROR_CORRECTED = 256;
pub const DSI_CHECKSUM_ERROR_NOT_CORRECTED = 512;
pub const DSI_LONG_PACKET_PAYLOAD_CHECKSUM_ERROR = 1024;
pub const DSI_DSI_DATA_TYPE_NOT_RECOGNIZED = 2048;
pub const DSI_DSI_VC_ID_INVALID = 4096;
pub const DSI_INVALID_TRANSMISSION_LENGTH = 8192;
pub const DSI_DSI_PROTOCOL_VIOLATION = 32768;
pub const HOST_DSI_DEVICE_NOT_READY = 1;
pub const HOST_DSI_INTERFACE_RESET = 2;
pub const HOST_DSI_DEVICE_RESET = 4;
pub const HOST_DSI_TRANSMISSION_CANCELLED = 16;
pub const HOST_DSI_TRANSMISSION_DROPPED = 32;
pub const HOST_DSI_TRANSMISSION_TIMEOUT = 64;
pub const HOST_DSI_INVALID_TRANSMISSION = 256;
pub const HOST_DSI_OS_REJECTED_PACKET = 512;
pub const HOST_DSI_DRIVER_REJECTED_PACKET = 1024;
pub const HOST_DSI_BAD_TRANSMISSION_MODE = 4096;
pub const FD_ERROR = 4294967295;
pub const DDI_ERROR = 4294967295;
pub const FDM_TYPE_BM_SIDE_CONST = 1;
pub const FDM_TYPE_MAXEXT_EQUAL_BM_SIDE = 2;
pub const FDM_TYPE_CHAR_INC_EQUAL_BM_BASE = 4;
pub const FDM_TYPE_ZERO_BEARINGS = 8;
pub const FDM_TYPE_CONST_BEARINGS = 16;
pub const GS_UNICODE_HANDLES = 1;
pub const GS_8BIT_HANDLES = 2;
pub const GS_16BIT_HANDLES = 4;
pub const FM_VERSION_NUMBER = 0;
pub const FM_TYPE_LICENSED = 2;
pub const FM_READONLY_EMBED = 4;
pub const FM_EDITABLE_EMBED = 8;
pub const FM_NO_EMBEDDING = 2;
pub const FM_INFO_TECH_TRUETYPE = 1;
pub const FM_INFO_TECH_BITMAP = 2;
pub const FM_INFO_TECH_STROKE = 4;
pub const FM_INFO_TECH_OUTLINE_NOT_TRUETYPE = 8;
pub const FM_INFO_ARB_XFORMS = 16;
pub const FM_INFO_1BPP = 32;
pub const FM_INFO_4BPP = 64;
pub const FM_INFO_8BPP = 128;
pub const FM_INFO_16BPP = 256;
pub const FM_INFO_24BPP = 512;
pub const FM_INFO_32BPP = 1024;
pub const FM_INFO_INTEGER_WIDTH = 2048;
pub const FM_INFO_CONSTANT_WIDTH = 4096;
pub const FM_INFO_NOT_CONTIGUOUS = 8192;
pub const FM_INFO_TECH_MM = 16384;
pub const FM_INFO_RETURNS_OUTLINES = 32768;
pub const FM_INFO_RETURNS_STROKES = 65536;
pub const FM_INFO_RETURNS_BITMAPS = 131072;
pub const FM_INFO_DSIG = 262144;
pub const FM_INFO_RIGHT_HANDED = 524288;
pub const FM_INFO_INTEGRAL_SCALING = 1048576;
pub const FM_INFO_90DEGREE_ROTATIONS = 2097152;
pub const FM_INFO_OPTICALLY_FIXED_PITCH = 4194304;
pub const FM_INFO_DO_NOT_ENUMERATE = 8388608;
pub const FM_INFO_ISOTROPIC_SCALING_ONLY = 16777216;
pub const FM_INFO_ANISOTROPIC_SCALING_ONLY = 33554432;
pub const FM_INFO_TECH_CFF = 67108864;
pub const FM_INFO_FAMILY_EQUIV = 134217728;
pub const FM_INFO_DBCS_FIXED_PITCH = 268435456;
pub const FM_INFO_NONNEGATIVE_AC = 536870912;
pub const FM_INFO_IGNORE_TC_RA_ABLE = 1073741824;
pub const FM_INFO_TECH_TYPE1 = 2147483648;
pub const MAXCHARSETS = 16;
pub const FM_PANOSE_CULTURE_LATIN = 0;
pub const FM_SEL_ITALIC = 1;
pub const FM_SEL_UNDERSCORE = 2;
pub const FM_SEL_NEGATIVE = 4;
pub const FM_SEL_OUTLINED = 8;
pub const FM_SEL_STRIKEOUT = 16;
pub const FM_SEL_BOLD = 32;
pub const FM_SEL_REGULAR = 64;
pub const FM_SEL_USE_TYPO_METRICS = 128;
pub const OPENGL_CMD = 4352;
pub const OPENGL_GETINFO = 4353;
pub const WNDOBJ_SETUP = 4354;
pub const DDI_DRIVER_VERSION_NT4 = 131072;
pub const DDI_DRIVER_VERSION_SP3 = 131075;
pub const DDI_DRIVER_VERSION_NT5 = 196608;
pub const DDI_DRIVER_VERSION_NT5_01 = 196864;
pub const DDI_DRIVER_VERSION_NT5_01_SP1 = 196865;
pub const GDI_DRIVER_VERSION = 16384;
pub const INDEX_DrvEnablePDEV = 0;
pub const INDEX_DrvCompletePDEV = 1;
pub const INDEX_DrvDisablePDEV = 2;
pub const INDEX_DrvEnableSurface = 3;
pub const INDEX_DrvDisableSurface = 4;
pub const INDEX_DrvAssertMode = 5;
pub const INDEX_DrvOffset = 6;
pub const INDEX_DrvResetPDEV = 7;
pub const INDEX_DrvDisableDriver = 8;
pub const INDEX_DrvCreateDeviceBitmap = 10;
pub const INDEX_DrvDeleteDeviceBitmap = 11;
pub const INDEX_DrvRealizeBrush = 12;
pub const INDEX_DrvDitherColor = 13;
pub const INDEX_DrvStrokePath = 14;
pub const INDEX_DrvFillPath = 15;
pub const INDEX_DrvStrokeAndFillPath = 16;
pub const INDEX_DrvPaint = 17;
pub const INDEX_DrvBitBlt = 18;
pub const INDEX_DrvCopyBits = 19;
pub const INDEX_DrvStretchBlt = 20;
pub const INDEX_DrvSetPalette = 22;
pub const INDEX_DrvTextOut = 23;
pub const INDEX_DrvEscape = 24;
pub const INDEX_DrvDrawEscape = 25;
pub const INDEX_DrvQueryFont = 26;
pub const INDEX_DrvQueryFontTree = 27;
pub const INDEX_DrvQueryFontData = 28;
pub const INDEX_DrvSetPointerShape = 29;
pub const INDEX_DrvMovePointer = 30;
pub const INDEX_DrvLineTo = 31;
pub const INDEX_DrvSendPage = 32;
pub const INDEX_DrvStartPage = 33;
pub const INDEX_DrvEndDoc = 34;
pub const INDEX_DrvStartDoc = 35;
pub const INDEX_DrvGetGlyphMode = 37;
pub const INDEX_DrvSynchronize = 38;
pub const INDEX_DrvSaveScreenBits = 40;
pub const INDEX_DrvGetModes = 41;
pub const INDEX_DrvFree = 42;
pub const INDEX_DrvDestroyFont = 43;
pub const INDEX_DrvQueryFontCaps = 44;
pub const INDEX_DrvLoadFontFile = 45;
pub const INDEX_DrvUnloadFontFile = 46;
pub const INDEX_DrvFontManagement = 47;
pub const INDEX_DrvQueryTrueTypeTable = 48;
pub const INDEX_DrvQueryTrueTypeOutline = 49;
pub const INDEX_DrvGetTrueTypeFile = 50;
pub const INDEX_DrvQueryFontFile = 51;
pub const INDEX_DrvMovePanning = 52;
pub const INDEX_DrvQueryAdvanceWidths = 53;
pub const INDEX_DrvSetPixelFormat = 54;
pub const INDEX_DrvDescribePixelFormat = 55;
pub const INDEX_DrvSwapBuffers = 56;
pub const INDEX_DrvStartBanding = 57;
pub const INDEX_DrvNextBand = 58;
pub const INDEX_DrvGetDirectDrawInfo = 59;
pub const INDEX_DrvEnableDirectDraw = 60;
pub const INDEX_DrvDisableDirectDraw = 61;
pub const INDEX_DrvQuerySpoolType = 62;
pub const INDEX_DrvIcmCreateColorTransform = 64;
pub const INDEX_DrvIcmDeleteColorTransform = 65;
pub const INDEX_DrvIcmCheckBitmapBits = 66;
pub const INDEX_DrvIcmSetDeviceGammaRamp = 67;
pub const INDEX_DrvGradientFill = 68;
pub const INDEX_DrvStretchBltROP = 69;
pub const INDEX_DrvPlgBlt = 70;
pub const INDEX_DrvAlphaBlend = 71;
pub const INDEX_DrvSynthesizeFont = 72;
pub const INDEX_DrvGetSynthesizedFontFiles = 73;
pub const INDEX_DrvTransparentBlt = 74;
pub const INDEX_DrvQueryPerBandInfo = 75;
pub const INDEX_DrvQueryDeviceSupport = 76;
pub const INDEX_DrvReserved1 = 77;
pub const INDEX_DrvReserved2 = 78;
pub const INDEX_DrvReserved3 = 79;
pub const INDEX_DrvReserved4 = 80;
pub const INDEX_DrvReserved5 = 81;
pub const INDEX_DrvReserved6 = 82;
pub const INDEX_DrvReserved7 = 83;
pub const INDEX_DrvReserved8 = 84;
pub const INDEX_DrvDeriveSurface = 85;
pub const INDEX_DrvQueryGlyphAttrs = 86;
pub const INDEX_DrvNotify = 87;
pub const INDEX_DrvSynchronizeSurface = 88;
pub const INDEX_DrvResetDevice = 89;
pub const INDEX_DrvReserved9 = 90;
pub const INDEX_DrvReserved10 = 91;
pub const INDEX_DrvReserved11 = 92;
pub const INDEX_DrvRenderHint = 93;
pub const INDEX_DrvCreateDeviceBitmapEx = 94;
pub const INDEX_DrvDeleteDeviceBitmapEx = 95;
pub const INDEX_DrvAssociateSharedSurface = 96;
pub const INDEX_DrvSynchronizeRedirectionBitmaps = 97;
pub const INDEX_DrvAccumulateD3DDirtyRect = 98;
pub const INDEX_DrvStartDxInterop = 99;
pub const INDEX_DrvEndDxInterop = 100;
pub const INDEX_DrvLockDisplayArea = 101;
pub const INDEX_DrvUnlockDisplayArea = 102;
pub const INDEX_DrvSurfaceComplete = 103;
pub const INDEX_LAST = 89;
pub const GCAPS_BEZIERS = 1;
pub const GCAPS_GEOMETRICWIDE = 2;
pub const GCAPS_ALTERNATEFILL = 4;
pub const GCAPS_WINDINGFILL = 8;
pub const GCAPS_HALFTONE = 16;
pub const GCAPS_COLOR_DITHER = 32;
pub const GCAPS_HORIZSTRIKE = 64;
pub const GCAPS_VERTSTRIKE = 128;
pub const GCAPS_OPAQUERECT = 256;
pub const GCAPS_VECTORFONT = 512;
pub const GCAPS_MONO_DITHER = 1024;
pub const GCAPS_ASYNCCHANGE = 2048;
pub const GCAPS_ASYNCMOVE = 4096;
pub const GCAPS_DONTJOURNAL = 8192;
pub const GCAPS_DIRECTDRAW = 16384;
pub const GCAPS_ARBRUSHOPAQUE = 32768;
pub const GCAPS_PANNING = 65536;
pub const GCAPS_HIGHRESTEXT = 262144;
pub const GCAPS_PALMANAGED = 524288;
pub const GCAPS_DITHERONREALIZE = 2097152;
pub const GCAPS_NO64BITMEMACCESS = 4194304;
pub const GCAPS_FORCEDITHER = 8388608;
pub const GCAPS_GRAY16 = 16777216;
pub const GCAPS_ICM = 33554432;
pub const GCAPS_CMYKCOLOR = 67108864;
pub const GCAPS_LAYERED = 134217728;
pub const GCAPS_ARBRUSHTEXT = 268435456;
pub const GCAPS_SCREENPRECISION = 536870912;
pub const GCAPS_FONT_RASTERIZER = 1073741824;
pub const GCAPS_NUP = 2147483648;
pub const GCAPS2_JPEGSRC = 1;
pub const GCAPS2_xxxx = 2;
pub const GCAPS2_PNGSRC = 8;
pub const GCAPS2_CHANGEGAMMARAMP = 16;
pub const GCAPS2_ALPHACURSOR = 32;
pub const GCAPS2_SYNCFLUSH = 64;
pub const GCAPS2_SYNCTIMER = 128;
pub const GCAPS2_ICD_MULTIMON = 256;
pub const GCAPS2_MOUSETRAILS = 512;
pub const GCAPS2_RESERVED1 = 1024;
pub const GCAPS2_REMOTEDRIVER = 1024;
pub const GCAPS2_EXCLUDELAYERED = 2048;
pub const GCAPS2_INCLUDEAPIBITMAPS = 4096;
pub const GCAPS2_SHOWHIDDENPOINTER = 8192;
pub const GCAPS2_CLEARTYPE = 16384;
pub const GCAPS2_ACC_DRIVER = 32768;
pub const GCAPS2_BITMAPEXREUSE = 65536;
pub const LA_GEOMETRIC = 1;
pub const LA_ALTERNATE = 2;
pub const LA_STARTGAP = 4;
pub const LA_STYLED = 8;
pub const JOIN_ROUND = 0;
pub const JOIN_BEVEL = 1;
pub const JOIN_MITER = 2;
pub const ENDCAP_ROUND = 0;
pub const ENDCAP_SQUARE = 1;
pub const ENDCAP_BUTT = 2;
pub const PRIMARY_ORDER_ABC = 0;
pub const PRIMARY_ORDER_ACB = 1;
pub const PRIMARY_ORDER_BAC = 2;
pub const PRIMARY_ORDER_BCA = 3;
pub const PRIMARY_ORDER_CBA = 4;
pub const PRIMARY_ORDER_CAB = 5;
pub const HT_PATSIZE_2x2 = 0;
pub const HT_PATSIZE_2x2_M = 1;
pub const HT_PATSIZE_4x4 = 2;
pub const HT_PATSIZE_4x4_M = 3;
pub const HT_PATSIZE_6x6 = 4;
pub const HT_PATSIZE_6x6_M = 5;
pub const HT_PATSIZE_8x8 = 6;
pub const HT_PATSIZE_8x8_M = 7;
pub const HT_PATSIZE_10x10 = 8;
pub const HT_PATSIZE_10x10_M = 9;
pub const HT_PATSIZE_12x12 = 10;
pub const HT_PATSIZE_12x12_M = 11;
pub const HT_PATSIZE_14x14 = 12;
pub const HT_PATSIZE_14x14_M = 13;
pub const HT_PATSIZE_16x16 = 14;
pub const HT_PATSIZE_16x16_M = 15;
pub const HT_PATSIZE_SUPERCELL = 16;
pub const HT_PATSIZE_SUPERCELL_M = 17;
pub const HT_PATSIZE_USER = 18;
pub const HT_PATSIZE_MAX_INDEX = 18;
pub const HT_PATSIZE_DEFAULT = 17;
pub const HT_USERPAT_CX_MIN = 4;
pub const HT_USERPAT_CX_MAX = 256;
pub const HT_USERPAT_CY_MIN = 4;
pub const HT_USERPAT_CY_MAX = 256;
pub const HT_FORMAT_1BPP = 0;
pub const HT_FORMAT_4BPP = 2;
pub const HT_FORMAT_4BPP_IRGB = 3;
pub const HT_FORMAT_8BPP = 4;
pub const HT_FORMAT_16BPP = 5;
pub const HT_FORMAT_24BPP = 6;
pub const HT_FORMAT_32BPP = 7;
pub const WINDDI_MAX_BROADCAST_CONTEXT = 64;
pub const HT_FLAG_SQUARE_DEVICE_PEL = 1;
pub const HT_FLAG_HAS_BLACK_DYE = 2;
pub const HT_FLAG_ADDITIVE_PRIMS = 4;
pub const HT_FLAG_USE_8BPP_BITMASK = 8;
pub const HT_FLAG_INK_HIGH_ABSORPTION = 16;
pub const HT_FLAG_INK_ABSORPTION_INDICES = 96;
pub const HT_FLAG_DO_DEVCLR_XFORM = 128;
pub const HT_FLAG_OUTPUT_CMY = 256;
pub const HT_FLAG_PRINT_DRAFT_MODE = 512;
pub const HT_FLAG_INVERT_8BPP_BITMASK_IDX = 1024;
pub const HT_FLAG_8BPP_CMY332_MASK = 4278190080;
pub const HT_FLAG_INK_ABSORPTION_IDX0 = 0;
pub const HT_FLAG_INK_ABSORPTION_IDX1 = 32;
pub const HT_FLAG_INK_ABSORPTION_IDX2 = 64;
pub const HT_FLAG_INK_ABSORPTION_IDX3 = 96;
pub const HT_FLAG_NORMAL_INK_ABSORPTION = 0;
pub const HT_FLAG_LOW_INK_ABSORPTION = 32;
pub const HT_FLAG_LOWER_INK_ABSORPTION = 64;
pub const HT_FLAG_LOWEST_INK_ABSORPTION = 96;
pub const PPC_DEFAULT = 0;
pub const PPC_UNDEFINED = 1;
pub const PPC_RGB_ORDER_VERTICAL_STRIPES = 2;
pub const PPC_BGR_ORDER_VERTICAL_STRIPES = 3;
pub const PPC_RGB_ORDER_HORIZONTAL_STRIPES = 4;
pub const PPC_BGR_ORDER_HORIZONTAL_STRIPES = 5;
pub const PPG_DEFAULT = 0;
pub const PPG_SRGB = 1;
pub const BR_DEVICE_ICM = 1;
pub const BR_HOST_ICM = 2;
pub const BR_CMYKCOLOR = 4;
pub const BR_ORIGCOLOR = 8;
pub const FO_SIM_BOLD = 8192;
pub const FO_SIM_ITALIC = 16384;
pub const FO_EM_HEIGHT = 32768;
pub const FO_GRAY16 = 65536;
pub const FO_NOGRAY16 = 131072;
pub const FO_NOHINTS = 262144;
pub const FO_NO_CHOICE = 524288;
pub const FO_CFF = 1048576;
pub const FO_POSTSCRIPT = 2097152;
pub const FO_MULTIPLEMASTER = 4194304;
pub const FO_VERT_FACE = 8388608;
pub const FO_DBCS_FONT = 16777216;
pub const FO_NOCLEARTYPE = 33554432;
pub const FO_CLEARTYPE_X = 268435456;
pub const FO_CLEARTYPE_Y = 536870912;
pub const FO_CLEARTYPENATURAL_X = 1073741824;
pub const DC_TRIVIAL = 0;
pub const DC_RECT = 1;
pub const DC_COMPLEX = 3;
pub const FC_RECT = 1;
pub const FC_RECT4 = 2;
pub const FC_COMPLEX = 3;
pub const TC_RECTANGLES = 0;
pub const TC_PATHOBJ = 2;
pub const OC_BANK_CLIP = 1;
pub const CT_RECTANGLES = 0;
pub const CD_RIGHTDOWN = 0;
pub const CD_LEFTDOWN = 1;
pub const CD_RIGHTUP = 2;
pub const CD_LEFTUP = 3;
pub const CD_ANY = 4;
pub const CD_LEFTWARDS = 1;
pub const CD_UPWARDS = 2;
pub const FO_HGLYPHS = 0;
pub const FO_GLYPHBITS = 1;
pub const FO_PATHOBJ = 2;
pub const FD_NEGATIVE_FONT = 1;
pub const FO_DEVICE_FONT = 1;
pub const FO_OUTLINE_CAPABLE = 2;
pub const SO_FLAG_DEFAULT_PLACEMENT = 1;
pub const SO_HORIZONTAL = 2;
pub const SO_VERTICAL = 4;
pub const SO_REVERSED = 8;
pub const SO_ZERO_BEARINGS = 16;
pub const SO_CHAR_INC_EQUAL_BM_BASE = 32;
pub const SO_MAXEXT_EQUAL_BM_SIDE = 64;
pub const SO_DO_NOT_SUBSTITUTE_DEVICE_FONT = 128;
pub const SO_GLYPHINDEX_TEXTOUT = 256;
pub const SO_ESC_NOT_ORIENT = 512;
pub const SO_DXDY = 1024;
pub const SO_CHARACTER_EXTRA = 2048;
pub const SO_BREAK_EXTRA = 4096;
pub const FO_ATTR_MODE_ROTATE = 1;
pub const PAL_INDEXED = 1;
pub const PAL_BITFIELDS = 2;
pub const PAL_RGB = 4;
pub const PAL_BGR = 8;
pub const PAL_CMYK = 16;
pub const PO_BEZIERS = 1;
pub const PO_ELLIPSE = 2;
pub const PO_ALL_INTEGERS = 4;
pub const PO_ENUM_AS_INTEGERS = 8;
pub const PO_WIDENED = 16;
pub const PD_BEGINSUBPATH = 1;
pub const PD_ENDSUBPATH = 2;
pub const PD_RESETSTYLE = 4;
pub const PD_CLOSEFIGURE = 8;
pub const PD_BEZIERS = 16;
pub const SGI_EXTRASPACE = 0;
pub const STYPE_BITMAP = 0;
pub const STYPE_DEVBITMAP = 3;
pub const BMF_1BPP = 1;
pub const BMF_4BPP = 2;
pub const BMF_8BPP = 3;
pub const BMF_16BPP = 4;
pub const BMF_24BPP = 5;
pub const BMF_32BPP = 6;
pub const BMF_4RLE = 7;
pub const BMF_8RLE = 8;
pub const BMF_JPEG = 9;
pub const BMF_PNG = 10;
pub const BMF_TOPDOWN = 1;
pub const BMF_NOZEROINIT = 2;
pub const BMF_DONTCACHE = 4;
pub const BMF_USERMEM = 8;
pub const BMF_KMSECTION = 16;
pub const BMF_NOTSYSMEM = 32;
pub const BMF_WINDOW_BLT = 64;
pub const BMF_UMPDMEM = 128;
pub const BMF_TEMP_ALPHA = 256;
pub const BMF_ACC_NOTIFY = 32768;
pub const BMF_RMT_ENTER = 16384;
pub const BMF_RESERVED = 15872;
pub const GX_IDENTITY = 0;
pub const GX_OFFSET = 1;
pub const GX_SCALE = 2;
pub const GX_GENERAL = 3;
pub const XF_LTOL = 0;
pub const XF_INV_LTOL = 1;
pub const XF_LTOFX = 2;
pub const XF_INV_FXTOL = 3;
pub const XO_TRIVIAL = 1;
pub const XO_TABLE = 2;
pub const XO_TO_MONO = 4;
pub const XO_FROM_CMYK = 8;
pub const XO_DEVICE_ICM = 16;
pub const XO_HOST_ICM = 32;
pub const XO_SRCPALETTE = 1;
pub const XO_DESTPALETTE = 2;
pub const XO_DESTDCPALETTE = 3;
pub const XO_SRCBITFIELDS = 4;
pub const XO_DESTBITFIELDS = 5;
pub const HOOK_BITBLT = 1;
pub const HOOK_STRETCHBLT = 2;
pub const HOOK_PLGBLT = 4;
pub const HOOK_TEXTOUT = 8;
pub const HOOK_PAINT = 16;
pub const HOOK_STROKEPATH = 32;
pub const HOOK_FILLPATH = 64;
pub const HOOK_STROKEANDFILLPATH = 128;
pub const HOOK_LINETO = 256;
pub const HOOK_COPYBITS = 1024;
pub const HOOK_MOVEPANNING = 2048;
pub const HOOK_SYNCHRONIZE = 4096;
pub const HOOK_STRETCHBLTROP = 8192;
pub const HOOK_SYNCHRONIZEACCESS = 16384;
pub const HOOK_TRANSPARENTBLT = 32768;
pub const HOOK_ALPHABLEND = 65536;
pub const HOOK_GRADIENTFILL = 131072;
pub const HOOK_FLAGS = 243199;
pub const MS_NOTSYSTEMMEMORY = 1;
pub const MS_SHAREDACCESS = 2;
pub const MS_CDDDEVICEBITMAP = 4;
pub const MS_REUSEDDEVICEBITMAP = 8;
pub const DRVQUERY_USERMODE = 1;
pub const HS_DDI_MAX = 6;
pub const DRD_SUCCESS = 0;
pub const DRD_ERROR = 1;
pub const SS_SAVE = 0;
pub const SS_RESTORE = 1;
pub const SS_FREE = 2;
pub const CDBEX_REDIRECTION = 1;
pub const CDBEX_DXINTEROP = 2;
pub const CDBEX_NTSHAREDSURFACEHANDLE = 4;
pub const CDBEX_CROSSADAPTER = 8;
pub const CDBEX_REUSE = 16;
pub const WINDDI_MAXSETPALETTECOLORS = 256;
pub const WINDDI_MAXSETPALETTECOLORINDEX = 255;
pub const DM_DEFAULT = 1;
pub const DM_MONOCHROME = 2;
pub const DCR_SOLID = 0;
pub const DCR_DRIVER = 1;
pub const DCR_HALFTONE = 2;
pub const RB_DITHERCOLOR = -2147483648;
pub const QFT_LIGATURES = 1;
pub const QFT_KERNPAIRS = 2;
pub const QFT_GLYPHSET = 3;
pub const QFD_GLYPHANDBITMAP = 1;
pub const QFD_GLYPHANDOUTLINE = 2;
pub const QFD_MAXEXTENTS = 3;
pub const QFD_TT_GLYPHANDBITMAP = 4;
pub const QFD_TT_GRAY1_BITMAP = 5;
pub const QFD_TT_GRAY2_BITMAP = 6;
pub const QFD_TT_GRAY4_BITMAP = 8;
pub const QFD_TT_GRAY8_BITMAP = 9;
pub const QFD_TT_MONO_BITMAP = 5;
pub const QC_OUTLINES = 1;
pub const QC_1BIT = 2;
pub const QC_4BIT = 4;
pub const FF_SIGNATURE_VERIFIED = 1;
pub const FF_IGNORED_SIGNATURE = 2;
pub const QAW_GETWIDTHS = 0;
pub const QAW_GETEASYWIDTHS = 1;
pub const TTO_METRICS_ONLY = 1;
pub const TTO_QUBICS = 2;
pub const TTO_UNHINTED = 4;
pub const QFF_DESCRIPTION = 1;
pub const QFF_NUMFACES = 2;
pub const FP_ALTERNATEMODE = 1;
pub const FP_WINDINGMODE = 2;
pub const SPS_ERROR = 0;
pub const SPS_DECLINE = 1;
pub const SPS_ACCEPT_NOEXCLUDE = 2;
pub const SPS_ACCEPT_EXCLUDE = 3;
pub const SPS_ACCEPT_SYNCHRONOUS = 4;
pub const SPS_CHANGE = 1;
pub const SPS_ASYNCCHANGE = 2;
pub const SPS_ANIMATESTART = 4;
pub const SPS_ANIMATEUPDATE = 8;
pub const SPS_ALPHA = 16;
pub const SPS_RESERVED = 32;
pub const SPS_RESERVED1 = 64;
pub const SPS_FLAGSMASK = 255;
pub const SPS_LENGTHMASK = 3840;
pub const SPS_FREQMASK = 1044480;
pub const ED_ABORTDOC = 1;
pub const IGRF_RGB_256BYTES = 0;
pub const IGRF_RGB_256WORDS = 1;
pub const QDS_CHECKJPEGFORMAT = 0;
pub const QDS_CHECKPNGFORMAT = 1;
pub const DSS_TIMER_EVENT = 1;
pub const DSS_FLUSH_EVENT = 2;
pub const DSS_RESERVED = 4;
pub const DSS_RESERVED1 = 8;
pub const DSS_RESERVED2 = 16;
pub const DN_ACCELERATION_LEVEL = 1;
pub const DN_DEVICE_ORIGIN = 2;
pub const DN_SLEEP_MODE = 3;
pub const DN_DRAWING_BEGIN = 4;
pub const DN_ASSOCIATE_WINDOW = 5;
pub const DN_COMPOSITION_CHANGED = 6;
pub const DN_DRAWING_BEGIN_APIBITMAP = 7;
pub const DN_SURFOBJ_DESTRUCTION = 8;
pub const WOC_RGN_CLIENT_DELTA = 1;
pub const WOC_RGN_CLIENT = 2;
pub const WOC_RGN_SURFACE_DELTA = 4;
pub const WOC_RGN_SURFACE = 8;
pub const WOC_CHANGED = 16;
pub const WOC_DELETE = 32;
pub const WOC_DRAWN = 64;
pub const WOC_SPRITE_OVERLAP = 128;
pub const WOC_SPRITE_NO_OVERLAP = 256;
pub const WOC_RGN_SPRITE = 512;
pub const WO_RGN_CLIENT_DELTA = 1;
pub const WO_RGN_CLIENT = 2;
pub const WO_RGN_SURFACE_DELTA = 4;
pub const WO_RGN_SURFACE = 8;
pub const WO_RGN_UPDATE_ALL = 16;
pub const WO_RGN_WINDOW = 32;
pub const WO_DRAW_NOTIFY = 64;
pub const WO_SPRITE_NOTIFY = 128;
pub const WO_RGN_DESKTOP_COORD = 256;
pub const WO_RGN_SPRITE = 512;
pub const EHN_RESTORED = 0;
pub const EHN_ERROR = 1;
pub const ECS_TEARDOWN = 1;
pub const ECS_REDRAW = 2;
pub const DEVHTADJF_COLOR_DEVICE = 1;
pub const DEVHTADJF_ADDITIVE_DEVICE = 2;
pub const FL_ZERO_MEMORY = 1;
pub const FL_NONPAGED_MEMORY = 2;
pub const FL_NON_SESSION = 4;
pub const QSA_MMX = 256;
pub const QSA_SSE = 8192;
pub const QSA_3DNOW = 16384;
pub const QSA_SSE1 = 8192;
pub const QSA_SSE2 = 65536;
pub const QSA_SSE3 = 524288;
pub const ENG_FNT_CACHE_READ_FAULT = 1;
pub const ENG_FNT_CACHE_WRITE_FAULT = 2;
pub const DRH_APIBITMAP = 1;
pub const MC_CAPS_NONE = 0;
pub const MC_CAPS_MONITOR_TECHNOLOGY_TYPE = 1;
pub const MC_CAPS_BRIGHTNESS = 2;
pub const MC_CAPS_CONTRAST = 4;
pub const MC_CAPS_COLOR_TEMPERATURE = 8;
pub const MC_CAPS_RED_GREEN_BLUE_GAIN = 16;
pub const MC_CAPS_RED_GREEN_BLUE_DRIVE = 32;
pub const MC_CAPS_DEGAUSS = 64;
pub const MC_CAPS_DISPLAY_AREA_POSITION = 128;
pub const MC_CAPS_DISPLAY_AREA_SIZE = 256;
pub const MC_CAPS_RESTORE_FACTORY_DEFAULTS = 1024;
pub const MC_CAPS_RESTORE_FACTORY_COLOR_DEFAULTS = 2048;
pub const MC_RESTORE_FACTORY_DEFAULTS_ENABLES_MONITOR_SETTINGS = 4096;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_NONE = 0;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_4000K = 1;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_5000K = 2;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_6500K = 4;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_7500K = 8;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_8200K = 16;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_9300K = 32;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_10000K = 64;
pub const MC_SUPPORTED_COLOR_TEMPERATURE_11500K = 128;
pub const PHYSICAL_MONITOR_DESCRIPTION_SIZE = 128;
pub const GETCONNECTEDIDS_TARGET = 0;
pub const GETCONNECTEDIDS_SOURCE = 1;
pub const S_INIT = 2;
pub const SETCONFIGURATION_STATUS_APPLIED = 0;
pub const SETCONFIGURATION_STATUS_ADDITIONAL = 1;
pub const SETCONFIGURATION_STATUS_OVERRIDDEN = 2;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER = -1;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15 = 0;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO = 1;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO = 2;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO = 3;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI = 4;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI = 5;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS = 6;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN = 8;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI = 9;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL = 10;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED = 11;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL = 12;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED = 13;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE = 14;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST = 15;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED = 16;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL = 17;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL = 18;
pub const DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL = -2147483648;
pub const DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED = 0;
pub const DISPLAYCONFIG_SCANLINE_ORDERING_PROGRESSIVE = 1;
pub const DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED = 2;
pub const DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_UPPERFIELDFIRST = 2;
pub const DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_LOWERFIELDFIRST = 3;
pub const DISPLAYCONFIG_SCALING_IDENTITY = 1;
pub const DISPLAYCONFIG_SCALING_CENTERED = 2;
pub const DISPLAYCONFIG_SCALING_STRETCHED = 3;
pub const DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX = 4;
pub const DISPLAYCONFIG_SCALING_CUSTOM = 5;
pub const DISPLAYCONFIG_SCALING_PREFERRED = 128;
pub const DISPLAYCONFIG_ROTATION_IDENTITY = 1;
pub const DISPLAYCONFIG_ROTATION_ROTATE90 = 2;
pub const DISPLAYCONFIG_ROTATION_ROTATE180 = 3;
pub const DISPLAYCONFIG_ROTATION_ROTATE270 = 4;
pub const DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE = 1;
pub const DISPLAYCONFIG_MODE_INFO_TYPE_TARGET = 2;
pub const DISPLAYCONFIG_MODE_INFO_TYPE_DESKTOP_IMAGE = 3;
pub const DISPLAYCONFIG_PIXELFORMAT_8BPP = 1;
pub const DISPLAYCONFIG_PIXELFORMAT_16BPP = 2;
pub const DISPLAYCONFIG_PIXELFORMAT_24BPP = 3;
pub const DISPLAYCONFIG_PIXELFORMAT_32BPP = 4;
pub const DISPLAYCONFIG_PIXELFORMAT_NONGDI = 5;
pub const DISPLAYCONFIG_TOPOLOGY_INTERNAL = 1;
pub const DISPLAYCONFIG_TOPOLOGY_CLONE = 2;
pub const DISPLAYCONFIG_TOPOLOGY_EXTEND = 4;
pub const DISPLAYCONFIG_TOPOLOGY_EXTERNAL = 8;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME = 1;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME = 2;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE = 3;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME = 4;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE = 5;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE = 6;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_SUPPORT_VIRTUAL_RESOLUTION = 7;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_SUPPORT_VIRTUAL_RESOLUTION = 8;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO = 9;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE = 10;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL = 11;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_MONITOR_SPECIALIZATION = 12;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_MONITOR_SPECIALIZATION = 13;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_RESERVED1 = 14;
pub const DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO_2 = 15;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_HDR_STATE = 16;
pub const DISPLAYCONFIG_DEVICE_INFO_SET_WCG_STATE = 17;
pub const MC_MOMENTARY = 0;
pub const MC_SET_PARAMETER = 1;
pub const MC_SHADOW_MASK_CATHODE_RAY_TUBE = 0;
pub const MC_APERTURE_GRILL_CATHODE_RAY_TUBE = 1;
pub const MC_THIN_FILM_TRANSISTOR = 2;
pub const MC_LIQUID_CRYSTAL_ON_SILICON = 3;
pub const MC_PLASMA = 4;
pub const MC_ORGANIC_LIGHT_EMITTING_DIODE = 5;
pub const MC_ELECTROLUMINESCENT = 6;
pub const MC_MICROELECTROMECHANICAL = 7;
pub const MC_FIELD_EMISSION_DEVICE = 8;
pub const MC_RED_DRIVE = 0;
pub const MC_GREEN_DRIVE = 1;
pub const MC_BLUE_DRIVE = 2;
pub const MC_RED_GAIN = 0;
pub const MC_GREEN_GAIN = 1;
pub const MC_BLUE_GAIN = 2;
pub const MC_HORIZONTAL_POSITION = 0;
pub const MC_VERTICAL_POSITION = 1;
pub const MC_WIDTH = 0;
pub const MC_HEIGHT = 1;
pub const MC_COLOR_TEMPERATURE_UNKNOWN = 0;
pub const MC_COLOR_TEMPERATURE_4000K = 1;
pub const MC_COLOR_TEMPERATURE_5000K = 2;
pub const MC_COLOR_TEMPERATURE_6500K = 3;
pub const MC_COLOR_TEMPERATURE_7500K = 4;
pub const MC_COLOR_TEMPERATURE_8200K = 5;
pub const MC_COLOR_TEMPERATURE_9300K = 6;
pub const MC_COLOR_TEMPERATURE_10000K = 7;
pub const MC_COLOR_TEMPERATURE_11500K = 8;
pub const EngProcessorFeature = 1;
pub const EngNumberOfProcessors = 2;
pub const EngOptimumAvailableUserMemory = 3;
pub const EngOptimumAvailableSystemMemory = 4;
pub const QDA_RESERVED = 0;
pub const QDA_ACCELERATION_LEVEL = 1;
pub const VideoPowerNotifyCallout = 1;
pub const VideoEnumChildPdoNotifyCallout = 3;
pub const VideoFindAdapterCallout = 4;
pub const VideoPnpNotifyCallout = 7;
pub const VideoDxgkDisplaySwitchCallout = 8;
pub const VideoDxgkFindAdapterTdrCallout = 10;
pub const VideoDxgkHardwareProtectionTeardown = 11;
pub const VideoRepaintDesktop = 12;
pub const VideoUpdateCursor = 13;
pub const VideoDisableMultiPlaneOverlay = 14;
pub const VideoDesktopDuplicationChange = 15;
pub const VideoBlackScreenDiagnostics = 16;
pub const VideoForceCompositionRender = 17;
pub const BlackScreenDiagnosticsData = 1;
pub const BlackScreenDisplayRecovery = 2;
pub const VideoNotBanked = 0;
pub const VideoBanked1RW = 1;
pub const VideoBanked1R1W = 2;
pub const VideoBanked2RW = 3;
pub const NumVideoBankTypes = 4;
pub const VideoPowerUnspecified = 0;
pub const VideoPowerOn = 1;
pub const VideoPowerStandBy = 2;
pub const VideoPowerSuspend = 3;
pub const VideoPowerOff = 4;
pub const VideoPowerHibernate = 5;
pub const VideoPowerShutdown = 6;
pub const VideoPowerMaximum = 7;
pub const BRIGHTNESS_INTERFACE_VERSION_1 = 1;
pub const BRIGHTNESS_INTERFACE_VERSION_2 = 2;
pub const BRIGHTNESS_INTERFACE_VERSION_3 = 3;
pub const BacklightOptimizationDisable = 0;
pub const BacklightOptimizationDesktop = 1;
pub const BacklightOptimizationDynamic = 2;
pub const BacklightOptimizationDimmed = 3;
pub const BacklightOptimizationEDR = 4;
pub const COLORSPACE_TRANSFORM_DATA_TYPE_FIXED_POINT = 0;
pub const COLORSPACE_TRANSFORM_DATA_TYPE_FLOAT = 1;
pub const COLORSPACE_TRANSFORM_VERSION_DEFAULT = 0;
pub const COLORSPACE_TRANSFORM_VERSION_1 = 1;
pub const COLORSPACE_TRANSFORM_VERSION_NOT_SUPPORTED = 0;
pub const COLORSPACE_TRANSFORM_TYPE_UNINITIALIZED = 0;
pub const COLORSPACE_TRANSFORM_TYPE_DEFAULT = 1;
pub const COLORSPACE_TRANSFORM_TYPE_RGB256x3x16 = 2;
pub const COLORSPACE_TRANSFORM_TYPE_DXGI_1 = 3;
pub const COLORSPACE_TRANSFORM_TYPE_MATRIX_3x4 = 4;
pub const COLORSPACE_TRANSFORM_TYPE_MATRIX_V2 = 5;
pub const OUTPUT_WIRE_COLOR_SPACE_G22_P709 = 0;
pub const OUTPUT_WIRE_COLOR_SPACE_RESERVED = 4;
pub const OUTPUT_WIRE_COLOR_SPACE_G2084_P2020 = 12;
pub const OUTPUT_WIRE_COLOR_SPACE_G22_P709_WCG = 30;
pub const OUTPUT_WIRE_COLOR_SPACE_G22_P2020 = 31;
pub const OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_HDR10PLUS = 32;
pub const OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_DVLL = 33;
pub const OUTPUT_COLOR_ENCODING_RGB = 0;
pub const OUTPUT_COLOR_ENCODING_YCBCR444 = 1;
pub const OUTPUT_COLOR_ENCODING_YCBCR422 = 2;
pub const OUTPUT_COLOR_ENCODING_YCBCR420 = 3;
pub const OUTPUT_COLOR_ENCODING_INTENSITY = 4;
pub const ColorSpaceTransformStageControl_No_Change = 0;
pub const ColorSpaceTransformStageControl_Enable = 1;
pub const ColorSpaceTransformStageControl_Bypass = 2;
pub const DCT_DEFAULT = 0;
pub const DCT_FORCE_LOW_POWER = 1;
pub const DCT_FORCE_HIGH_PERFORMANCE = 2;
pub const AR_ENABLED = 0;
pub const AR_DISABLED = 1;
pub const AR_SUPPRESSED = 2;
pub const AR_REMOTESESSION = 4;
pub const AR_MULTIMON = 8;
pub const AR_NOSENSOR = 16;
pub const AR_NOT_SUPPORTED = 32;
pub const AR_DOCKED = 64;
pub const AR_LAPTOP = 128;
pub const ORIENTATION_PREFERENCE_NONE = 0;
pub const ORIENTATION_PREFERENCE_LANDSCAPE = 1;
pub const ORIENTATION_PREFERENCE_PORTRAIT = 2;
pub const ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED = 4;
pub const ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED = 8;

pub const aliases = struct {
    pub const SET_DISPLAY_CONFIG_FLAGS = u32;
    pub const QUERY_DISPLAY_CONFIG_FLAGS = u32;
    pub const DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY = i32;
    pub const DISPLAYCONFIG_SCANLINE_ORDERING = i32;
    pub const DISPLAYCONFIG_SCALING = i32;
    pub const DISPLAYCONFIG_ROTATION = i32;
    pub const DISPLAYCONFIG_MODE_INFO_TYPE = i32;
    pub const DISPLAYCONFIG_PIXELFORMAT = i32;
    pub const DISPLAYCONFIG_TOPOLOGY_ID = i32;
    pub const DISPLAYCONFIG_DEVICE_INFO_TYPE = i32;
    pub const MC_VCP_CODE_TYPE = i32;
    pub const MC_DISPLAY_TECHNOLOGY_TYPE = i32;
    pub const MC_DRIVE_TYPE = i32;
    pub const MC_GAIN_TYPE = i32;
    pub const MC_POSITION_TYPE = i32;
    pub const MC_SIZE_TYPE = i32;
    pub const MC_COLOR_TEMPERATURE = i32;
    pub const ENG_SYSTEM_ATTRIBUTE = i32;
    pub const ENG_DEVICE_ATTRIBUTE = i32;
    pub const VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE = i32;
    pub const BlackScreenDiagnosticsCalloutParam = i32;
    pub const VIDEO_BANK_TYPE = i32;
    pub const VIDEO_POWER_STATE = i32;
    pub const BRIGHTNESS_INTERFACE_VERSION = i32;
    pub const BACKLIGHT_OPTIMIZATION_LEVEL = i32;
    pub const COLORSPACE_TRANSFORM_DATA_TYPE = i32;
    pub const COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION = i32;
    pub const COLORSPACE_TRANSFORM_TYPE = i32;
    pub const OUTPUT_WIRE_COLOR_SPACE_TYPE = i32;
    pub const OUTPUT_COLOR_ENCODING = i32;
    pub const COLORSPACE_TRANSFORM_STAGE_CONTROL = i32;
    pub const DSI_CONTROL_TRANSMISSION_MODE = i32;
    pub const AR_STATE = i32;
    pub const ORIENTATION_PREFERENCE = i32;
    pub const HSEMAPHORE = ?*anyopaque;
    pub const HSURF = ?*anyopaque;
    pub const HFASTMUTEX = ?*anyopaque;
    pub const HDRVOBJ = ?*anyopaque;
    pub const HDEV = ?*anyopaque;
    pub const HBM = ?*anyopaque;
    pub const DHSURF = ?*anyopaque;
    pub const DHPDEV = ?*anyopaque;
    pub const PFN = ?*const anyopaque;
    pub const FREEOBJPROC = ?*const anyopaque;
    pub const WNDOBJCHANGEPROC = ?*const anyopaque;
    pub const SORTCOMP = ?*const anyopaque;
    pub const PFN_DrvEnableDriver = ?*const anyopaque;
    pub const PFN_DrvEnablePDEV = ?*const anyopaque;
    pub const PFN_DrvCompletePDEV = ?*const anyopaque;
    pub const PFN_DrvResetDevice = ?*const anyopaque;
    pub const PFN_DrvDisablePDEV = ?*const anyopaque;
    pub const PFN_DrvSynchronize = ?*const anyopaque;
    pub const PFN_DrvEnableSurface = ?*const anyopaque;
    pub const PFN_DrvDisableDriver = ?*const anyopaque;
    pub const PFN_DrvDisableSurface = ?*const anyopaque;
    pub const PFN_DrvAssertMode = ?*const anyopaque;
    pub const PFN_DrvTextOut = ?*const anyopaque;
    pub const PFN_DrvStretchBlt = ?*const anyopaque;
    pub const PFN_DrvStretchBltROP = ?*const anyopaque;
    pub const PFN_DrvTransparentBlt = ?*const anyopaque;
    pub const PFN_DrvPlgBlt = ?*const anyopaque;
    pub const PFN_DrvBitBlt = ?*const anyopaque;
    pub const PFN_DrvRealizeBrush = ?*const anyopaque;
    pub const PFN_DrvCopyBits = ?*const anyopaque;
    pub const PFN_DrvDitherColor = ?*const anyopaque;
    pub const PFN_DrvCreateDeviceBitmap = ?*const anyopaque;
    pub const PFN_DrvDeleteDeviceBitmap = ?*const anyopaque;
    pub const PFN_DrvSetPalette = ?*const anyopaque;
    pub const PFN_DrvEscape = ?*const anyopaque;
    pub const PFN_DrvDrawEscape = ?*const anyopaque;
    pub const PFN_DrvQueryFont = ?*const anyopaque;
    pub const PFN_DrvQueryFontTree = ?*const anyopaque;
    pub const PFN_DrvQueryFontData = ?*const anyopaque;
    pub const PFN_DrvFree = ?*const anyopaque;
    pub const PFN_DrvDestroyFont = ?*const anyopaque;
    pub const PFN_DrvQueryFontCaps = ?*const anyopaque;
    pub const PFN_DrvLoadFontFile = ?*const anyopaque;
    pub const PFN_DrvUnloadFontFile = ?*const anyopaque;
    pub const PFN_DrvSetPointerShape = ?*const anyopaque;
    pub const PFN_DrvMovePointer = ?*const anyopaque;
    pub const PFN_DrvSendPage = ?*const anyopaque;
    pub const PFN_DrvStartPage = ?*const anyopaque;
    pub const PFN_DrvStartDoc = ?*const anyopaque;
    pub const PFN_DrvEndDoc = ?*const anyopaque;
    pub const PFN_DrvQuerySpoolType = ?*const anyopaque;
    pub const PFN_DrvLineTo = ?*const anyopaque;
    pub const PFN_DrvStrokePath = ?*const anyopaque;
    pub const PFN_DrvFillPath = ?*const anyopaque;
    pub const PFN_DrvStrokeAndFillPath = ?*const anyopaque;
    pub const PFN_DrvPaint = ?*const anyopaque;
    pub const PFN_DrvGetGlyphMode = ?*const anyopaque;
    pub const PFN_DrvResetPDEV = ?*const anyopaque;
    pub const PFN_DrvSaveScreenBits = ?*const anyopaque;
    pub const PFN_DrvGetModes = ?*const anyopaque;
    pub const PFN_DrvQueryTrueTypeTable = ?*const anyopaque;
    pub const PFN_DrvQueryTrueTypeSection = ?*const anyopaque;
    pub const PFN_DrvQueryTrueTypeOutline = ?*const anyopaque;
    pub const PFN_DrvGetTrueTypeFile = ?*const anyopaque;
    pub const PFN_DrvQueryFontFile = ?*const anyopaque;
    pub const PFN_DrvQueryGlyphAttrs = ?*const anyopaque;
    pub const PFN_DrvQueryAdvanceWidths = ?*const anyopaque;
    pub const PFN_DrvFontManagement = ?*const anyopaque;
    pub const PFN_DrvSetPixelFormat = ?*const anyopaque;
    pub const PFN_DrvDescribePixelFormat = ?*const anyopaque;
    pub const PFN_DrvSwapBuffers = ?*const anyopaque;
    pub const PFN_DrvStartBanding = ?*const anyopaque;
    pub const PFN_DrvNextBand = ?*const anyopaque;
    pub const PFN_DrvQueryPerBandInfo = ?*const anyopaque;
    pub const PFN_DrvEnableDirectDraw = ?*const anyopaque;
    pub const PFN_DrvDisableDirectDraw = ?*const anyopaque;
    pub const PFN_DrvGetDirectDrawInfo = ?*const anyopaque;
    pub const PFN_DrvIcmCreateColorTransform = ?*const anyopaque;
    pub const PFN_DrvIcmDeleteColorTransform = ?*const anyopaque;
    pub const PFN_DrvIcmCheckBitmapBits = ?*const anyopaque;
    pub const PFN_DrvIcmSetDeviceGammaRamp = ?*const anyopaque;
    pub const PFN_DrvAlphaBlend = ?*const anyopaque;
    pub const PFN_DrvGradientFill = ?*const anyopaque;
    pub const PFN_DrvQueryDeviceSupport = ?*const anyopaque;
    pub const PFN_DrvDeriveSurface = ?*const anyopaque;
    pub const PFN_DrvSynchronizeSurface = ?*const anyopaque;
    pub const PFN_DrvNotify = ?*const anyopaque;
    pub const PFN_DrvRenderHint = ?*const anyopaque;
    pub const PFN_DrvCreateDeviceBitmapEx = ?*const anyopaque;
    pub const PFN_DrvDeleteDeviceBitmapEx = ?*const anyopaque;
    pub const PFN_DrvAssociateSharedSurface = ?*const anyopaque;
    pub const PFN_DrvSynchronizeRedirectionBitmaps = ?*const anyopaque;
    pub const PFN_DrvAccumulateD3DDirtyRect = ?*const anyopaque;
    pub const PFN_DrvStartDxInterop = ?*const anyopaque;
    pub const PFN_DrvEndDxInterop = ?*const anyopaque;
    pub const PFN_DrvLockDisplayArea = ?*const anyopaque;
    pub const PFN_DrvUnlockDisplayArea = ?*const anyopaque;
    pub const PFN_DrvSurfaceComplete = ?*const anyopaque;
    pub const PVIDEO_WIN32K_CALLOUT = ?*const anyopaque;
};
