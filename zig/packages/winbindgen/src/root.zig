//! `winbindgen` — `.winmd` → `.zig` code generator and comptime projector.
//!
//! Phase 3 target: a CLI compatible with `windows-bindgen` that reads
//! the filter manifests under `tools/bindings/src/*.txt` and emits
//! namespaced `.zig` files into `packages/win-sys/src/` and
//! `packages/win/src/`.
//!
//! Phase 4 target: `project(.{ .filter = ... })` — a `comptime` function
//! that materializes the requested subset of the API directly using
//! `@Struct`, `@Enum`, and `@Union` (the per-kind type-creating builtins
//! introduced in Zig 0.16). No generated source files.

const std = @import("std");
const winmd = @import("winmd");

/// `TypeAttributes.Interface` (ECMA-335 §II.23.1.15) — set on every
/// TypeDef representing a COM / WinRT interface.
const TYPE_ATTR_INTERFACE: u32 = 0x20;

/// Placeholder — full CLI lands later in Phase 3.
pub fn generate(_: std.mem.Allocator) !void {}

/// Write every `IID_<Name>` constant for interfaces in `namespace` to
/// `writer`, in TypeDef row order. Skips types that lack a
/// `GuidAttribute` (e.g. dispinterface forwards without a runtime IID).
///
/// `arena` is used for attribute-arg decoding; the caller owns its
/// lifetime. Typical use is to pass a `std.heap.ArenaAllocator`
/// allocator and reset it after each namespace.
pub fn emitIidConstants(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        const ns = file.str(.type_def, row, 2);
        if (!std.mem.eql(u8, ns, namespace)) continue;

        const flags = file.cell(.type_def, row, 0);
        if ((flags & TYPE_ATTR_INTERFACE) == 0) continue;

        const attr_row = winmd.findAttribute(file, .type_def, row, "GuidAttribute") orelse continue;
        const args = winmd.readAttributeArgs(arena, file, attr_row) catch continue;
        if (args.len < 11) continue;

        var parts: [11]u64 = undefined;
        inline for (0..11) |i| {
            parts[i] = switch (args[i].value) {
                .u32_val => |v| v,
                .u16_val => |v| v,
                .u8_val => |v| v,
                else => return error.BadGuidAttribute,
            };
        }

        const name = file.str(.type_def, row, 1);
        try writer.print(
            \\pub const IID_{s}: GUID = .{{
            \\    .data1 = 0x{X:0>8},
            \\    .data2 = 0x{X:0>4},
            \\    .data3 = 0x{X:0>4},
            \\    .data4 = .{{ 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2}, 0x{X:0>2} }},
            \\}};
            \\
        ,
            .{
                name,
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[4],
                parts[5],
                parts[6],
                parts[7],
                parts[8],
                parts[9],
                parts[10],
            },
        );
    }
}

test "placeholder" {
    _ = winmd;
    try std.testing.expect(true);
}

test "emitIidConstants writes IStringable from Windows.Foundation" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);
    _ = &file;

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitIidConstants(&buf.writer, arena.allocator(), &file, "Windows.Foundation");
    const out = buf.written();

    // IStringable's IID is the canonical `{96369F54-8EB6-48F0-ABCE-C1B211E627C3}`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IID_IStringable: GUID") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".data1 = 0x96369F54") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".data2 = 0x8EB6") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".data3 = 0x48F0") != null);
    // data4 bytes: AB CE C1 B2 11 E6 27 C3
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "0xAB, 0xCE, 0xC1, 0xB2, 0x11, 0xE6, 0x27, 0xC3",
    ) != null);

    // Make sure we emit more than one entry — count IID_ prefixes.
    var count: usize = 0;
    var search = out;
    while (std.mem.indexOf(u8, search, "pub const IID_")) |idx| {
        count += 1;
        search = search[idx + 1 ..];
    }
    try std.testing.expect(count > 10);
}

/// Emit a `<Name>_Vtbl extern struct` per interface in `namespace`.
///
/// First-slice emission: each method is typed as `*const anyopaque`
/// so we prove the method walker independently of the full
/// type-mapping layer. Vtbl field order matches MethodDef row order,
/// which is the ABI slot order for COM / WinRT. A later slice will
/// replace the opaque fields with real
/// `*const fn(...) callconv(.winapi) HRESULT` function pointers
/// derived from the MethodDef signature blob.
///
/// Every WinRT interface's first three slots are IUnknown methods
/// followed by three IInspectable methods — captured here by
/// `base: IInspectable_Vtbl`. Classic COM interfaces that extend
/// IUnknown directly are out of scope for this slice (the WinRT
/// metadata we consume has none).
pub fn emitInterfaceVtbls(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        const flags = file.cell(.type_def, row, 0);
        if ((flags & TYPE_ATTR_INTERFACE) == 0) continue;

        const name = file.str(.type_def, row, 1);
        // Skip generic placeholders like `IVector`1` — a later slice
        // handles parameterised vtbls.
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;

        try writer.print(
            \\pub const {s}_Vtbl = extern struct {{
            \\    base: IInspectable_Vtbl,
            \\
        , .{name});

        const methods = file.list(.type_def, row, 5, .method_def);
        var m = methods.start;
        while (m < methods.end) : (m += 1) {
            const method_name = file.str(.method_def, m, 3);
            try writer.print("    {s}: ", .{method_name});
            try writeMethodPointer(writer, arena, file, m);
            try writer.writeAll(",\n");
        }

        try writer.writeAll("};\n");
    }
}

/// Emit a function-pointer type for a single MethodDef row, WinRT-ABI
/// shaped: `*const fn(this: *anyopaque, <in/out params>) callconv(.winapi) HRESULT`.
///
/// Any type in the signature that the first-slice type mapper cannot
/// render falls the whole method back to `*const anyopaque`, so new
/// type support can be added incrementally without breaking existing
/// fixtures.
fn writeMethodPointer(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    method_row: u32,
) !void {
    const sig_blob = file.blob(.method_def, method_row, 4);
    const sig = winmd.readMethodSignature(arena, file, sig_blob) catch {
        try writer.writeAll("*const anyopaque");
        return;
    };

    // Representability check: every param + return must be renderable
    // by `writeZigTy`, otherwise emit the opaque fallback.
    if (!canRepresent(sig.return_type)) {
        try writer.writeAll("*const anyopaque");
        return;
    }
    for (sig.params) |p| {
        if (!canRepresent(p)) {
            try writer.writeAll("*const anyopaque");
            return;
        }
    }

    try writer.writeAll("*const fn (this: *anyopaque");
    for (sig.params, 0..) |p, i| {
        try writer.print(", p{d}: ", .{i});
        try writeParam(writer, p);
    }
    if (sig.return_type != .void) {
        try writer.writeAll(", result: *");
        _ = try writeZigTy(writer, sig.return_type);
    }
    try writer.writeAll(") callconv(.winapi) HRESULT");
}

/// One parameter slot. WinRT conventions: `[out]` params arrive as
/// `ELEMENT_TYPE_BYREF T` in the metadata blob (decoded as `ref_mut`
/// / `ref_const` here). We render those as `*T` / `*const T`. In
/// params are passed by value.
fn writeParam(writer: *std.Io.Writer, ty: winmd.Ty) !void {
    switch (ty) {
        .ref_mut => |inner| {
            try writer.writeAll("*");
            _ = try writeZigTy(writer, inner.*);
        },
        .ref_const => |inner| {
            try writer.writeAll("*const ");
            _ = try writeZigTy(writer, inner.*);
        },
        else => _ = try writeZigTy(writer, ty),
    }
}

/// Returns true iff `writeZigTy` / `writeParam` can render `ty` as
/// a concrete Zig type with current first-slice support.
fn canRepresent(ty: winmd.Ty) bool {
    return switch (ty) {
        .void,
        .bool,
        .char,
        .i8,
        .u8,
        .i16,
        .u16,
        .i32,
        .u32,
        .i64,
        .u64,
        .f32,
        .f64,
        .string,
        .class_name,
        .value_name,
        => true,
        .ref_mut, .ref_const => |inner| canRepresent(inner.*),
        .ptr_mut => |p| canRepresent(p.inner.*),
        .ptr_const => |p| canRepresent(p.inner.*),
        else => false,
    };
}

/// Write a Zig type name for `ty`. Caller must have already verified
/// via `canRepresent` that `ty` is supported; this function never
/// returns `false` for supported input.
fn writeZigTy(writer: *std.Io.Writer, ty: winmd.Ty) !bool {
    switch (ty) {
        .void => try writer.writeAll("void"),
        .bool => try writer.writeAll("BOOL"),
        .char => try writer.writeAll("u16"),
        .i8 => try writer.writeAll("i8"),
        .u8 => try writer.writeAll("u8"),
        .i16 => try writer.writeAll("i16"),
        .u16 => try writer.writeAll("u16"),
        .i32 => try writer.writeAll("i32"),
        .u32 => try writer.writeAll("u32"),
        .i64 => try writer.writeAll("i64"),
        .u64 => try writer.writeAll("u64"),
        .f32 => try writer.writeAll("f32"),
        .f64 => try writer.writeAll("f64"),
        .string => try writer.writeAll("HSTRING"),
        // WinRT / COM interface reference. At the ABI boundary this is
        // always an opaque pointer to the object's vtbl; the concrete
        // `<Name>_Vtbl` type isn't always in scope at the emission site
        // (could be cross-namespace), so emit the type-erased form.
        // Upstream windows-rs renders the same shape as `*mut c_void`.
        .class_name => try writer.writeAll("*anyopaque"),
        // WinRT value type (enum or struct) passed by value. First
        // slice: emit the short name and trust that the same
        // declaration is in scope at the import site. Namespace-aware
        // resolution is a later slice once the enum/struct emitters
        // land and we know which names need qualifying.
        .value_name => |tn| try writer.writeAll(tn.name),
        .ptr_mut => |p| {
            var d: u32 = 0;
            while (d < p.depth) : (d += 1) try writer.writeAll("*");
            return writeZigTy(writer, p.inner.*);
        },
        .ptr_const => |p| {
            var d: u32 = 0;
            while (d < p.depth) : (d += 1) try writer.writeAll("*const ");
            return writeZigTy(writer, p.inner.*);
        },
        else => return false,
    }
    return true;
}

test "emitInterfaceVtbls writes IStringable_Vtbl with ToString slot" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitInterfaceVtbls(&buf.writer, arena.allocator(), &file, "Windows.Foundation");
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IStringable_Vtbl = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "base: IInspectable_Vtbl") != null);
    // IStringable.ToString: `HSTRING ToString()` → typed signature with
    // a trailing *HSTRING out param and HRESULT return.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "ToString: *const fn (this: *anyopaque, result: *HSTRING) callconv(.winapi) HRESULT",
    ) != null);

    // IClosable.Close: `void Close()` → no trailing out param.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IClosable_Vtbl = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "Close: *const fn (this: *anyopaque) callconv(.winapi) HRESULT",
    ) != null);

    // IUriRuntimeClassFactory.CreateUri(HSTRING uri) returns
    // IUriRuntimeClass — a class_name reference, ABI-shaped as an
    // opaque pointer. The out param therefore becomes `**anyopaque`.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "CreateUri: *const fn (this: *anyopaque, p0: HSTRING, result: **anyopaque) callconv(.winapi) HRESULT",
    ) != null);

    // IAsyncInfo.get_Status returns the `AsyncStatus` enum — a
    // by-value value_name reference. The mapper should emit the
    // short name verbatim so downstream can resolve it via @import.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "get_Status: *const fn (this: *anyopaque, result: *AsyncStatus) callconv(.winapi) HRESULT",
    ) != null);

    // At least one interface in Windows.Foundation uses types we don't
    // yet support (e.g. `IReference`1` methods with classes) — those
    // must degrade to opaque rather than fail the whole emit.
    try std.testing.expect(std.mem.indexOf(u8, out, "*const anyopaque") != null);
}
