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
    .{ "ChoosePixelFormat", MethodRecord{ .library = "GDI32", .import = "ChoosePixelFormat", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\xaf\x31" } },
    .{ "DescribePixelFormat", MethodRecord{ .library = "GDI32", .import = "DescribePixelFormat", .signature = "\x00\x04\x08\x11\x83\x5d\x08\x09\x0f\x11\xaf\x31" } },
    .{ "GetPixelFormat", MethodRecord{ .library = "GDI32", .import = "GetPixelFormat", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "SetPixelFormat", MethodRecord{ .library = "GDI32", .import = "SetPixelFormat", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x08\x0f\x11\xaf\x31" } },
    .{ "GetEnhMetaFilePixelFormat", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFilePixelFormat", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x0f\x11\xaf\x31" } },
    .{ "wglCopyContext", MethodRecord{ .library = "OPENGL32", .import = "wglCopyContext", .signature = "\x00\x03\x11\x59\x11\xaf\x35\x11\xaf\x35\x09" } },
    .{ "wglCreateContext", MethodRecord{ .library = "OPENGL32", .import = "wglCreateContext", .signature = "\x00\x01\x11\xaf\x35\x11\x83\x5d" } },
    .{ "wglCreateLayerContext", MethodRecord{ .library = "OPENGL32", .import = "wglCreateLayerContext", .signature = "\x00\x02\x11\xaf\x35\x11\x83\x5d\x08" } },
    .{ "wglDeleteContext", MethodRecord{ .library = "OPENGL32", .import = "wglDeleteContext", .signature = "\x00\x01\x11\x59\x11\xaf\x35" } },
    .{ "wglGetCurrentContext", MethodRecord{ .library = "OPENGL32", .import = "wglGetCurrentContext", .signature = "\x00\x00\x11\xaf\x35" } },
    .{ "wglGetCurrentDC", MethodRecord{ .library = "OPENGL32", .import = "wglGetCurrentDC", .signature = "\x00\x00\x11\x83\x5d" } },
    .{ "wglGetProcAddress", MethodRecord{ .library = "OPENGL32", .import = "wglGetProcAddress", .signature = "\x00\x01\x12\xaf\x39\x11\x3d" } },
    .{ "wglMakeCurrent", MethodRecord{ .library = "OPENGL32", .import = "wglMakeCurrent", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\xaf\x35" } },
    .{ "wglShareLists", MethodRecord{ .library = "OPENGL32", .import = "wglShareLists", .signature = "\x00\x02\x11\x59\x11\xaf\x35\x11\xaf\x35" } },
    .{ "wglUseFontBitmapsA", MethodRecord{ .library = "OPENGL32", .import = "wglUseFontBitmapsA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x09" } },
    .{ "wglUseFontBitmapsW", MethodRecord{ .library = "OPENGL32", .import = "wglUseFontBitmapsW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x09" } },
    .{ "SwapBuffers", MethodRecord{ .library = "GDI32", .import = "SwapBuffers", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "wglUseFontOutlinesA", MethodRecord{ .library = "OPENGL32", .import = "wglUseFontOutlinesA", .signature = "\x00\x08\x11\x59\x11\x83\x5d\x09\x09\x09\x0c\x0c\x08\x0f\x11\xaf\x3d" } },
    .{ "wglUseFontOutlinesW", MethodRecord{ .library = "OPENGL32", .import = "wglUseFontOutlinesW", .signature = "\x00\x08\x11\x59\x11\x83\x5d\x09\x09\x09\x0c\x0c\x08\x0f\x11\xaf\x3d" } },
    .{ "wglDescribeLayerPlane", MethodRecord{ .library = "OPENGL32", .import = "wglDescribeLayerPlane", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x09\x0f\x11\xaf\x41" } },
    .{ "wglSetLayerPaletteEntries", MethodRecord{ .library = "OPENGL32", .import = "wglSetLayerPaletteEntries", .signature = "\x00\x05\x08\x11\x83\x5d\x08\x08\x08\x0f\x11\x83\x59" } },
    .{ "wglGetLayerPaletteEntries", MethodRecord{ .library = "OPENGL32", .import = "wglGetLayerPaletteEntries", .signature = "\x00\x05\x08\x11\x83\x5d\x08\x08\x08\x0f\x11\x83\x59" } },
    .{ "wglRealizeLayerPalette", MethodRecord{ .library = "OPENGL32", .import = "wglRealizeLayerPalette", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x08\x11\x59" } },
    .{ "wglSwapLayerBuffers", MethodRecord{ .library = "OPENGL32", .import = "wglSwapLayerBuffers", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x09" } },
    .{ "glAccum", MethodRecord{ .library = "OPENGL32", .import = "glAccum", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glAlphaFunc", MethodRecord{ .library = "OPENGL32", .import = "glAlphaFunc", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glAreTexturesResident", MethodRecord{ .library = "OPENGL32", .import = "glAreTexturesResident", .signature = "\x00\x03\x05\x08\x0f\x09\x0f\x05" } },
    .{ "glArrayElement", MethodRecord{ .library = "OPENGL32", .import = "glArrayElement", .signature = "\x00\x01\x01\x08" } },
    .{ "glBegin", MethodRecord{ .library = "OPENGL32", .import = "glBegin", .signature = "\x00\x01\x01\x09" } },
    .{ "glBindTexture", MethodRecord{ .library = "OPENGL32", .import = "glBindTexture", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glBitmap", MethodRecord{ .library = "OPENGL32", .import = "glBitmap", .signature = "\x00\x07\x01\x08\x08\x0c\x0c\x0c\x0c\x0f\x05" } },
    .{ "glBlendFunc", MethodRecord{ .library = "OPENGL32", .import = "glBlendFunc", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glCallList", MethodRecord{ .library = "OPENGL32", .import = "glCallList", .signature = "\x00\x01\x01\x09" } },
    .{ "glCallLists", MethodRecord{ .library = "OPENGL32", .import = "glCallLists", .signature = "\x00\x03\x01\x08\x09\x0f\x01" } },
    .{ "glClear", MethodRecord{ .library = "OPENGL32", .import = "glClear", .signature = "\x00\x01\x01\x09" } },
    .{ "glClearAccum", MethodRecord{ .library = "OPENGL32", .import = "glClearAccum", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glClearColor", MethodRecord{ .library = "OPENGL32", .import = "glClearColor", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glClearDepth", MethodRecord{ .library = "OPENGL32", .import = "glClearDepth", .signature = "\x00\x01\x01\x0d" } },
    .{ "glClearIndex", MethodRecord{ .library = "OPENGL32", .import = "glClearIndex", .signature = "\x00\x01\x01\x0c" } },
    .{ "glClearStencil", MethodRecord{ .library = "OPENGL32", .import = "glClearStencil", .signature = "\x00\x01\x01\x08" } },
    .{ "glClipPlane", MethodRecord{ .library = "OPENGL32", .import = "glClipPlane", .signature = "\x00\x02\x01\x09\x0f\x0d" } },
    .{ "glColor3b", MethodRecord{ .library = "OPENGL32", .import = "glColor3b", .signature = "\x00\x03\x01\x04\x04\x04" } },
    .{ "glColor3bv", MethodRecord{ .library = "OPENGL32", .import = "glColor3bv", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "glColor3d", MethodRecord{ .library = "OPENGL32", .import = "glColor3d", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glColor3dv", MethodRecord{ .library = "OPENGL32", .import = "glColor3dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glColor3f", MethodRecord{ .library = "OPENGL32", .import = "glColor3f", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glColor3fv", MethodRecord{ .library = "OPENGL32", .import = "glColor3fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glColor3i", MethodRecord{ .library = "OPENGL32", .import = "glColor3i", .signature = "\x00\x03\x01\x08\x08\x08" } },
    .{ "glColor3iv", MethodRecord{ .library = "OPENGL32", .import = "glColor3iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glColor3s", MethodRecord{ .library = "OPENGL32", .import = "glColor3s", .signature = "\x00\x03\x01\x06\x06\x06" } },
    .{ "glColor3sv", MethodRecord{ .library = "OPENGL32", .import = "glColor3sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glColor3ub", MethodRecord{ .library = "OPENGL32", .import = "glColor3ub", .signature = "\x00\x03\x01\x05\x05\x05" } },
    .{ "glColor3ubv", MethodRecord{ .library = "OPENGL32", .import = "glColor3ubv", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glColor3ui", MethodRecord{ .library = "OPENGL32", .import = "glColor3ui", .signature = "\x00\x03\x01\x09\x09\x09" } },
    .{ "glColor3uiv", MethodRecord{ .library = "OPENGL32", .import = "glColor3uiv", .signature = "\x00\x01\x01\x0f\x09" } },
    .{ "glColor3us", MethodRecord{ .library = "OPENGL32", .import = "glColor3us", .signature = "\x00\x03\x01\x07\x07\x07" } },
    .{ "glColor3usv", MethodRecord{ .library = "OPENGL32", .import = "glColor3usv", .signature = "\x00\x01\x01\x0f\x07" } },
    .{ "glColor4b", MethodRecord{ .library = "OPENGL32", .import = "glColor4b", .signature = "\x00\x04\x01\x04\x04\x04\x04" } },
    .{ "glColor4bv", MethodRecord{ .library = "OPENGL32", .import = "glColor4bv", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "glColor4d", MethodRecord{ .library = "OPENGL32", .import = "glColor4d", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glColor4dv", MethodRecord{ .library = "OPENGL32", .import = "glColor4dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glColor4f", MethodRecord{ .library = "OPENGL32", .import = "glColor4f", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glColor4fv", MethodRecord{ .library = "OPENGL32", .import = "glColor4fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glColor4i", MethodRecord{ .library = "OPENGL32", .import = "glColor4i", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glColor4iv", MethodRecord{ .library = "OPENGL32", .import = "glColor4iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glColor4s", MethodRecord{ .library = "OPENGL32", .import = "glColor4s", .signature = "\x00\x04\x01\x06\x06\x06\x06" } },
    .{ "glColor4sv", MethodRecord{ .library = "OPENGL32", .import = "glColor4sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glColor4ub", MethodRecord{ .library = "OPENGL32", .import = "glColor4ub", .signature = "\x00\x04\x01\x05\x05\x05\x05" } },
    .{ "glColor4ubv", MethodRecord{ .library = "OPENGL32", .import = "glColor4ubv", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glColor4ui", MethodRecord{ .library = "OPENGL32", .import = "glColor4ui", .signature = "\x00\x04\x01\x09\x09\x09\x09" } },
    .{ "glColor4uiv", MethodRecord{ .library = "OPENGL32", .import = "glColor4uiv", .signature = "\x00\x01\x01\x0f\x09" } },
    .{ "glColor4us", MethodRecord{ .library = "OPENGL32", .import = "glColor4us", .signature = "\x00\x04\x01\x07\x07\x07\x07" } },
    .{ "glColor4usv", MethodRecord{ .library = "OPENGL32", .import = "glColor4usv", .signature = "\x00\x01\x01\x0f\x07" } },
    .{ "glColorMask", MethodRecord{ .library = "OPENGL32", .import = "glColorMask", .signature = "\x00\x04\x01\x05\x05\x05\x05" } },
    .{ "glColorMaterial", MethodRecord{ .library = "OPENGL32", .import = "glColorMaterial", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glColorPointer", MethodRecord{ .library = "OPENGL32", .import = "glColorPointer", .signature = "\x00\x04\x01\x08\x09\x08\x0f\x01" } },
    .{ "glCopyPixels", MethodRecord{ .library = "OPENGL32", .import = "glCopyPixels", .signature = "\x00\x05\x01\x08\x08\x08\x08\x09" } },
    .{ "glCopyTexImage1D", MethodRecord{ .library = "OPENGL32", .import = "glCopyTexImage1D", .signature = "\x00\x07\x01\x09\x08\x09\x08\x08\x08\x08" } },
    .{ "glCopyTexImage2D", MethodRecord{ .library = "OPENGL32", .import = "glCopyTexImage2D", .signature = "\x00\x08\x01\x09\x08\x09\x08\x08\x08\x08\x08" } },
    .{ "glCopyTexSubImage1D", MethodRecord{ .library = "OPENGL32", .import = "glCopyTexSubImage1D", .signature = "\x00\x06\x01\x09\x08\x08\x08\x08\x08" } },
    .{ "glCopyTexSubImage2D", MethodRecord{ .library = "OPENGL32", .import = "glCopyTexSubImage2D", .signature = "\x00\x08\x01\x09\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "glCullFace", MethodRecord{ .library = "OPENGL32", .import = "glCullFace", .signature = "\x00\x01\x01\x09" } },
    .{ "glDeleteLists", MethodRecord{ .library = "OPENGL32", .import = "glDeleteLists", .signature = "\x00\x02\x01\x09\x08" } },
    .{ "glDeleteTextures", MethodRecord{ .library = "OPENGL32", .import = "glDeleteTextures", .signature = "\x00\x02\x01\x08\x0f\x09" } },
    .{ "glDepthFunc", MethodRecord{ .library = "OPENGL32", .import = "glDepthFunc", .signature = "\x00\x01\x01\x09" } },
    .{ "glDepthMask", MethodRecord{ .library = "OPENGL32", .import = "glDepthMask", .signature = "\x00\x01\x01\x05" } },
    .{ "glDepthRange", MethodRecord{ .library = "OPENGL32", .import = "glDepthRange", .signature = "\x00\x02\x01\x0d\x0d" } },
    .{ "glDisable", MethodRecord{ .library = "OPENGL32", .import = "glDisable", .signature = "\x00\x01\x01\x09" } },
    .{ "glDisableClientState", MethodRecord{ .library = "OPENGL32", .import = "glDisableClientState", .signature = "\x00\x01\x01\x09" } },
    .{ "glDrawArrays", MethodRecord{ .library = "OPENGL32", .import = "glDrawArrays", .signature = "\x00\x03\x01\x09\x08\x08" } },
    .{ "glDrawBuffer", MethodRecord{ .library = "OPENGL32", .import = "glDrawBuffer", .signature = "\x00\x01\x01\x09" } },
    .{ "glDrawElements", MethodRecord{ .library = "OPENGL32", .import = "glDrawElements", .signature = "\x00\x04\x01\x09\x08\x09\x0f\x01" } },
    .{ "glDrawPixels", MethodRecord{ .library = "OPENGL32", .import = "glDrawPixels", .signature = "\x00\x05\x01\x08\x08\x09\x09\x0f\x01" } },
    .{ "glEdgeFlag", MethodRecord{ .library = "OPENGL32", .import = "glEdgeFlag", .signature = "\x00\x01\x01\x05" } },
    .{ "glEdgeFlagPointer", MethodRecord{ .library = "OPENGL32", .import = "glEdgeFlagPointer", .signature = "\x00\x02\x01\x08\x0f\x01" } },
    .{ "glEdgeFlagv", MethodRecord{ .library = "OPENGL32", .import = "glEdgeFlagv", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glEnable", MethodRecord{ .library = "OPENGL32", .import = "glEnable", .signature = "\x00\x01\x01\x09" } },
    .{ "glEnableClientState", MethodRecord{ .library = "OPENGL32", .import = "glEnableClientState", .signature = "\x00\x01\x01\x09" } },
    .{ "glEnd", MethodRecord{ .library = "OPENGL32", .import = "glEnd", .signature = "\x00\x00\x01" } },
    .{ "glEndList", MethodRecord{ .library = "OPENGL32", .import = "glEndList", .signature = "\x00\x00\x01" } },
    .{ "glEvalCoord1d", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord1d", .signature = "\x00\x01\x01\x0d" } },
    .{ "glEvalCoord1dv", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord1dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glEvalCoord1f", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord1f", .signature = "\x00\x01\x01\x0c" } },
    .{ "glEvalCoord1fv", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord1fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glEvalCoord2d", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord2d", .signature = "\x00\x02\x01\x0d\x0d" } },
    .{ "glEvalCoord2dv", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord2dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glEvalCoord2f", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord2f", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glEvalCoord2fv", MethodRecord{ .library = "OPENGL32", .import = "glEvalCoord2fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glEvalMesh1", MethodRecord{ .library = "OPENGL32", .import = "glEvalMesh1", .signature = "\x00\x03\x01\x09\x08\x08" } },
    .{ "glEvalMesh2", MethodRecord{ .library = "OPENGL32", .import = "glEvalMesh2", .signature = "\x00\x05\x01\x09\x08\x08\x08\x08" } },
    .{ "glEvalPoint1", MethodRecord{ .library = "OPENGL32", .import = "glEvalPoint1", .signature = "\x00\x01\x01\x08" } },
    .{ "glEvalPoint2", MethodRecord{ .library = "OPENGL32", .import = "glEvalPoint2", .signature = "\x00\x02\x01\x08\x08" } },
    .{ "glFeedbackBuffer", MethodRecord{ .library = "OPENGL32", .import = "glFeedbackBuffer", .signature = "\x00\x03\x01\x08\x09\x0f\x0c" } },
    .{ "glFinish", MethodRecord{ .library = "OPENGL32", .import = "glFinish", .signature = "\x00\x00\x01" } },
    .{ "glFlush", MethodRecord{ .library = "OPENGL32", .import = "glFlush", .signature = "\x00\x00\x01" } },
    .{ "glFogf", MethodRecord{ .library = "OPENGL32", .import = "glFogf", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glFogfv", MethodRecord{ .library = "OPENGL32", .import = "glFogfv", .signature = "\x00\x02\x01\x09\x0f\x0c" } },
    .{ "glFogi", MethodRecord{ .library = "OPENGL32", .import = "glFogi", .signature = "\x00\x02\x01\x09\x08" } },
    .{ "glFogiv", MethodRecord{ .library = "OPENGL32", .import = "glFogiv", .signature = "\x00\x02\x01\x09\x0f\x08" } },
    .{ "glFrontFace", MethodRecord{ .library = "OPENGL32", .import = "glFrontFace", .signature = "\x00\x01\x01\x09" } },
    .{ "glFrustum", MethodRecord{ .library = "OPENGL32", .import = "glFrustum", .signature = "\x00\x06\x01\x0d\x0d\x0d\x0d\x0d\x0d" } },
    .{ "glGenLists", MethodRecord{ .library = "OPENGL32", .import = "glGenLists", .signature = "\x00\x01\x09\x08" } },
    .{ "glGenTextures", MethodRecord{ .library = "OPENGL32", .import = "glGenTextures", .signature = "\x00\x02\x01\x08\x0f\x09" } },
    .{ "glGetBooleanv", MethodRecord{ .library = "OPENGL32", .import = "glGetBooleanv", .signature = "\x00\x02\x01\x09\x0f\x05" } },
    .{ "glGetClipPlane", MethodRecord{ .library = "OPENGL32", .import = "glGetClipPlane", .signature = "\x00\x02\x01\x09\x0f\x0d" } },
    .{ "glGetDoublev", MethodRecord{ .library = "OPENGL32", .import = "glGetDoublev", .signature = "\x00\x02\x01\x09\x0f\x0d" } },
    .{ "glGetError", MethodRecord{ .library = "OPENGL32", .import = "glGetError", .signature = "\x00\x00\x09" } },
    .{ "glGetFloatv", MethodRecord{ .library = "OPENGL32", .import = "glGetFloatv", .signature = "\x00\x02\x01\x09\x0f\x0c" } },
    .{ "glGetIntegerv", MethodRecord{ .library = "OPENGL32", .import = "glGetIntegerv", .signature = "\x00\x02\x01\x09\x0f\x08" } },
    .{ "glGetLightfv", MethodRecord{ .library = "OPENGL32", .import = "glGetLightfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetLightiv", MethodRecord{ .library = "OPENGL32", .import = "glGetLightiv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glGetMapdv", MethodRecord{ .library = "OPENGL32", .import = "glGetMapdv", .signature = "\x00\x03\x01\x09\x09\x0f\x0d" } },
    .{ "glGetMapfv", MethodRecord{ .library = "OPENGL32", .import = "glGetMapfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetMapiv", MethodRecord{ .library = "OPENGL32", .import = "glGetMapiv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glGetMaterialfv", MethodRecord{ .library = "OPENGL32", .import = "glGetMaterialfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetMaterialiv", MethodRecord{ .library = "OPENGL32", .import = "glGetMaterialiv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glGetPixelMapfv", MethodRecord{ .library = "OPENGL32", .import = "glGetPixelMapfv", .signature = "\x00\x02\x01\x09\x0f\x0c" } },
    .{ "glGetPixelMapuiv", MethodRecord{ .library = "OPENGL32", .import = "glGetPixelMapuiv", .signature = "\x00\x02\x01\x09\x0f\x09" } },
    .{ "glGetPixelMapusv", MethodRecord{ .library = "OPENGL32", .import = "glGetPixelMapusv", .signature = "\x00\x02\x01\x09\x0f\x07" } },
    .{ "glGetPointerv", MethodRecord{ .library = "OPENGL32", .import = "glGetPointerv", .signature = "\x00\x02\x01\x09\x0f\x0f\x01" } },
    .{ "glGetPolygonStipple", MethodRecord{ .library = "OPENGL32", .import = "glGetPolygonStipple", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glGetString", MethodRecord{ .library = "OPENGL32", .import = "glGetString", .signature = "\x00\x01\x0f\x05\x09" } },
    .{ "glGetTexEnvfv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexEnvfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetTexEnviv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexEnviv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glGetTexGendv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexGendv", .signature = "\x00\x03\x01\x09\x09\x0f\x0d" } },
    .{ "glGetTexGenfv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexGenfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetTexGeniv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexGeniv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glGetTexImage", MethodRecord{ .library = "OPENGL32", .import = "glGetTexImage", .signature = "\x00\x05\x01\x09\x08\x09\x09\x0f\x01" } },
    .{ "glGetTexLevelParameterfv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexLevelParameterfv", .signature = "\x00\x04\x01\x09\x08\x09\x0f\x0c" } },
    .{ "glGetTexLevelParameteriv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexLevelParameteriv", .signature = "\x00\x04\x01\x09\x08\x09\x0f\x08" } },
    .{ "glGetTexParameterfv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexParameterfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glGetTexParameteriv", MethodRecord{ .library = "OPENGL32", .import = "glGetTexParameteriv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glHint", MethodRecord{ .library = "OPENGL32", .import = "glHint", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glIndexMask", MethodRecord{ .library = "OPENGL32", .import = "glIndexMask", .signature = "\x00\x01\x01\x09" } },
    .{ "glIndexPointer", MethodRecord{ .library = "OPENGL32", .import = "glIndexPointer", .signature = "\x00\x03\x01\x09\x08\x0f\x01" } },
    .{ "glIndexd", MethodRecord{ .library = "OPENGL32", .import = "glIndexd", .signature = "\x00\x01\x01\x0d" } },
    .{ "glIndexdv", MethodRecord{ .library = "OPENGL32", .import = "glIndexdv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glIndexf", MethodRecord{ .library = "OPENGL32", .import = "glIndexf", .signature = "\x00\x01\x01\x0c" } },
    .{ "glIndexfv", MethodRecord{ .library = "OPENGL32", .import = "glIndexfv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glIndexi", MethodRecord{ .library = "OPENGL32", .import = "glIndexi", .signature = "\x00\x01\x01\x08" } },
    .{ "glIndexiv", MethodRecord{ .library = "OPENGL32", .import = "glIndexiv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glIndexs", MethodRecord{ .library = "OPENGL32", .import = "glIndexs", .signature = "\x00\x01\x01\x06" } },
    .{ "glIndexsv", MethodRecord{ .library = "OPENGL32", .import = "glIndexsv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glIndexub", MethodRecord{ .library = "OPENGL32", .import = "glIndexub", .signature = "\x00\x01\x01\x05" } },
    .{ "glIndexubv", MethodRecord{ .library = "OPENGL32", .import = "glIndexubv", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glInitNames", MethodRecord{ .library = "OPENGL32", .import = "glInitNames", .signature = "\x00\x00\x01" } },
    .{ "glInterleavedArrays", MethodRecord{ .library = "OPENGL32", .import = "glInterleavedArrays", .signature = "\x00\x03\x01\x09\x08\x0f\x01" } },
    .{ "glIsEnabled", MethodRecord{ .library = "OPENGL32", .import = "glIsEnabled", .signature = "\x00\x01\x05\x09" } },
    .{ "glIsList", MethodRecord{ .library = "OPENGL32", .import = "glIsList", .signature = "\x00\x01\x05\x09" } },
    .{ "glIsTexture", MethodRecord{ .library = "OPENGL32", .import = "glIsTexture", .signature = "\x00\x01\x05\x09" } },
    .{ "glLightModelf", MethodRecord{ .library = "OPENGL32", .import = "glLightModelf", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glLightModelfv", MethodRecord{ .library = "OPENGL32", .import = "glLightModelfv", .signature = "\x00\x02\x01\x09\x0f\x0c" } },
    .{ "glLightModeli", MethodRecord{ .library = "OPENGL32", .import = "glLightModeli", .signature = "\x00\x02\x01\x09\x08" } },
    .{ "glLightModeliv", MethodRecord{ .library = "OPENGL32", .import = "glLightModeliv", .signature = "\x00\x02\x01\x09\x0f\x08" } },
    .{ "glLightf", MethodRecord{ .library = "OPENGL32", .import = "glLightf", .signature = "\x00\x03\x01\x09\x09\x0c" } },
    .{ "glLightfv", MethodRecord{ .library = "OPENGL32", .import = "glLightfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glLighti", MethodRecord{ .library = "OPENGL32", .import = "glLighti", .signature = "\x00\x03\x01\x09\x09\x08" } },
    .{ "glLightiv", MethodRecord{ .library = "OPENGL32", .import = "glLightiv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glLineStipple", MethodRecord{ .library = "OPENGL32", .import = "glLineStipple", .signature = "\x00\x02\x01\x08\x07" } },
    .{ "glLineWidth", MethodRecord{ .library = "OPENGL32", .import = "glLineWidth", .signature = "\x00\x01\x01\x0c" } },
    .{ "glListBase", MethodRecord{ .library = "OPENGL32", .import = "glListBase", .signature = "\x00\x01\x01\x09" } },
    .{ "glLoadIdentity", MethodRecord{ .library = "OPENGL32", .import = "glLoadIdentity", .signature = "\x00\x00\x01" } },
    .{ "glLoadMatrixd", MethodRecord{ .library = "OPENGL32", .import = "glLoadMatrixd", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glLoadMatrixf", MethodRecord{ .library = "OPENGL32", .import = "glLoadMatrixf", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glLoadName", MethodRecord{ .library = "OPENGL32", .import = "glLoadName", .signature = "\x00\x01\x01\x09" } },
    .{ "glLogicOp", MethodRecord{ .library = "OPENGL32", .import = "glLogicOp", .signature = "\x00\x01\x01\x09" } },
    .{ "glMap1d", MethodRecord{ .library = "OPENGL32", .import = "glMap1d", .signature = "\x00\x06\x01\x09\x0d\x0d\x08\x08\x0f\x0d" } },
    .{ "glMap1f", MethodRecord{ .library = "OPENGL32", .import = "glMap1f", .signature = "\x00\x06\x01\x09\x0c\x0c\x08\x08\x0f\x0c" } },
    .{ "glMap2d", MethodRecord{ .library = "OPENGL32", .import = "glMap2d", .signature = "\x00\x0a\x01\x09\x0d\x0d\x08\x08\x0d\x0d\x08\x08\x0f\x0d" } },
    .{ "glMap2f", MethodRecord{ .library = "OPENGL32", .import = "glMap2f", .signature = "\x00\x0a\x01\x09\x0c\x0c\x08\x08\x0c\x0c\x08\x08\x0f\x0c" } },
    .{ "glMapGrid1d", MethodRecord{ .library = "OPENGL32", .import = "glMapGrid1d", .signature = "\x00\x03\x01\x08\x0d\x0d" } },
    .{ "glMapGrid1f", MethodRecord{ .library = "OPENGL32", .import = "glMapGrid1f", .signature = "\x00\x03\x01\x08\x0c\x0c" } },
    .{ "glMapGrid2d", MethodRecord{ .library = "OPENGL32", .import = "glMapGrid2d", .signature = "\x00\x06\x01\x08\x0d\x0d\x08\x0d\x0d" } },
    .{ "glMapGrid2f", MethodRecord{ .library = "OPENGL32", .import = "glMapGrid2f", .signature = "\x00\x06\x01\x08\x0c\x0c\x08\x0c\x0c" } },
    .{ "glMaterialf", MethodRecord{ .library = "OPENGL32", .import = "glMaterialf", .signature = "\x00\x03\x01\x09\x09\x0c" } },
    .{ "glMaterialfv", MethodRecord{ .library = "OPENGL32", .import = "glMaterialfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glMateriali", MethodRecord{ .library = "OPENGL32", .import = "glMateriali", .signature = "\x00\x03\x01\x09\x09\x08" } },
    .{ "glMaterialiv", MethodRecord{ .library = "OPENGL32", .import = "glMaterialiv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glMatrixMode", MethodRecord{ .library = "OPENGL32", .import = "glMatrixMode", .signature = "\x00\x01\x01\x09" } },
    .{ "glMultMatrixd", MethodRecord{ .library = "OPENGL32", .import = "glMultMatrixd", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glMultMatrixf", MethodRecord{ .library = "OPENGL32", .import = "glMultMatrixf", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glNewList", MethodRecord{ .library = "OPENGL32", .import = "glNewList", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glNormal3b", MethodRecord{ .library = "OPENGL32", .import = "glNormal3b", .signature = "\x00\x03\x01\x04\x04\x04" } },
    .{ "glNormal3bv", MethodRecord{ .library = "OPENGL32", .import = "glNormal3bv", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "glNormal3d", MethodRecord{ .library = "OPENGL32", .import = "glNormal3d", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glNormal3dv", MethodRecord{ .library = "OPENGL32", .import = "glNormal3dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glNormal3f", MethodRecord{ .library = "OPENGL32", .import = "glNormal3f", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glNormal3fv", MethodRecord{ .library = "OPENGL32", .import = "glNormal3fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glNormal3i", MethodRecord{ .library = "OPENGL32", .import = "glNormal3i", .signature = "\x00\x03\x01\x08\x08\x08" } },
    .{ "glNormal3iv", MethodRecord{ .library = "OPENGL32", .import = "glNormal3iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glNormal3s", MethodRecord{ .library = "OPENGL32", .import = "glNormal3s", .signature = "\x00\x03\x01\x06\x06\x06" } },
    .{ "glNormal3sv", MethodRecord{ .library = "OPENGL32", .import = "glNormal3sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glNormalPointer", MethodRecord{ .library = "OPENGL32", .import = "glNormalPointer", .signature = "\x00\x03\x01\x09\x08\x0f\x01" } },
    .{ "glOrtho", MethodRecord{ .library = "OPENGL32", .import = "glOrtho", .signature = "\x00\x06\x01\x0d\x0d\x0d\x0d\x0d\x0d" } },
    .{ "glPassThrough", MethodRecord{ .library = "OPENGL32", .import = "glPassThrough", .signature = "\x00\x01\x01\x0c" } },
    .{ "glPixelMapfv", MethodRecord{ .library = "OPENGL32", .import = "glPixelMapfv", .signature = "\x00\x03\x01\x09\x08\x0f\x0c" } },
    .{ "glPixelMapuiv", MethodRecord{ .library = "OPENGL32", .import = "glPixelMapuiv", .signature = "\x00\x03\x01\x09\x08\x0f\x09" } },
    .{ "glPixelMapusv", MethodRecord{ .library = "OPENGL32", .import = "glPixelMapusv", .signature = "\x00\x03\x01\x09\x08\x0f\x07" } },
    .{ "glPixelStoref", MethodRecord{ .library = "OPENGL32", .import = "glPixelStoref", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glPixelStorei", MethodRecord{ .library = "OPENGL32", .import = "glPixelStorei", .signature = "\x00\x02\x01\x09\x08" } },
    .{ "glPixelTransferf", MethodRecord{ .library = "OPENGL32", .import = "glPixelTransferf", .signature = "\x00\x02\x01\x09\x0c" } },
    .{ "glPixelTransferi", MethodRecord{ .library = "OPENGL32", .import = "glPixelTransferi", .signature = "\x00\x02\x01\x09\x08" } },
    .{ "glPixelZoom", MethodRecord{ .library = "OPENGL32", .import = "glPixelZoom", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glPointSize", MethodRecord{ .library = "OPENGL32", .import = "glPointSize", .signature = "\x00\x01\x01\x0c" } },
    .{ "glPolygonMode", MethodRecord{ .library = "OPENGL32", .import = "glPolygonMode", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "glPolygonOffset", MethodRecord{ .library = "OPENGL32", .import = "glPolygonOffset", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glPolygonStipple", MethodRecord{ .library = "OPENGL32", .import = "glPolygonStipple", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "glPopAttrib", MethodRecord{ .library = "OPENGL32", .import = "glPopAttrib", .signature = "\x00\x00\x01" } },
    .{ "glPopClientAttrib", MethodRecord{ .library = "OPENGL32", .import = "glPopClientAttrib", .signature = "\x00\x00\x01" } },
    .{ "glPopMatrix", MethodRecord{ .library = "OPENGL32", .import = "glPopMatrix", .signature = "\x00\x00\x01" } },
    .{ "glPopName", MethodRecord{ .library = "OPENGL32", .import = "glPopName", .signature = "\x00\x00\x01" } },
    .{ "glPrioritizeTextures", MethodRecord{ .library = "OPENGL32", .import = "glPrioritizeTextures", .signature = "\x00\x03\x01\x08\x0f\x09\x0f\x0c" } },
    .{ "glPushAttrib", MethodRecord{ .library = "OPENGL32", .import = "glPushAttrib", .signature = "\x00\x01\x01\x09" } },
    .{ "glPushClientAttrib", MethodRecord{ .library = "OPENGL32", .import = "glPushClientAttrib", .signature = "\x00\x01\x01\x09" } },
    .{ "glPushMatrix", MethodRecord{ .library = "OPENGL32", .import = "glPushMatrix", .signature = "\x00\x00\x01" } },
    .{ "glPushName", MethodRecord{ .library = "OPENGL32", .import = "glPushName", .signature = "\x00\x01\x01\x09" } },
    .{ "glRasterPos2d", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2d", .signature = "\x00\x02\x01\x0d\x0d" } },
    .{ "glRasterPos2dv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glRasterPos2f", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2f", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glRasterPos2fv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glRasterPos2i", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2i", .signature = "\x00\x02\x01\x08\x08" } },
    .{ "glRasterPos2iv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glRasterPos2s", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2s", .signature = "\x00\x02\x01\x06\x06" } },
    .{ "glRasterPos2sv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos2sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glRasterPos3d", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3d", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glRasterPos3dv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glRasterPos3f", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3f", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glRasterPos3fv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glRasterPos3i", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3i", .signature = "\x00\x03\x01\x08\x08\x08" } },
    .{ "glRasterPos3iv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glRasterPos3s", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3s", .signature = "\x00\x03\x01\x06\x06\x06" } },
    .{ "glRasterPos3sv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos3sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glRasterPos4d", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4d", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glRasterPos4dv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glRasterPos4f", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4f", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glRasterPos4fv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glRasterPos4i", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4i", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glRasterPos4iv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glRasterPos4s", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4s", .signature = "\x00\x04\x01\x06\x06\x06\x06" } },
    .{ "glRasterPos4sv", MethodRecord{ .library = "OPENGL32", .import = "glRasterPos4sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glReadBuffer", MethodRecord{ .library = "OPENGL32", .import = "glReadBuffer", .signature = "\x00\x01\x01\x09" } },
    .{ "glReadPixels", MethodRecord{ .library = "OPENGL32", .import = "glReadPixels", .signature = "\x00\x07\x01\x08\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "glRectd", MethodRecord{ .library = "OPENGL32", .import = "glRectd", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glRectdv", MethodRecord{ .library = "OPENGL32", .import = "glRectdv", .signature = "\x00\x02\x01\x0f\x0d\x0f\x0d" } },
    .{ "glRectf", MethodRecord{ .library = "OPENGL32", .import = "glRectf", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glRectfv", MethodRecord{ .library = "OPENGL32", .import = "glRectfv", .signature = "\x00\x02\x01\x0f\x0c\x0f\x0c" } },
    .{ "glRecti", MethodRecord{ .library = "OPENGL32", .import = "glRecti", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glRectiv", MethodRecord{ .library = "OPENGL32", .import = "glRectiv", .signature = "\x00\x02\x01\x0f\x08\x0f\x08" } },
    .{ "glRects", MethodRecord{ .library = "OPENGL32", .import = "glRects", .signature = "\x00\x04\x01\x06\x06\x06\x06" } },
    .{ "glRectsv", MethodRecord{ .library = "OPENGL32", .import = "glRectsv", .signature = "\x00\x02\x01\x0f\x06\x0f\x06" } },
    .{ "glRenderMode", MethodRecord{ .library = "OPENGL32", .import = "glRenderMode", .signature = "\x00\x01\x08\x09" } },
    .{ "glRotated", MethodRecord{ .library = "OPENGL32", .import = "glRotated", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glRotatef", MethodRecord{ .library = "OPENGL32", .import = "glRotatef", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glScaled", MethodRecord{ .library = "OPENGL32", .import = "glScaled", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glScalef", MethodRecord{ .library = "OPENGL32", .import = "glScalef", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glScissor", MethodRecord{ .library = "OPENGL32", .import = "glScissor", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glSelectBuffer", MethodRecord{ .library = "OPENGL32", .import = "glSelectBuffer", .signature = "\x00\x02\x01\x08\x0f\x09" } },
    .{ "glShadeModel", MethodRecord{ .library = "OPENGL32", .import = "glShadeModel", .signature = "\x00\x01\x01\x09" } },
    .{ "glStencilFunc", MethodRecord{ .library = "OPENGL32", .import = "glStencilFunc", .signature = "\x00\x03\x01\x09\x08\x09" } },
    .{ "glStencilMask", MethodRecord{ .library = "OPENGL32", .import = "glStencilMask", .signature = "\x00\x01\x01\x09" } },
    .{ "glStencilOp", MethodRecord{ .library = "OPENGL32", .import = "glStencilOp", .signature = "\x00\x03\x01\x09\x09\x09" } },
    .{ "glTexCoord1d", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1d", .signature = "\x00\x01\x01\x0d" } },
    .{ "glTexCoord1dv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glTexCoord1f", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1f", .signature = "\x00\x01\x01\x0c" } },
    .{ "glTexCoord1fv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glTexCoord1i", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1i", .signature = "\x00\x01\x01\x08" } },
    .{ "glTexCoord1iv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glTexCoord1s", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1s", .signature = "\x00\x01\x01\x06" } },
    .{ "glTexCoord1sv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord1sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glTexCoord2d", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2d", .signature = "\x00\x02\x01\x0d\x0d" } },
    .{ "glTexCoord2dv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glTexCoord2f", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2f", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glTexCoord2fv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glTexCoord2i", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2i", .signature = "\x00\x02\x01\x08\x08" } },
    .{ "glTexCoord2iv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glTexCoord2s", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2s", .signature = "\x00\x02\x01\x06\x06" } },
    .{ "glTexCoord2sv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord2sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glTexCoord3d", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3d", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glTexCoord3dv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glTexCoord3f", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3f", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glTexCoord3fv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glTexCoord3i", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3i", .signature = "\x00\x03\x01\x08\x08\x08" } },
    .{ "glTexCoord3iv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glTexCoord3s", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3s", .signature = "\x00\x03\x01\x06\x06\x06" } },
    .{ "glTexCoord3sv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord3sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glTexCoord4d", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4d", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glTexCoord4dv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glTexCoord4f", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4f", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glTexCoord4fv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glTexCoord4i", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4i", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glTexCoord4iv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glTexCoord4s", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4s", .signature = "\x00\x04\x01\x06\x06\x06\x06" } },
    .{ "glTexCoord4sv", MethodRecord{ .library = "OPENGL32", .import = "glTexCoord4sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glTexCoordPointer", MethodRecord{ .library = "OPENGL32", .import = "glTexCoordPointer", .signature = "\x00\x04\x01\x08\x09\x08\x0f\x01" } },
    .{ "glTexEnvf", MethodRecord{ .library = "OPENGL32", .import = "glTexEnvf", .signature = "\x00\x03\x01\x09\x09\x0c" } },
    .{ "glTexEnvfv", MethodRecord{ .library = "OPENGL32", .import = "glTexEnvfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glTexEnvi", MethodRecord{ .library = "OPENGL32", .import = "glTexEnvi", .signature = "\x00\x03\x01\x09\x09\x08" } },
    .{ "glTexEnviv", MethodRecord{ .library = "OPENGL32", .import = "glTexEnviv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glTexGend", MethodRecord{ .library = "OPENGL32", .import = "glTexGend", .signature = "\x00\x03\x01\x09\x09\x0d" } },
    .{ "glTexGendv", MethodRecord{ .library = "OPENGL32", .import = "glTexGendv", .signature = "\x00\x03\x01\x09\x09\x0f\x0d" } },
    .{ "glTexGenf", MethodRecord{ .library = "OPENGL32", .import = "glTexGenf", .signature = "\x00\x03\x01\x09\x09\x0c" } },
    .{ "glTexGenfv", MethodRecord{ .library = "OPENGL32", .import = "glTexGenfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glTexGeni", MethodRecord{ .library = "OPENGL32", .import = "glTexGeni", .signature = "\x00\x03\x01\x09\x09\x08" } },
    .{ "glTexGeniv", MethodRecord{ .library = "OPENGL32", .import = "glTexGeniv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glTexImage1D", MethodRecord{ .library = "OPENGL32", .import = "glTexImage1D", .signature = "\x00\x08\x01\x09\x08\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "glTexImage2D", MethodRecord{ .library = "OPENGL32", .import = "glTexImage2D", .signature = "\x00\x09\x01\x09\x08\x08\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "glTexParameterf", MethodRecord{ .library = "OPENGL32", .import = "glTexParameterf", .signature = "\x00\x03\x01\x09\x09\x0c" } },
    .{ "glTexParameterfv", MethodRecord{ .library = "OPENGL32", .import = "glTexParameterfv", .signature = "\x00\x03\x01\x09\x09\x0f\x0c" } },
    .{ "glTexParameteri", MethodRecord{ .library = "OPENGL32", .import = "glTexParameteri", .signature = "\x00\x03\x01\x09\x09\x08" } },
    .{ "glTexParameteriv", MethodRecord{ .library = "OPENGL32", .import = "glTexParameteriv", .signature = "\x00\x03\x01\x09\x09\x0f\x08" } },
    .{ "glTexSubImage1D", MethodRecord{ .library = "OPENGL32", .import = "glTexSubImage1D", .signature = "\x00\x07\x01\x09\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "glTexSubImage2D", MethodRecord{ .library = "OPENGL32", .import = "glTexSubImage2D", .signature = "\x00\x09\x01\x09\x08\x08\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "glTranslated", MethodRecord{ .library = "OPENGL32", .import = "glTranslated", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glTranslatef", MethodRecord{ .library = "OPENGL32", .import = "glTranslatef", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glVertex2d", MethodRecord{ .library = "OPENGL32", .import = "glVertex2d", .signature = "\x00\x02\x01\x0d\x0d" } },
    .{ "glVertex2dv", MethodRecord{ .library = "OPENGL32", .import = "glVertex2dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glVertex2f", MethodRecord{ .library = "OPENGL32", .import = "glVertex2f", .signature = "\x00\x02\x01\x0c\x0c" } },
    .{ "glVertex2fv", MethodRecord{ .library = "OPENGL32", .import = "glVertex2fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glVertex2i", MethodRecord{ .library = "OPENGL32", .import = "glVertex2i", .signature = "\x00\x02\x01\x08\x08" } },
    .{ "glVertex2iv", MethodRecord{ .library = "OPENGL32", .import = "glVertex2iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glVertex2s", MethodRecord{ .library = "OPENGL32", .import = "glVertex2s", .signature = "\x00\x02\x01\x06\x06" } },
    .{ "glVertex2sv", MethodRecord{ .library = "OPENGL32", .import = "glVertex2sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glVertex3d", MethodRecord{ .library = "OPENGL32", .import = "glVertex3d", .signature = "\x00\x03\x01\x0d\x0d\x0d" } },
    .{ "glVertex3dv", MethodRecord{ .library = "OPENGL32", .import = "glVertex3dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glVertex3f", MethodRecord{ .library = "OPENGL32", .import = "glVertex3f", .signature = "\x00\x03\x01\x0c\x0c\x0c" } },
    .{ "glVertex3fv", MethodRecord{ .library = "OPENGL32", .import = "glVertex3fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glVertex3i", MethodRecord{ .library = "OPENGL32", .import = "glVertex3i", .signature = "\x00\x03\x01\x08\x08\x08" } },
    .{ "glVertex3iv", MethodRecord{ .library = "OPENGL32", .import = "glVertex3iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glVertex3s", MethodRecord{ .library = "OPENGL32", .import = "glVertex3s", .signature = "\x00\x03\x01\x06\x06\x06" } },
    .{ "glVertex3sv", MethodRecord{ .library = "OPENGL32", .import = "glVertex3sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glVertex4d", MethodRecord{ .library = "OPENGL32", .import = "glVertex4d", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "glVertex4dv", MethodRecord{ .library = "OPENGL32", .import = "glVertex4dv", .signature = "\x00\x01\x01\x0f\x0d" } },
    .{ "glVertex4f", MethodRecord{ .library = "OPENGL32", .import = "glVertex4f", .signature = "\x00\x04\x01\x0c\x0c\x0c\x0c" } },
    .{ "glVertex4fv", MethodRecord{ .library = "OPENGL32", .import = "glVertex4fv", .signature = "\x00\x01\x01\x0f\x0c" } },
    .{ "glVertex4i", MethodRecord{ .library = "OPENGL32", .import = "glVertex4i", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "glVertex4iv", MethodRecord{ .library = "OPENGL32", .import = "glVertex4iv", .signature = "\x00\x01\x01\x0f\x08" } },
    .{ "glVertex4s", MethodRecord{ .library = "OPENGL32", .import = "glVertex4s", .signature = "\x00\x04\x01\x06\x06\x06\x06" } },
    .{ "glVertex4sv", MethodRecord{ .library = "OPENGL32", .import = "glVertex4sv", .signature = "\x00\x01\x01\x0f\x06" } },
    .{ "glVertexPointer", MethodRecord{ .library = "OPENGL32", .import = "glVertexPointer", .signature = "\x00\x04\x01\x08\x09\x08\x0f\x01" } },
    .{ "glViewport", MethodRecord{ .library = "OPENGL32", .import = "glViewport", .signature = "\x00\x04\x01\x08\x08\x08\x08" } },
    .{ "gluErrorString", MethodRecord{ .library = "GLU32", .import = "gluErrorString", .signature = "\x00\x01\x0f\x05\x09" } },
    .{ "gluErrorUnicodeStringEXT", MethodRecord{ .library = "GLU32", .import = "gluErrorUnicodeStringEXT", .signature = "\x00\x01\x11\x05\x09" } },
    .{ "gluGetString", MethodRecord{ .library = "GLU32", .import = "gluGetString", .signature = "\x00\x01\x0f\x05\x09" } },
    .{ "gluOrtho2D", MethodRecord{ .library = "GLU32", .import = "gluOrtho2D", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "gluPerspective", MethodRecord{ .library = "GLU32", .import = "gluPerspective", .signature = "\x00\x04\x01\x0d\x0d\x0d\x0d" } },
    .{ "gluPickMatrix", MethodRecord{ .library = "GLU32", .import = "gluPickMatrix", .signature = "\x00\x05\x01\x0d\x0d\x0d\x0d\x0f\x08" } },
    .{ "gluLookAt", MethodRecord{ .library = "GLU32", .import = "gluLookAt", .signature = "\x00\x09\x01\x0d\x0d\x0d\x0d\x0d\x0d\x0d\x0d\x0d" } },
    .{ "gluProject", MethodRecord{ .library = "GLU32", .import = "gluProject", .signature = "\x00\x09\x08\x0d\x0d\x0d\x0f\x0d\x0f\x0d\x0f\x08\x0f\x0d\x0f\x0d\x0f\x0d" } },
    .{ "gluUnProject", MethodRecord{ .library = "GLU32", .import = "gluUnProject", .signature = "\x00\x09\x08\x0d\x0d\x0d\x0f\x0d\x0f\x0d\x0f\x08\x0f\x0d\x0f\x0d\x0f\x0d" } },
    .{ "gluScaleImage", MethodRecord{ .library = "GLU32", .import = "gluScaleImage", .signature = "\x00\x09\x08\x09\x08\x08\x09\x0f\x01\x08\x08\x09\x0f\x01" } },
    .{ "gluBuild1DMipmaps", MethodRecord{ .library = "GLU32", .import = "gluBuild1DMipmaps", .signature = "\x00\x06\x08\x09\x08\x08\x09\x09\x0f\x01" } },
    .{ "gluBuild2DMipmaps", MethodRecord{ .library = "GLU32", .import = "gluBuild2DMipmaps", .signature = "\x00\x07\x08\x09\x08\x08\x08\x09\x09\x0f\x01" } },
    .{ "gluNewQuadric", MethodRecord{ .library = "GLU32", .import = "gluNewQuadric", .signature = "\x00\x00\x0f\x11\xaf\x45" } },
    .{ "gluDeleteQuadric", MethodRecord{ .library = "GLU32", .import = "gluDeleteQuadric", .signature = "\x00\x01\x01\x0f\x11\xaf\x45" } },
    .{ "gluQuadricNormals", MethodRecord{ .library = "GLU32", .import = "gluQuadricNormals", .signature = "\x00\x02\x01\x0f\x11\xaf\x45\x09" } },
    .{ "gluQuadricTexture", MethodRecord{ .library = "GLU32", .import = "gluQuadricTexture", .signature = "\x00\x02\x01\x0f\x11\xaf\x45\x05" } },
    .{ "gluQuadricOrientation", MethodRecord{ .library = "GLU32", .import = "gluQuadricOrientation", .signature = "\x00\x02\x01\x0f\x11\xaf\x45\x09" } },
    .{ "gluQuadricDrawStyle", MethodRecord{ .library = "GLU32", .import = "gluQuadricDrawStyle", .signature = "\x00\x02\x01\x0f\x11\xaf\x45\x09" } },
    .{ "gluCylinder", MethodRecord{ .library = "GLU32", .import = "gluCylinder", .signature = "\x00\x06\x01\x0f\x11\xaf\x45\x0d\x0d\x0d\x08\x08" } },
    .{ "gluDisk", MethodRecord{ .library = "GLU32", .import = "gluDisk", .signature = "\x00\x05\x01\x0f\x11\xaf\x45\x0d\x0d\x08\x08" } },
    .{ "gluPartialDisk", MethodRecord{ .library = "GLU32", .import = "gluPartialDisk", .signature = "\x00\x07\x01\x0f\x11\xaf\x45\x0d\x0d\x08\x08\x0d\x0d" } },
    .{ "gluSphere", MethodRecord{ .library = "GLU32", .import = "gluSphere", .signature = "\x00\x04\x01\x0f\x11\xaf\x45\x0d\x08\x08" } },
    .{ "gluQuadricCallback", MethodRecord{ .library = "GLU32", .import = "gluQuadricCallback", .signature = "\x00\x03\x01\x0f\x11\xaf\x45\x09\x18" } },
    .{ "gluNewTess", MethodRecord{ .library = "GLU32", .import = "gluNewTess", .signature = "\x00\x00\x0f\x11\xaf\x49" } },
    .{ "gluDeleteTess", MethodRecord{ .library = "GLU32", .import = "gluDeleteTess", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
    .{ "gluTessBeginPolygon", MethodRecord{ .library = "GLU32", .import = "gluTessBeginPolygon", .signature = "\x00\x02\x01\x0f\x11\xaf\x49\x0f\x01" } },
    .{ "gluTessBeginContour", MethodRecord{ .library = "GLU32", .import = "gluTessBeginContour", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
    .{ "gluTessVertex", MethodRecord{ .library = "GLU32", .import = "gluTessVertex", .signature = "\x00\x03\x01\x0f\x11\xaf\x49\x0f\x0d\x0f\x01" } },
    .{ "gluTessEndContour", MethodRecord{ .library = "GLU32", .import = "gluTessEndContour", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
    .{ "gluTessEndPolygon", MethodRecord{ .library = "GLU32", .import = "gluTessEndPolygon", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
    .{ "gluTessProperty", MethodRecord{ .library = "GLU32", .import = "gluTessProperty", .signature = "\x00\x03\x01\x0f\x11\xaf\x49\x09\x0d" } },
    .{ "gluTessNormal", MethodRecord{ .library = "GLU32", .import = "gluTessNormal", .signature = "\x00\x04\x01\x0f\x11\xaf\x49\x0d\x0d\x0d" } },
    .{ "gluTessCallback", MethodRecord{ .library = "GLU32", .import = "gluTessCallback", .signature = "\x00\x03\x01\x0f\x11\xaf\x49\x09\x18" } },
    .{ "gluGetTessProperty", MethodRecord{ .library = "GLU32", .import = "gluGetTessProperty", .signature = "\x00\x03\x01\x0f\x11\xaf\x49\x09\x0f\x0d" } },
    .{ "gluNewNurbsRenderer", MethodRecord{ .library = "GLU32", .import = "gluNewNurbsRenderer", .signature = "\x00\x00\x0f\x11\xaf\x4d" } },
    .{ "gluDeleteNurbsRenderer", MethodRecord{ .library = "GLU32", .import = "gluDeleteNurbsRenderer", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluBeginSurface", MethodRecord{ .library = "GLU32", .import = "gluBeginSurface", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluBeginCurve", MethodRecord{ .library = "GLU32", .import = "gluBeginCurve", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluEndCurve", MethodRecord{ .library = "GLU32", .import = "gluEndCurve", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluEndSurface", MethodRecord{ .library = "GLU32", .import = "gluEndSurface", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluBeginTrim", MethodRecord{ .library = "GLU32", .import = "gluBeginTrim", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluEndTrim", MethodRecord{ .library = "GLU32", .import = "gluEndTrim", .signature = "\x00\x01\x01\x0f\x11\xaf\x4d" } },
    .{ "gluPwlCurve", MethodRecord{ .library = "GLU32", .import = "gluPwlCurve", .signature = "\x00\x05\x01\x0f\x11\xaf\x4d\x08\x0f\x0c\x08\x09" } },
    .{ "gluNurbsCurve", MethodRecord{ .library = "GLU32", .import = "gluNurbsCurve", .signature = "\x00\x07\x01\x0f\x11\xaf\x4d\x08\x0f\x0c\x08\x0f\x0c\x08\x09" } },
    .{ "gluNurbsSurface", MethodRecord{ .library = "GLU32", .import = "gluNurbsSurface", .signature = "\x00\x0b\x01\x0f\x11\xaf\x4d\x08\x0f\x0c\x08\x0f\x0c\x08\x08\x0f\x0c\x08\x08\x09" } },
    .{ "gluLoadSamplingMatrices", MethodRecord{ .library = "GLU32", .import = "gluLoadSamplingMatrices", .signature = "\x00\x04\x01\x0f\x11\xaf\x4d\x0f\x0c\x0f\x0c\x0f\x08" } },
    .{ "gluNurbsProperty", MethodRecord{ .library = "GLU32", .import = "gluNurbsProperty", .signature = "\x00\x03\x01\x0f\x11\xaf\x4d\x09\x0c" } },
    .{ "gluGetNurbsProperty", MethodRecord{ .library = "GLU32", .import = "gluGetNurbsProperty", .signature = "\x00\x03\x01\x0f\x11\xaf\x4d\x09\x0f\x0c" } },
    .{ "gluNurbsCallback", MethodRecord{ .library = "GLU32", .import = "gluNurbsCallback", .signature = "\x00\x03\x01\x0f\x11\xaf\x4d\x09\x18" } },
    .{ "gluBeginPolygon", MethodRecord{ .library = "GLU32", .import = "gluBeginPolygon", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
    .{ "gluNextContour", MethodRecord{ .library = "GLU32", .import = "gluNextContour", .signature = "\x00\x02\x01\x0f\x11\xaf\x49\x09" } },
    .{ "gluEndPolygon", MethodRecord{ .library = "GLU32", .import = "gluEndPolygon", .signature = "\x00\x01\x01\x0f\x11\xaf\x49" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0xe41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HENHMETAFILE" },
        0x2f31 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "PIXELFORMATDESCRIPTOR" },
        0x2f35 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "HGLRC" },
        0x2f39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PROC" },
        0x2f3d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "GLYPHMETRICSFLOAT" },
        0x2f41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "LAYERPLANEDESCRIPTOR" },
        0x2f45 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "GLUquadric" },
        0x2f49 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "GLUtesselator" },
        0x2f4d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.OpenGL", .name = "GLUnurbs" },
        else => null,
    };
}

pub const PFD_TYPE_RGBA = 0;
pub const PFD_TYPE_COLORINDEX = 1;
pub const PFD_UNDERLAY_PLANE = -1;
pub const PFD_MAIN_PLANE = 0;
pub const PFD_OVERLAY_PLANE = 1;
pub const PFD_DOUBLEBUFFER = 1;
pub const PFD_STEREO = 2;
pub const PFD_DRAW_TO_WINDOW = 4;
pub const PFD_DRAW_TO_BITMAP = 8;
pub const PFD_SUPPORT_GDI = 16;
pub const PFD_SUPPORT_OPENGL = 32;
pub const PFD_GENERIC_FORMAT = 64;
pub const PFD_NEED_PALETTE = 128;
pub const PFD_NEED_SYSTEM_PALETTE = 256;
pub const PFD_SWAP_EXCHANGE = 512;
pub const PFD_SWAP_COPY = 1024;
pub const PFD_SWAP_LAYER_BUFFERS = 2048;
pub const PFD_GENERIC_ACCELERATED = 4096;
pub const PFD_SUPPORT_DIRECTDRAW = 8192;
pub const PFD_DIRECT3D_ACCELERATED = 16384;
pub const PFD_SUPPORT_COMPOSITION = 32768;
pub const PFD_DEPTH_DONTCARE = 536870912;
pub const PFD_DOUBLEBUFFER_DONTCARE = 1073741824;
pub const PFD_STEREO_DONTCARE = 2147483648;
pub const GL_VERSION_1_1 = 1;
pub const GL_ACCUM = 256;
pub const GL_LOAD = 257;
pub const GL_RETURN = 258;
pub const GL_MULT = 259;
pub const GL_ADD = 260;
pub const GL_NEVER = 512;
pub const GL_LESS = 513;
pub const GL_EQUAL = 514;
pub const GL_LEQUAL = 515;
pub const GL_GREATER = 516;
pub const GL_NOTEQUAL = 517;
pub const GL_GEQUAL = 518;
pub const GL_ALWAYS = 519;
pub const GL_CURRENT_BIT = 1;
pub const GL_POINT_BIT = 2;
pub const GL_LINE_BIT = 4;
pub const GL_POLYGON_BIT = 8;
pub const GL_POLYGON_STIPPLE_BIT = 16;
pub const GL_PIXEL_MODE_BIT = 32;
pub const GL_LIGHTING_BIT = 64;
pub const GL_FOG_BIT = 128;
pub const GL_DEPTH_BUFFER_BIT = 256;
pub const GL_ACCUM_BUFFER_BIT = 512;
pub const GL_STENCIL_BUFFER_BIT = 1024;
pub const GL_VIEWPORT_BIT = 2048;
pub const GL_TRANSFORM_BIT = 4096;
pub const GL_ENABLE_BIT = 8192;
pub const GL_COLOR_BUFFER_BIT = 16384;
pub const GL_HINT_BIT = 32768;
pub const GL_EVAL_BIT = 65536;
pub const GL_LIST_BIT = 131072;
pub const GL_TEXTURE_BIT = 262144;
pub const GL_SCISSOR_BIT = 524288;
pub const GL_ALL_ATTRIB_BITS = 1048575;
pub const GL_POINTS = 0;
pub const GL_LINES = 1;
pub const GL_LINE_LOOP = 2;
pub const GL_LINE_STRIP = 3;
pub const GL_TRIANGLES = 4;
pub const GL_TRIANGLE_STRIP = 5;
pub const GL_TRIANGLE_FAN = 6;
pub const GL_QUADS = 7;
pub const GL_QUAD_STRIP = 8;
pub const GL_POLYGON = 9;
pub const GL_ZERO = 0;
pub const GL_ONE = 1;
pub const GL_SRC_COLOR = 768;
pub const GL_ONE_MINUS_SRC_COLOR = 769;
pub const GL_SRC_ALPHA = 770;
pub const GL_ONE_MINUS_SRC_ALPHA = 771;
pub const GL_DST_ALPHA = 772;
pub const GL_ONE_MINUS_DST_ALPHA = 773;
pub const GL_DST_COLOR = 774;
pub const GL_ONE_MINUS_DST_COLOR = 775;
pub const GL_SRC_ALPHA_SATURATE = 776;
pub const GL_TRUE = 1;
pub const GL_FALSE = 0;
pub const GL_CLIP_PLANE0 = 12288;
pub const GL_CLIP_PLANE1 = 12289;
pub const GL_CLIP_PLANE2 = 12290;
pub const GL_CLIP_PLANE3 = 12291;
pub const GL_CLIP_PLANE4 = 12292;
pub const GL_CLIP_PLANE5 = 12293;
pub const GL_BYTE = 5120;
pub const GL_UNSIGNED_BYTE = 5121;
pub const GL_SHORT = 5122;
pub const GL_UNSIGNED_SHORT = 5123;
pub const GL_INT = 5124;
pub const GL_UNSIGNED_INT = 5125;
pub const GL_FLOAT = 5126;
pub const GL_2_BYTES = 5127;
pub const GL_3_BYTES = 5128;
pub const GL_4_BYTES = 5129;
pub const GL_DOUBLE = 5130;
pub const GL_NONE = 0;
pub const GL_FRONT_LEFT = 1024;
pub const GL_FRONT_RIGHT = 1025;
pub const GL_BACK_LEFT = 1026;
pub const GL_BACK_RIGHT = 1027;
pub const GL_FRONT = 1028;
pub const GL_BACK = 1029;
pub const GL_LEFT = 1030;
pub const GL_RIGHT = 1031;
pub const GL_FRONT_AND_BACK = 1032;
pub const GL_AUX0 = 1033;
pub const GL_AUX1 = 1034;
pub const GL_AUX2 = 1035;
pub const GL_AUX3 = 1036;
pub const GL_NO_ERROR = 0;
pub const GL_INVALID_ENUM = 1280;
pub const GL_INVALID_VALUE = 1281;
pub const GL_INVALID_OPERATION = 1282;
pub const GL_STACK_OVERFLOW = 1283;
pub const GL_STACK_UNDERFLOW = 1284;
pub const GL_OUT_OF_MEMORY = 1285;
pub const GL_2D = 1536;
pub const GL_3D = 1537;
pub const GL_3D_COLOR = 1538;
pub const GL_3D_COLOR_TEXTURE = 1539;
pub const GL_4D_COLOR_TEXTURE = 1540;
pub const GL_PASS_THROUGH_TOKEN = 1792;
pub const GL_POINT_TOKEN = 1793;
pub const GL_LINE_TOKEN = 1794;
pub const GL_POLYGON_TOKEN = 1795;
pub const GL_BITMAP_TOKEN = 1796;
pub const GL_DRAW_PIXEL_TOKEN = 1797;
pub const GL_COPY_PIXEL_TOKEN = 1798;
pub const GL_LINE_RESET_TOKEN = 1799;
pub const GL_EXP = 2048;
pub const GL_EXP2 = 2049;
pub const GL_CW = 2304;
pub const GL_CCW = 2305;
pub const GL_COEFF = 2560;
pub const GL_ORDER = 2561;
pub const GL_DOMAIN = 2562;
pub const GL_CURRENT_COLOR = 2816;
pub const GL_CURRENT_INDEX = 2817;
pub const GL_CURRENT_NORMAL = 2818;
pub const GL_CURRENT_TEXTURE_COORDS = 2819;
pub const GL_CURRENT_RASTER_COLOR = 2820;
pub const GL_CURRENT_RASTER_INDEX = 2821;
pub const GL_CURRENT_RASTER_TEXTURE_COORDS = 2822;
pub const GL_CURRENT_RASTER_POSITION = 2823;
pub const GL_CURRENT_RASTER_POSITION_VALID = 2824;
pub const GL_CURRENT_RASTER_DISTANCE = 2825;
pub const GL_POINT_SMOOTH = 2832;
pub const GL_POINT_SIZE = 2833;
pub const GL_POINT_SIZE_RANGE = 2834;
pub const GL_POINT_SIZE_GRANULARITY = 2835;
pub const GL_LINE_SMOOTH = 2848;
pub const GL_LINE_WIDTH = 2849;
pub const GL_LINE_WIDTH_RANGE = 2850;
pub const GL_LINE_WIDTH_GRANULARITY = 2851;
pub const GL_LINE_STIPPLE = 2852;
pub const GL_LINE_STIPPLE_PATTERN = 2853;
pub const GL_LINE_STIPPLE_REPEAT = 2854;
pub const GL_LIST_MODE = 2864;
pub const GL_MAX_LIST_NESTING = 2865;
pub const GL_LIST_BASE = 2866;
pub const GL_LIST_INDEX = 2867;
pub const GL_POLYGON_MODE = 2880;
pub const GL_POLYGON_SMOOTH = 2881;
pub const GL_POLYGON_STIPPLE = 2882;
pub const GL_EDGE_FLAG = 2883;
pub const GL_CULL_FACE = 2884;
pub const GL_CULL_FACE_MODE = 2885;
pub const GL_FRONT_FACE = 2886;
pub const GL_LIGHTING = 2896;
pub const GL_LIGHT_MODEL_LOCAL_VIEWER = 2897;
pub const GL_LIGHT_MODEL_TWO_SIDE = 2898;
pub const GL_LIGHT_MODEL_AMBIENT = 2899;
pub const GL_SHADE_MODEL = 2900;
pub const GL_COLOR_MATERIAL_FACE = 2901;
pub const GL_COLOR_MATERIAL_PARAMETER = 2902;
pub const GL_COLOR_MATERIAL = 2903;
pub const GL_FOG = 2912;
pub const GL_FOG_INDEX = 2913;
pub const GL_FOG_DENSITY = 2914;
pub const GL_FOG_START = 2915;
pub const GL_FOG_END = 2916;
pub const GL_FOG_MODE = 2917;
pub const GL_FOG_COLOR = 2918;
pub const GL_DEPTH_RANGE = 2928;
pub const GL_DEPTH_TEST = 2929;
pub const GL_DEPTH_WRITEMASK = 2930;
pub const GL_DEPTH_CLEAR_VALUE = 2931;
pub const GL_DEPTH_FUNC = 2932;
pub const GL_ACCUM_CLEAR_VALUE = 2944;
pub const GL_STENCIL_TEST = 2960;
pub const GL_STENCIL_CLEAR_VALUE = 2961;
pub const GL_STENCIL_FUNC = 2962;
pub const GL_STENCIL_VALUE_MASK = 2963;
pub const GL_STENCIL_FAIL = 2964;
pub const GL_STENCIL_PASS_DEPTH_FAIL = 2965;
pub const GL_STENCIL_PASS_DEPTH_PASS = 2966;
pub const GL_STENCIL_REF = 2967;
pub const GL_STENCIL_WRITEMASK = 2968;
pub const GL_MATRIX_MODE = 2976;
pub const GL_NORMALIZE = 2977;
pub const GL_VIEWPORT = 2978;
pub const GL_MODELVIEW_STACK_DEPTH = 2979;
pub const GL_PROJECTION_STACK_DEPTH = 2980;
pub const GL_TEXTURE_STACK_DEPTH = 2981;
pub const GL_MODELVIEW_MATRIX = 2982;
pub const GL_PROJECTION_MATRIX = 2983;
pub const GL_TEXTURE_MATRIX = 2984;
pub const GL_ATTRIB_STACK_DEPTH = 2992;
pub const GL_CLIENT_ATTRIB_STACK_DEPTH = 2993;
pub const GL_ALPHA_TEST = 3008;
pub const GL_ALPHA_TEST_FUNC = 3009;
pub const GL_ALPHA_TEST_REF = 3010;
pub const GL_DITHER = 3024;
pub const GL_BLEND_DST = 3040;
pub const GL_BLEND_SRC = 3041;
pub const GL_BLEND = 3042;
pub const GL_LOGIC_OP_MODE = 3056;
pub const GL_INDEX_LOGIC_OP = 3057;
pub const GL_COLOR_LOGIC_OP = 3058;
pub const GL_AUX_BUFFERS = 3072;
pub const GL_DRAW_BUFFER = 3073;
pub const GL_READ_BUFFER = 3074;
pub const GL_SCISSOR_BOX = 3088;
pub const GL_SCISSOR_TEST = 3089;
pub const GL_INDEX_CLEAR_VALUE = 3104;
pub const GL_INDEX_WRITEMASK = 3105;
pub const GL_COLOR_CLEAR_VALUE = 3106;
pub const GL_COLOR_WRITEMASK = 3107;
pub const GL_INDEX_MODE = 3120;
pub const GL_RGBA_MODE = 3121;
pub const GL_DOUBLEBUFFER = 3122;
pub const GL_STEREO = 3123;
pub const GL_RENDER_MODE = 3136;
pub const GL_PERSPECTIVE_CORRECTION_HINT = 3152;
pub const GL_POINT_SMOOTH_HINT = 3153;
pub const GL_LINE_SMOOTH_HINT = 3154;
pub const GL_POLYGON_SMOOTH_HINT = 3155;
pub const GL_FOG_HINT = 3156;
pub const GL_TEXTURE_GEN_S = 3168;
pub const GL_TEXTURE_GEN_T = 3169;
pub const GL_TEXTURE_GEN_R = 3170;
pub const GL_TEXTURE_GEN_Q = 3171;
pub const GL_PIXEL_MAP_I_TO_I = 3184;
pub const GL_PIXEL_MAP_S_TO_S = 3185;
pub const GL_PIXEL_MAP_I_TO_R = 3186;
pub const GL_PIXEL_MAP_I_TO_G = 3187;
pub const GL_PIXEL_MAP_I_TO_B = 3188;
pub const GL_PIXEL_MAP_I_TO_A = 3189;
pub const GL_PIXEL_MAP_R_TO_R = 3190;
pub const GL_PIXEL_MAP_G_TO_G = 3191;
pub const GL_PIXEL_MAP_B_TO_B = 3192;
pub const GL_PIXEL_MAP_A_TO_A = 3193;
pub const GL_PIXEL_MAP_I_TO_I_SIZE = 3248;
pub const GL_PIXEL_MAP_S_TO_S_SIZE = 3249;
pub const GL_PIXEL_MAP_I_TO_R_SIZE = 3250;
pub const GL_PIXEL_MAP_I_TO_G_SIZE = 3251;
pub const GL_PIXEL_MAP_I_TO_B_SIZE = 3252;
pub const GL_PIXEL_MAP_I_TO_A_SIZE = 3253;
pub const GL_PIXEL_MAP_R_TO_R_SIZE = 3254;
pub const GL_PIXEL_MAP_G_TO_G_SIZE = 3255;
pub const GL_PIXEL_MAP_B_TO_B_SIZE = 3256;
pub const GL_PIXEL_MAP_A_TO_A_SIZE = 3257;
pub const GL_UNPACK_SWAP_BYTES = 3312;
pub const GL_UNPACK_LSB_FIRST = 3313;
pub const GL_UNPACK_ROW_LENGTH = 3314;
pub const GL_UNPACK_SKIP_ROWS = 3315;
pub const GL_UNPACK_SKIP_PIXELS = 3316;
pub const GL_UNPACK_ALIGNMENT = 3317;
pub const GL_PACK_SWAP_BYTES = 3328;
pub const GL_PACK_LSB_FIRST = 3329;
pub const GL_PACK_ROW_LENGTH = 3330;
pub const GL_PACK_SKIP_ROWS = 3331;
pub const GL_PACK_SKIP_PIXELS = 3332;
pub const GL_PACK_ALIGNMENT = 3333;
pub const GL_MAP_COLOR = 3344;
pub const GL_MAP_STENCIL = 3345;
pub const GL_INDEX_SHIFT = 3346;
pub const GL_INDEX_OFFSET = 3347;
pub const GL_RED_SCALE = 3348;
pub const GL_RED_BIAS = 3349;
pub const GL_ZOOM_X = 3350;
pub const GL_ZOOM_Y = 3351;
pub const GL_GREEN_SCALE = 3352;
pub const GL_GREEN_BIAS = 3353;
pub const GL_BLUE_SCALE = 3354;
pub const GL_BLUE_BIAS = 3355;
pub const GL_ALPHA_SCALE = 3356;
pub const GL_ALPHA_BIAS = 3357;
pub const GL_DEPTH_SCALE = 3358;
pub const GL_DEPTH_BIAS = 3359;
pub const GL_MAX_EVAL_ORDER = 3376;
pub const GL_MAX_LIGHTS = 3377;
pub const GL_MAX_CLIP_PLANES = 3378;
pub const GL_MAX_TEXTURE_SIZE = 3379;
pub const GL_MAX_PIXEL_MAP_TABLE = 3380;
pub const GL_MAX_ATTRIB_STACK_DEPTH = 3381;
pub const GL_MAX_MODELVIEW_STACK_DEPTH = 3382;
pub const GL_MAX_NAME_STACK_DEPTH = 3383;
pub const GL_MAX_PROJECTION_STACK_DEPTH = 3384;
pub const GL_MAX_TEXTURE_STACK_DEPTH = 3385;
pub const GL_MAX_VIEWPORT_DIMS = 3386;
pub const GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = 3387;
pub const GL_SUBPIXEL_BITS = 3408;
pub const GL_INDEX_BITS = 3409;
pub const GL_RED_BITS = 3410;
pub const GL_GREEN_BITS = 3411;
pub const GL_BLUE_BITS = 3412;
pub const GL_ALPHA_BITS = 3413;
pub const GL_DEPTH_BITS = 3414;
pub const GL_STENCIL_BITS = 3415;
pub const GL_ACCUM_RED_BITS = 3416;
pub const GL_ACCUM_GREEN_BITS = 3417;
pub const GL_ACCUM_BLUE_BITS = 3418;
pub const GL_ACCUM_ALPHA_BITS = 3419;
pub const GL_NAME_STACK_DEPTH = 3440;
pub const GL_AUTO_NORMAL = 3456;
pub const GL_MAP1_COLOR_4 = 3472;
pub const GL_MAP1_INDEX = 3473;
pub const GL_MAP1_NORMAL = 3474;
pub const GL_MAP1_TEXTURE_COORD_1 = 3475;
pub const GL_MAP1_TEXTURE_COORD_2 = 3476;
pub const GL_MAP1_TEXTURE_COORD_3 = 3477;
pub const GL_MAP1_TEXTURE_COORD_4 = 3478;
pub const GL_MAP1_VERTEX_3 = 3479;
pub const GL_MAP1_VERTEX_4 = 3480;
pub const GL_MAP2_COLOR_4 = 3504;
pub const GL_MAP2_INDEX = 3505;
pub const GL_MAP2_NORMAL = 3506;
pub const GL_MAP2_TEXTURE_COORD_1 = 3507;
pub const GL_MAP2_TEXTURE_COORD_2 = 3508;
pub const GL_MAP2_TEXTURE_COORD_3 = 3509;
pub const GL_MAP2_TEXTURE_COORD_4 = 3510;
pub const GL_MAP2_VERTEX_3 = 3511;
pub const GL_MAP2_VERTEX_4 = 3512;
pub const GL_MAP1_GRID_DOMAIN = 3536;
pub const GL_MAP1_GRID_SEGMENTS = 3537;
pub const GL_MAP2_GRID_DOMAIN = 3538;
pub const GL_MAP2_GRID_SEGMENTS = 3539;
pub const GL_TEXTURE_1D = 3552;
pub const GL_TEXTURE_2D = 3553;
pub const GL_FEEDBACK_BUFFER_POINTER = 3568;
pub const GL_FEEDBACK_BUFFER_SIZE = 3569;
pub const GL_FEEDBACK_BUFFER_TYPE = 3570;
pub const GL_SELECTION_BUFFER_POINTER = 3571;
pub const GL_SELECTION_BUFFER_SIZE = 3572;
pub const GL_TEXTURE_WIDTH = 4096;
pub const GL_TEXTURE_HEIGHT = 4097;
pub const GL_TEXTURE_INTERNAL_FORMAT = 4099;
pub const GL_TEXTURE_BORDER_COLOR = 4100;
pub const GL_TEXTURE_BORDER = 4101;
pub const GL_DONT_CARE = 4352;
pub const GL_FASTEST = 4353;
pub const GL_NICEST = 4354;
pub const GL_LIGHT0 = 16384;
pub const GL_LIGHT1 = 16385;
pub const GL_LIGHT2 = 16386;
pub const GL_LIGHT3 = 16387;
pub const GL_LIGHT4 = 16388;
pub const GL_LIGHT5 = 16389;
pub const GL_LIGHT6 = 16390;
pub const GL_LIGHT7 = 16391;
pub const GL_AMBIENT = 4608;
pub const GL_DIFFUSE = 4609;
pub const GL_SPECULAR = 4610;
pub const GL_POSITION = 4611;
pub const GL_SPOT_DIRECTION = 4612;
pub const GL_SPOT_EXPONENT = 4613;
pub const GL_SPOT_CUTOFF = 4614;
pub const GL_CONSTANT_ATTENUATION = 4615;
pub const GL_LINEAR_ATTENUATION = 4616;
pub const GL_QUADRATIC_ATTENUATION = 4617;
pub const GL_COMPILE = 4864;
pub const GL_COMPILE_AND_EXECUTE = 4865;
pub const GL_CLEAR = 5376;
pub const GL_AND = 5377;
pub const GL_AND_REVERSE = 5378;
pub const GL_COPY = 5379;
pub const GL_AND_INVERTED = 5380;
pub const GL_NOOP = 5381;
pub const GL_XOR = 5382;
pub const GL_OR = 5383;
pub const GL_NOR = 5384;
pub const GL_EQUIV = 5385;
pub const GL_INVERT = 5386;
pub const GL_OR_REVERSE = 5387;
pub const GL_COPY_INVERTED = 5388;
pub const GL_OR_INVERTED = 5389;
pub const GL_NAND = 5390;
pub const GL_SET = 5391;
pub const GL_EMISSION = 5632;
pub const GL_SHININESS = 5633;
pub const GL_AMBIENT_AND_DIFFUSE = 5634;
pub const GL_COLOR_INDEXES = 5635;
pub const GL_MODELVIEW = 5888;
pub const GL_PROJECTION = 5889;
pub const GL_TEXTURE = 5890;
pub const GL_COLOR = 6144;
pub const GL_DEPTH = 6145;
pub const GL_STENCIL = 6146;
pub const GL_COLOR_INDEX = 6400;
pub const GL_STENCIL_INDEX = 6401;
pub const GL_DEPTH_COMPONENT = 6402;
pub const GL_RED = 6403;
pub const GL_GREEN = 6404;
pub const GL_BLUE = 6405;
pub const GL_ALPHA = 6406;
pub const GL_RGB = 6407;
pub const GL_RGBA = 6408;
pub const GL_LUMINANCE = 6409;
pub const GL_LUMINANCE_ALPHA = 6410;
pub const GL_BITMAP = 6656;
pub const GL_POINT = 6912;
pub const GL_LINE = 6913;
pub const GL_FILL = 6914;
pub const GL_RENDER = 7168;
pub const GL_FEEDBACK = 7169;
pub const GL_SELECT = 7170;
pub const GL_FLAT = 7424;
pub const GL_SMOOTH = 7425;
pub const GL_KEEP = 7680;
pub const GL_REPLACE = 7681;
pub const GL_INCR = 7682;
pub const GL_DECR = 7683;
pub const GL_VENDOR = 7936;
pub const GL_RENDERER = 7937;
pub const GL_VERSION = 7938;
pub const GL_EXTENSIONS = 7939;
pub const GL_S = 8192;
pub const GL_T = 8193;
pub const GL_R = 8194;
pub const GL_Q = 8195;
pub const GL_MODULATE = 8448;
pub const GL_DECAL = 8449;
pub const GL_TEXTURE_ENV_MODE = 8704;
pub const GL_TEXTURE_ENV_COLOR = 8705;
pub const GL_TEXTURE_ENV = 8960;
pub const GL_EYE_LINEAR = 9216;
pub const GL_OBJECT_LINEAR = 9217;
pub const GL_SPHERE_MAP = 9218;
pub const GL_TEXTURE_GEN_MODE = 9472;
pub const GL_OBJECT_PLANE = 9473;
pub const GL_EYE_PLANE = 9474;
pub const GL_NEAREST = 9728;
pub const GL_LINEAR = 9729;
pub const GL_NEAREST_MIPMAP_NEAREST = 9984;
pub const GL_LINEAR_MIPMAP_NEAREST = 9985;
pub const GL_NEAREST_MIPMAP_LINEAR = 9986;
pub const GL_LINEAR_MIPMAP_LINEAR = 9987;
pub const GL_TEXTURE_MAG_FILTER = 10240;
pub const GL_TEXTURE_MIN_FILTER = 10241;
pub const GL_TEXTURE_WRAP_S = 10242;
pub const GL_TEXTURE_WRAP_T = 10243;
pub const GL_CLAMP = 10496;
pub const GL_REPEAT = 10497;
pub const GL_CLIENT_PIXEL_STORE_BIT = 1;
pub const GL_CLIENT_VERTEX_ARRAY_BIT = 2;
pub const GL_CLIENT_ALL_ATTRIB_BITS = 4294967295;
pub const GL_POLYGON_OFFSET_FACTOR = 32824;
pub const GL_POLYGON_OFFSET_UNITS = 10752;
pub const GL_POLYGON_OFFSET_POINT = 10753;
pub const GL_POLYGON_OFFSET_LINE = 10754;
pub const GL_POLYGON_OFFSET_FILL = 32823;
pub const GL_ALPHA4 = 32827;
pub const GL_ALPHA8 = 32828;
pub const GL_ALPHA12 = 32829;
pub const GL_ALPHA16 = 32830;
pub const GL_LUMINANCE4 = 32831;
pub const GL_LUMINANCE8 = 32832;
pub const GL_LUMINANCE12 = 32833;
pub const GL_LUMINANCE16 = 32834;
pub const GL_LUMINANCE4_ALPHA4 = 32835;
pub const GL_LUMINANCE6_ALPHA2 = 32836;
pub const GL_LUMINANCE8_ALPHA8 = 32837;
pub const GL_LUMINANCE12_ALPHA4 = 32838;
pub const GL_LUMINANCE12_ALPHA12 = 32839;
pub const GL_LUMINANCE16_ALPHA16 = 32840;
pub const GL_INTENSITY = 32841;
pub const GL_INTENSITY4 = 32842;
pub const GL_INTENSITY8 = 32843;
pub const GL_INTENSITY12 = 32844;
pub const GL_INTENSITY16 = 32845;
pub const GL_R3_G3_B2 = 10768;
pub const GL_RGB4 = 32847;
pub const GL_RGB5 = 32848;
pub const GL_RGB8 = 32849;
pub const GL_RGB10 = 32850;
pub const GL_RGB12 = 32851;
pub const GL_RGB16 = 32852;
pub const GL_RGBA2 = 32853;
pub const GL_RGBA4 = 32854;
pub const GL_RGB5_A1 = 32855;
pub const GL_RGBA8 = 32856;
pub const GL_RGB10_A2 = 32857;
pub const GL_RGBA12 = 32858;
pub const GL_RGBA16 = 32859;
pub const GL_TEXTURE_RED_SIZE = 32860;
pub const GL_TEXTURE_GREEN_SIZE = 32861;
pub const GL_TEXTURE_BLUE_SIZE = 32862;
pub const GL_TEXTURE_ALPHA_SIZE = 32863;
pub const GL_TEXTURE_LUMINANCE_SIZE = 32864;
pub const GL_TEXTURE_INTENSITY_SIZE = 32865;
pub const GL_PROXY_TEXTURE_1D = 32867;
pub const GL_PROXY_TEXTURE_2D = 32868;
pub const GL_TEXTURE_PRIORITY = 32870;
pub const GL_TEXTURE_RESIDENT = 32871;
pub const GL_TEXTURE_BINDING_1D = 32872;
pub const GL_TEXTURE_BINDING_2D = 32873;
pub const GL_VERTEX_ARRAY = 32884;
pub const GL_NORMAL_ARRAY = 32885;
pub const GL_COLOR_ARRAY = 32886;
pub const GL_INDEX_ARRAY = 32887;
pub const GL_TEXTURE_COORD_ARRAY = 32888;
pub const GL_EDGE_FLAG_ARRAY = 32889;
pub const GL_VERTEX_ARRAY_SIZE = 32890;
pub const GL_VERTEX_ARRAY_TYPE = 32891;
pub const GL_VERTEX_ARRAY_STRIDE = 32892;
pub const GL_NORMAL_ARRAY_TYPE = 32894;
pub const GL_NORMAL_ARRAY_STRIDE = 32895;
pub const GL_COLOR_ARRAY_SIZE = 32897;
pub const GL_COLOR_ARRAY_TYPE = 32898;
pub const GL_COLOR_ARRAY_STRIDE = 32899;
pub const GL_INDEX_ARRAY_TYPE = 32901;
pub const GL_INDEX_ARRAY_STRIDE = 32902;
pub const GL_TEXTURE_COORD_ARRAY_SIZE = 32904;
pub const GL_TEXTURE_COORD_ARRAY_TYPE = 32905;
pub const GL_TEXTURE_COORD_ARRAY_STRIDE = 32906;
pub const GL_EDGE_FLAG_ARRAY_STRIDE = 32908;
pub const GL_VERTEX_ARRAY_POINTER = 32910;
pub const GL_NORMAL_ARRAY_POINTER = 32911;
pub const GL_COLOR_ARRAY_POINTER = 32912;
pub const GL_INDEX_ARRAY_POINTER = 32913;
pub const GL_TEXTURE_COORD_ARRAY_POINTER = 32914;
pub const GL_EDGE_FLAG_ARRAY_POINTER = 32915;
pub const GL_V2F = 10784;
pub const GL_V3F = 10785;
pub const GL_C4UB_V2F = 10786;
pub const GL_C4UB_V3F = 10787;
pub const GL_C3F_V3F = 10788;
pub const GL_N3F_V3F = 10789;
pub const GL_C4F_N3F_V3F = 10790;
pub const GL_T2F_V3F = 10791;
pub const GL_T4F_V4F = 10792;
pub const GL_T2F_C4UB_V3F = 10793;
pub const GL_T2F_C3F_V3F = 10794;
pub const GL_T2F_N3F_V3F = 10795;
pub const GL_T2F_C4F_N3F_V3F = 10796;
pub const GL_T4F_C4F_N3F_V4F = 10797;
pub const GL_EXT_vertex_array = 1;
pub const GL_EXT_bgra = 1;
pub const GL_EXT_paletted_texture = 1;
pub const GL_WIN_swap_hint = 1;
pub const GL_WIN_draw_range_elements = 1;
pub const GL_VERTEX_ARRAY_EXT = 32884;
pub const GL_NORMAL_ARRAY_EXT = 32885;
pub const GL_COLOR_ARRAY_EXT = 32886;
pub const GL_INDEX_ARRAY_EXT = 32887;
pub const GL_TEXTURE_COORD_ARRAY_EXT = 32888;
pub const GL_EDGE_FLAG_ARRAY_EXT = 32889;
pub const GL_VERTEX_ARRAY_SIZE_EXT = 32890;
pub const GL_VERTEX_ARRAY_TYPE_EXT = 32891;
pub const GL_VERTEX_ARRAY_STRIDE_EXT = 32892;
pub const GL_VERTEX_ARRAY_COUNT_EXT = 32893;
pub const GL_NORMAL_ARRAY_TYPE_EXT = 32894;
pub const GL_NORMAL_ARRAY_STRIDE_EXT = 32895;
pub const GL_NORMAL_ARRAY_COUNT_EXT = 32896;
pub const GL_COLOR_ARRAY_SIZE_EXT = 32897;
pub const GL_COLOR_ARRAY_TYPE_EXT = 32898;
pub const GL_COLOR_ARRAY_STRIDE_EXT = 32899;
pub const GL_COLOR_ARRAY_COUNT_EXT = 32900;
pub const GL_INDEX_ARRAY_TYPE_EXT = 32901;
pub const GL_INDEX_ARRAY_STRIDE_EXT = 32902;
pub const GL_INDEX_ARRAY_COUNT_EXT = 32903;
pub const GL_TEXTURE_COORD_ARRAY_SIZE_EXT = 32904;
pub const GL_TEXTURE_COORD_ARRAY_TYPE_EXT = 32905;
pub const GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 32906;
pub const GL_TEXTURE_COORD_ARRAY_COUNT_EXT = 32907;
pub const GL_EDGE_FLAG_ARRAY_STRIDE_EXT = 32908;
pub const GL_EDGE_FLAG_ARRAY_COUNT_EXT = 32909;
pub const GL_VERTEX_ARRAY_POINTER_EXT = 32910;
pub const GL_NORMAL_ARRAY_POINTER_EXT = 32911;
pub const GL_COLOR_ARRAY_POINTER_EXT = 32912;
pub const GL_INDEX_ARRAY_POINTER_EXT = 32913;
pub const GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 32914;
pub const GL_EDGE_FLAG_ARRAY_POINTER_EXT = 32915;
pub const GL_DOUBLE_EXT = 5130;
pub const GL_BGR_EXT = 32992;
pub const GL_BGRA_EXT = 32993;
pub const GL_COLOR_TABLE_FORMAT_EXT = 32984;
pub const GL_COLOR_TABLE_WIDTH_EXT = 32985;
pub const GL_COLOR_TABLE_RED_SIZE_EXT = 32986;
pub const GL_COLOR_TABLE_GREEN_SIZE_EXT = 32987;
pub const GL_COLOR_TABLE_BLUE_SIZE_EXT = 32988;
pub const GL_COLOR_TABLE_ALPHA_SIZE_EXT = 32989;
pub const GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = 32990;
pub const GL_COLOR_TABLE_INTENSITY_SIZE_EXT = 32991;
pub const GL_COLOR_INDEX1_EXT = 32994;
pub const GL_COLOR_INDEX2_EXT = 32995;
pub const GL_COLOR_INDEX4_EXT = 32996;
pub const GL_COLOR_INDEX8_EXT = 32997;
pub const GL_COLOR_INDEX12_EXT = 32998;
pub const GL_COLOR_INDEX16_EXT = 32999;
pub const GL_MAX_ELEMENTS_VERTICES_WIN = 33000;
pub const GL_MAX_ELEMENTS_INDICES_WIN = 33001;
pub const GL_PHONG_WIN = 33002;
pub const GL_PHONG_HINT_WIN = 33003;
pub const GL_FOG_SPECULAR_TEXTURE_WIN = 33004;
pub const GL_LOGIC_OP = 3057;
pub const GL_TEXTURE_COMPONENTS = 4099;
pub const GLU_VERSION_1_1 = 1;
pub const GLU_VERSION_1_2 = 1;
pub const GLU_INVALID_ENUM = 100900;
pub const GLU_INVALID_VALUE = 100901;
pub const GLU_OUT_OF_MEMORY = 100902;
pub const GLU_INCOMPATIBLE_GL_VERSION = 100903;
pub const GLU_VERSION = 100800;
pub const GLU_EXTENSIONS = 100801;
pub const GLU_TRUE = 1;
pub const GLU_FALSE = 0;
pub const GLU_SMOOTH = 100000;
pub const GLU_FLAT = 100001;
pub const GLU_NONE = 100002;
pub const GLU_POINT = 100010;
pub const GLU_LINE = 100011;
pub const GLU_FILL = 100012;
pub const GLU_SILHOUETTE = 100013;
pub const GLU_OUTSIDE = 100020;
pub const GLU_INSIDE = 100021;
pub const GLU_TESS_WINDING_RULE = 100140;
pub const GLU_TESS_BOUNDARY_ONLY = 100141;
pub const GLU_TESS_TOLERANCE = 100142;
pub const GLU_TESS_WINDING_ODD = 100130;
pub const GLU_TESS_WINDING_NONZERO = 100131;
pub const GLU_TESS_WINDING_POSITIVE = 100132;
pub const GLU_TESS_WINDING_NEGATIVE = 100133;
pub const GLU_TESS_WINDING_ABS_GEQ_TWO = 100134;
pub const GLU_TESS_BEGIN = 100100;
pub const GLU_TESS_VERTEX = 100101;
pub const GLU_TESS_END = 100102;
pub const GLU_TESS_ERROR = 100103;
pub const GLU_TESS_EDGE_FLAG = 100104;
pub const GLU_TESS_COMBINE = 100105;
pub const GLU_TESS_BEGIN_DATA = 100106;
pub const GLU_TESS_VERTEX_DATA = 100107;
pub const GLU_TESS_END_DATA = 100108;
pub const GLU_TESS_ERROR_DATA = 100109;
pub const GLU_TESS_EDGE_FLAG_DATA = 100110;
pub const GLU_TESS_COMBINE_DATA = 100111;
pub const GLU_TESS_ERROR1 = 100151;
pub const GLU_TESS_ERROR2 = 100152;
pub const GLU_TESS_ERROR3 = 100153;
pub const GLU_TESS_ERROR4 = 100154;
pub const GLU_TESS_ERROR5 = 100155;
pub const GLU_TESS_ERROR6 = 100156;
pub const GLU_TESS_ERROR7 = 100157;
pub const GLU_TESS_ERROR8 = 100158;
pub const GLU_TESS_MISSING_BEGIN_POLYGON = 100151;
pub const GLU_TESS_MISSING_BEGIN_CONTOUR = 100152;
pub const GLU_TESS_MISSING_END_POLYGON = 100153;
pub const GLU_TESS_MISSING_END_CONTOUR = 100154;
pub const GLU_TESS_COORD_TOO_LARGE = 100155;
pub const GLU_TESS_NEED_COMBINE_CALLBACK = 100156;
pub const GLU_AUTO_LOAD_MATRIX = 100200;
pub const GLU_CULLING = 100201;
pub const GLU_SAMPLING_TOLERANCE = 100203;
pub const GLU_DISPLAY_MODE = 100204;
pub const GLU_PARAMETRIC_TOLERANCE = 100202;
pub const GLU_SAMPLING_METHOD = 100205;
pub const GLU_U_STEP = 100206;
pub const GLU_V_STEP = 100207;
pub const GLU_PATH_LENGTH = 100215;
pub const GLU_PARAMETRIC_ERROR = 100216;
pub const GLU_DOMAIN_DISTANCE = 100217;
pub const GLU_MAP1_TRIM_2 = 100210;
pub const GLU_MAP1_TRIM_3 = 100211;
pub const GLU_OUTLINE_POLYGON = 100240;
pub const GLU_OUTLINE_PATCH = 100241;
pub const GLU_NURBS_ERROR1 = 100251;
pub const GLU_NURBS_ERROR2 = 100252;
pub const GLU_NURBS_ERROR3 = 100253;
pub const GLU_NURBS_ERROR4 = 100254;
pub const GLU_NURBS_ERROR5 = 100255;
pub const GLU_NURBS_ERROR6 = 100256;
pub const GLU_NURBS_ERROR7 = 100257;
pub const GLU_NURBS_ERROR8 = 100258;
pub const GLU_NURBS_ERROR9 = 100259;
pub const GLU_NURBS_ERROR10 = 100260;
pub const GLU_NURBS_ERROR11 = 100261;
pub const GLU_NURBS_ERROR12 = 100262;
pub const GLU_NURBS_ERROR13 = 100263;
pub const GLU_NURBS_ERROR14 = 100264;
pub const GLU_NURBS_ERROR15 = 100265;
pub const GLU_NURBS_ERROR16 = 100266;
pub const GLU_NURBS_ERROR17 = 100267;
pub const GLU_NURBS_ERROR18 = 100268;
pub const GLU_NURBS_ERROR19 = 100269;
pub const GLU_NURBS_ERROR20 = 100270;
pub const GLU_NURBS_ERROR21 = 100271;
pub const GLU_NURBS_ERROR22 = 100272;
pub const GLU_NURBS_ERROR23 = 100273;
pub const GLU_NURBS_ERROR24 = 100274;
pub const GLU_NURBS_ERROR25 = 100275;
pub const GLU_NURBS_ERROR26 = 100276;
pub const GLU_NURBS_ERROR27 = 100277;
pub const GLU_NURBS_ERROR28 = 100278;
pub const GLU_NURBS_ERROR29 = 100279;
pub const GLU_NURBS_ERROR30 = 100280;
pub const GLU_NURBS_ERROR31 = 100281;
pub const GLU_NURBS_ERROR32 = 100282;
pub const GLU_NURBS_ERROR33 = 100283;
pub const GLU_NURBS_ERROR34 = 100284;
pub const GLU_NURBS_ERROR35 = 100285;
pub const GLU_NURBS_ERROR36 = 100286;
pub const GLU_NURBS_ERROR37 = 100287;
pub const GLU_CW = 100120;
pub const GLU_CCW = 100121;
pub const GLU_INTERIOR = 100122;
pub const GLU_EXTERIOR = 100123;
pub const GLU_UNKNOWN = 100124;
pub const GLU_BEGIN = 100100;
pub const GLU_VERTEX = 100101;
pub const GLU_END = 100102;
pub const GLU_ERROR = 100103;
pub const GLU_EDGE_FLAG = 100104;

pub const aliases = struct {
    pub const PFD_PIXEL_TYPE = u8;
    pub const PFD_LAYER_TYPE = i8;
    pub const PFD_FLAGS = u32;
    pub const HGLRC = ?*anyopaque;
    pub const GLUnurbs = isize;
    pub const GLUquadric = isize;
    pub const GLUtesselator = isize;
};
