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

/// Emit a `pub const <Name> = enum(<repr>) { ... };` for every enum
/// TypeDef in `namespace`. An enum is a TypeDef whose `Extends` column
/// resolves to `System.Enum`; its first field (instance, name `value__`)
/// carries the underlying integer type, and every subsequent field is a
/// `static literal` whose value lives in the Constant table.
///
/// Emitted enums are non-exhaustive (`_`) so that OR'd flag values —
/// common in `FlagsAttribute`-decorated enums — remain representable at
/// the API surface. Duplicate declared values would still be rejected by
/// the Zig compiler; if any such enum surfaces in metadata we'll need a
/// second strategy for that kind.
pub fn emitEnums(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System") or !std.mem.eql(u8, base.name, "Enum")) continue;

        const fields = file.list(.type_def, row, 4, .field);
        if (fields.start == fields.end) continue;

        // Locate `value__` (instance field, FieldAttributes.SpecialName=0x200,
        // FieldAttributes.RTSpecialName=0x400). In practice it's always the
        // first field of the enum TypeDef; fall back to a name check.
        var repr_field: u32 = fields.start;
        const first_name = file.str(.field, fields.start, 1);
        if (!std.mem.eql(u8, first_name, "value__")) {
            var f: u32 = fields.start;
            while (f < fields.end) : (f += 1) {
                if (std.mem.eql(u8, file.str(.field, f, 1), "value__")) {
                    repr_field = f;
                    break;
                }
            } else continue;
        }

        const repr_ty = winmd.readFieldSignature(arena, file, file.blob(.field, repr_field, 2)) catch continue;
        const repr_str = zigReprFor(repr_ty) orelse continue;

        const name = file.str(.type_def, row, 1);
        try writer.print("pub const {s} = enum({s}) {{\n", .{ name, repr_str });

        var f: u32 = fields.start;
        while (f < fields.end) : (f += 1) {
            if (f == repr_field) continue;

            // Static literal fields are flagged FieldAttributes.Static=0x10 |
            // Literal=0x40. The Constant row is sorted by Parent so a
            // binary-search range of one row is expected.
            const parent_tok = (@as(u32, f + 1) << 2) | 0; // HasConstant tag 0 = Field
            const range = file.equalRange(.constant, 1, parent_tok);
            if (range.start == range.end) continue;

            const type_code: u8 = @intCast(file.cell(.constant, range.start, 0) & 0xFF);
            const value_blob = file.blob(.constant, range.start, 2);
            const raw = readConstantValue(type_code, value_blob) orelse continue;

            const variant_name = file.str(.field, f, 1);
            // Print as signed when underlying type is signed, unsigned
            // otherwise; match the declared enum tag type.
            if (isSignedRepr(repr_ty)) {
                const signed: i64 = @bitCast(raw);
                try writer.print("    {s} = {d},\n", .{ variant_name, signed });
            } else {
                try writer.print("    {s} = {d},\n", .{ variant_name, raw });
            }
        }

        try writer.writeAll("    _,\n};\n");
    }
}

/// Map a primitive `Ty` to its Zig name for use as an enum tag type.
/// Returns null for anything that can't back a CLI enum.
fn zigReprFor(ty: winmd.Ty) ?[]const u8 {
    return switch (ty) {
        .i8 => "i8",
        .u8 => "u8",
        .i16 => "i16",
        .u16 => "u16",
        .i32 => "i32",
        .u32 => "u32",
        .i64 => "i64",
        .u64 => "u64",
        else => null,
    };
}

fn isSignedRepr(ty: winmd.Ty) bool {
    return switch (ty) {
        .i8, .i16, .i32, .i64 => true,
        else => false,
    };
}

/// Decode a Constant.Value blob as a `u64` bit pattern. Only integer
/// ELEMENT_TYPE codes relevant to enums are handled. Returns null for
/// unsupported or truncated blobs.
fn readConstantValue(type_code: u8, blob: []const u8) ?u64 {
    // ELEMENT_TYPE codes from ECMA-335 §II.23.1.16.
    const ET_BOOLEAN: u8 = 0x02;
    const ET_CHAR: u8 = 0x03;
    const ET_I1: u8 = 0x04;
    const ET_U1: u8 = 0x05;
    const ET_I2: u8 = 0x06;
    const ET_U2: u8 = 0x07;
    const ET_I4: u8 = 0x08;
    const ET_U4: u8 = 0x09;
    const ET_I8: u8 = 0x0A;
    const ET_U8: u8 = 0x0B;
    switch (type_code) {
        ET_BOOLEAN, ET_I1, ET_U1 => {
            if (blob.len < 1) return null;
            return @as(u64, blob[0]);
        },
        ET_CHAR, ET_I2, ET_U2 => {
            if (blob.len < 2) return null;
            return @as(u64, std.mem.readInt(u16, blob[0..2], .little));
        },
        ET_I4, ET_U4 => {
            if (blob.len < 4) return null;
            return @as(u64, std.mem.readInt(u32, blob[0..4], .little));
        },
        ET_I8, ET_U8 => {
            if (blob.len < 8) return null;
            return std.mem.readInt(u64, blob[0..8], .little);
        },
        else => return null,
    }
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

/// Emit a top-level handle type for each non-generic interface in
/// `namespace`. Shape:
///
///     pub const IStringable = extern struct {
///         vtable: *const IStringable_Vtbl,
///     };
///
/// This is the canonical COM object shape: every interface pointer
/// points to an object whose first word is the vtbl pointer. Having a
/// named type per interface lets callers write `*IStringable` rather
/// than juggling raw `*anyopaque` values, and is the foundation for a
/// later slice that replaces `class_name → *anyopaque` in vtbl params
/// with typed pointers.
///
/// Must be paired with `emitInterfaceVtbls` in the same compilation
/// unit (or with the vtbls in scope via import), since the handle
/// references `<Name>_Vtbl` directly.
pub fn emitInterfaceHandles(
    writer: *std.Io.Writer,
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
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;

        try writer.print(
            \\pub const {s} = extern struct {{
            \\    vtable: *const {s}_Vtbl,
            \\}};
            \\
        , .{ name, name });
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

test "emitEnums writes AsyncStatus from Windows.Foundation" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitEnums(&buf.writer, arena.allocator(), &file, "Windows.Foundation");
    const out = buf.written();

    // AsyncStatus is the canonical WinRT i32-backed async-operation enum.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const AsyncStatus = enum(i32) {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Started = 0,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Completed = 1,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Canceled = 2,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Error = 3,") != null);
    // Non-exhaustive marker lets OR'd flag values in other enums remain
    // representable without re-declaration.
    try std.testing.expect(std.mem.indexOf(u8, out, "    _,\n};") != null);

    // At least one enum is expected in Windows.Foundation (AsyncStatus
    // above) — the exact count varies by metadata vintage.
    var count: usize = 0;
    var search = out;
    while (std.mem.indexOf(u8, search, "pub const ")) |idx| {
        count += 1;
        search = search[idx + 1 ..];
    }
    try std.testing.expect(count >= 1);
}

/// Emit `extern struct` declarations for every `System.ValueType`
/// TypeDef in `namespace` that isn't an enum and whose fields all
/// map to representable Zig types. Examples in Windows.Foundation:
/// `Point { X: f32, Y: f32 }`, `Rect { X, Y, Width, Height: f32 }`,
/// `TimeSpan { Duration: i64 }`.
///
/// First-slice scope:
/// * Only non-generic, non-nested value types.
/// * Only SequentialLayout (or AutoLayout, treated as sequential for
///   the handful of metadata quirks). ExplicitLayout / union-shaped
///   types are skipped — a later slice can emit `extern union`.
/// * If any instance field's type isn't currently representable
///   (e.g. a generic type arg), the whole struct is skipped rather
///   than emitted with a hole — this keeps the output compilable.
pub fn emitStructs(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    // TypeAttributes bits (ECMA-335 §II.23.1.15).
    const VISIBILITY_MASK: u32 = 0x7;
    const VIS_NOT_PUBLIC: u32 = 0x0;
    const VIS_PUBLIC: u32 = 0x1;
    const LAYOUT_MASK: u32 = 0x18;
    const LAYOUT_EXPLICIT: u32 = 0x10;
    // FieldAttributes.Static — enum literal fields and class-level
    // constants carry this bit and must be skipped when walking
    // struct instance fields.
    const FIELD_ATTR_STATIC: u32 = 0x10;

    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const flags = file.cell(.type_def, row, 0);
        const vis = flags & VISIBILITY_MASK;
        if (vis != VIS_NOT_PUBLIC and vis != VIS_PUBLIC) continue; // nested
        if ((flags & LAYOUT_MASK) == LAYOUT_EXPLICIT) continue;

        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System")) continue;
        if (!std.mem.eql(u8, base.name, "ValueType")) continue;

        const name = file.str(.type_def, row, 1);
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;

        const field_list = file.list(.type_def, row, 4, .field);
        if (field_list.start == field_list.end) continue;

        // First pass: verify every non-static field is representable.
        // If anything is out of scope we skip the whole struct rather
        // than emit opaque fillers, which would break downstream
        // size/alignment assumptions at the ABI boundary.
        var all_ok = true;
        var f: u32 = field_list.start;
        while (f < field_list.end) : (f += 1) {
            const field_flags = file.cell(.field, f, 0);
            if ((field_flags & FIELD_ATTR_STATIC) != 0) continue;
            const ty = winmd.readFieldSignature(arena, file, file.blob(.field, f, 2)) catch {
                all_ok = false;
                break;
            };
            if (!canRepresent(ty)) {
                all_ok = false;
                break;
            }
        }
        if (!all_ok) continue;

        try writer.print("pub const {s} = extern struct {{\n", .{name});
        f = field_list.start;
        while (f < field_list.end) : (f += 1) {
            const field_flags = file.cell(.field, f, 0);
            if ((field_flags & FIELD_ATTR_STATIC) != 0) continue;
            const ty = winmd.readFieldSignature(arena, file, file.blob(.field, f, 2)) catch continue;
            const field_name = file.str(.field, f, 1);
            try writer.print("    {s}: ", .{field_name});
            _ = try writeZigTy(writer, ty);
            try writer.writeAll(",\n");
        }
        try writer.writeAll("};\n");
    }
}

test "emitStructs writes Point/Rect/TimeSpan from Windows.Foundation" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Foundation");
    const out = buf.written();

    // Point — classic two-f32 struct, a canary for sequential layout.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Point = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    X: f32,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Y: f32,") != null);

    // Rect — four f32s in declaration order.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Rect = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Width: f32,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Height: f32,") != null);

    // TimeSpan — single i64 field, exercises non-f32 primitives.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const TimeSpan = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "    Duration: i64,") != null);
}

test "emitInterfaceHandles writes IStringable handle" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitInterfaceHandles(&buf.writer, &file, "Windows.Foundation");
    const out = buf.written();

    // Canonical COM object layout: first word is the vtbl pointer.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const IStringable = extern struct {\n    vtable: *const IStringable_Vtbl,\n};",
    ) != null);

    // Many interfaces should have been emitted.
    var count: usize = 0;
    var search = out;
    while (std.mem.indexOf(u8, search, "pub const I")) |idx| {
        count += 1;
        search = search[idx + 1 ..];
    }
    try std.testing.expect(count > 5);
}
