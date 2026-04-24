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
const TYPE_ATTR_INTERFACE: u32 = winmd.TYPE_ATTR_INTERFACE;

/// Ordered set of Windows.* namespaces referenced by the types
/// written during a single `emitNamespace` call. `emitNamespace`
/// drains the set after the body is produced and emits a sorted
/// `const @"<ns>" = @import("<ns>.zig");` alias for each entry, so
/// the cross-namespace qualifiers `writeZigTy` emits resolve against
/// something concrete.
///
/// Keys point into the mmapped `#Strings` blob, so their lifetime
/// matches the `winmd.File`'s — no copying needed.
const CrossNsSet = std.StringArrayHashMapUnmanaged(void);

/// Registry of closed generic instantiations encountered during a
/// single `emitNamespace` call. Keyed by the mangled name
/// (e.g. `IReference__G1__i32`), value is the originating `TypeName`
/// whose `.generics` slice carries the argument `Ty`s.
///
/// Populated by `collectGenericInstantiations` which scans all method
/// sigs in the namespace, and optionally seeded with cross-namespace
/// entries from the bundle driver via `emitNamespaceEx`. Drained by
/// `emitGenericInstantiations` which looks up the open-def TypeDef
/// row and emits substituted `<Mangled>` + `<Mangled>_Vtbl` structs.
pub const GenericInstSet = std.StringArrayHashMapUnmanaged(winmd.TypeName);

/// M4 Phase 4b cross-namespace generic instantiation registry.
///
/// Map from home-namespace → set of closed-generic instantiations
/// whose open definition lives in that namespace. Built by
/// `discoverCrossNsGenerics` in a pre-pass over every namespace's
/// method sigs. Consumed by a bundle driver which routes each
/// per-namespace set into the corresponding `emitNamespaceEx` call
/// via the `extra_insts` parameter.
///
/// Motivation: the v0.1 emitter only registers closed generics whose
/// open def lives in the currently-emitting namespace. A method sig
/// like `Calendar.Languages → IVectorView\`1<HSTRING>` references an
/// open def (`IVectorView\`1`) that lives in a *different* namespace
/// (`Windows.Foundation.Collections`). Without routing, that instantiation
/// never gets emitted anywhere, and `writeZigTy` falls back to
/// `*anyopaque`. Phase 4b closes this loop: each source namespace's
/// sigs are pre-scanned for cross-namespace closed generics, and each
/// discovered key is routed to its home namespace for emission.
pub const PendingGenericMap = std.StringArrayHashMapUnmanaged(GenericInstSet);

/// Is `ns` a namespace we are willing to emit a cross-namespace
/// import alias for?  Today only `Windows.*` (and the bare root
/// `Windows`) qualify — `System.Guid`, `System.Object`, etc. are
/// either aliased to primitives by the emitter or fall through to
/// the opaque fallback, so qualifying them as `@"System".Guid` and
/// generating a dangling `@import("System.zig")` would just noise up
/// the output.
fn isProjectableNs(ns: []const u8) bool {
    return std.mem.eql(u8, ns, "Windows") or std.mem.startsWith(u8, ns, "Windows.");
}

/// Placeholder — full CLI lands later in Phase 3.
pub fn generate(_: std.mem.Allocator) !void {}

/// Compute the transitive closure of namespace dependencies starting
/// from `roots`. Scans metadata directly (TypeDef → method sigs,
/// interface impls, field types) for cross-namespace references
/// without running the full emitter. Returns a sorted, deduplicated
/// list of all namespaces needed — including the roots themselves.
pub fn collectNamespaceClosure(
    arena: std.mem.Allocator,
    file: *const winmd.File,
    roots: []const []const u8,
    arch: Arch,
) ![][]const u8 {
    _ = arch;
    var visited: std.StringHashMapUnmanaged(void) = .empty;
    var queue = try std.ArrayList([]const u8).initCapacity(arena, roots.len);
    for (roots) |r| {
        try queue.append(arena, r);
        try visited.put(arena, r, {});
    }

    var head: usize = 0;
    while (head < queue.items.len) {
        const ns = queue.items[head];
        head += 1;

        // Walk every TypeDef in this namespace and collect foreign
        // namespace refs from method sigs and interface impls.
        const rows = file.rowCount(.type_def);
        var row: u32 = 0;
        while (row < rows) : (row += 1) {
            if (!std.mem.eql(u8, file.str(.type_def, row, 2), ns)) continue;

            // Scan method signatures for foreign namespace refs.
            const methods = file.list(.type_def, row, 5, .method_def);
            var m = methods.start;
            while (m < methods.end) : (m += 1) {
                const sig_blob = file.blob(.method_def, m, 4);
                const sig = winmd.readMethodSignature(arena, file, sig_blob) catch continue;
                try collectNsDepsFromTy(&visited, &queue, arena, sig.return_type, ns);
                for (sig.params) |p| {
                    try collectNsDepsFromTy(&visited, &queue, arena, p, ns);
                }
            }

            // Scan InterfaceImpl rows for cross-ns base interfaces.
            const impls = file.equalRange(.interface_impl, 0, row + 1);
            var ii = impls.start;
            while (ii < impls.end) : (ii += 1) {
                const iface_tok = file.cell(.interface_impl, ii, 1);
                const iface_name = winmd.resolveTypeDefOrRefName(file, iface_tok) catch continue;
                if (iface_name.namespace.len > 0 and
                    isProjectableNs(iface_name.namespace) and
                    !std.mem.eql(u8, iface_name.namespace, ns) and
                    !visited.contains(iface_name.namespace))
                {
                    const dep = try arena.dupe(u8, iface_name.namespace);
                    try visited.put(arena, dep, {});
                    try queue.append(arena, dep);
                }
            }
        }
    }

    const result = try arena.dupe([]const u8, queue.items);
    std.mem.sort([]const u8, result, {}, struct {
        fn lt(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b);
        }
    }.lt);
    return result;
}

/// Recursively walk a `Ty` and add any foreign namespace to the BFS queue.
fn collectNsDepsFromTy(
    visited: *std.StringHashMapUnmanaged(void),
    queue: *std.ArrayList([]const u8),
    arena: std.mem.Allocator,
    ty: winmd.Ty,
    home_ns: []const u8,
) !void {
    switch (ty) {
        .class_name, .value_name => |tn| {
            if (tn.namespace.len > 0 and
                isProjectableNs(tn.namespace) and
                !std.mem.eql(u8, tn.namespace, home_ns) and
                !visited.contains(tn.namespace))
            {
                const dep = try arena.dupe(u8, tn.namespace);
                try visited.put(arena, dep, {});
                try queue.append(arena, dep);
            }
            for (tn.generics) |g| try collectNsDepsFromTy(visited, queue, arena, g, home_ns);
        },
        .ptr_mut => |p| try collectNsDepsFromTy(visited, queue, arena, p.inner.*, home_ns),
        .ptr_const => |p| try collectNsDepsFromTy(visited, queue, arena, p.inner.*, home_ns),
        .ref_mut => |inner| try collectNsDepsFromTy(visited, queue, arena, inner.*, home_ns),
        .ref_const => |inner| try collectNsDepsFromTy(visited, queue, arena, inner.*, home_ns),
        .array => |inner| try collectNsDepsFromTy(visited, queue, arena, inner.*, home_ns),
        .array_fixed => |a| try collectNsDepsFromTy(visited, queue, arena, a.inner.*, home_ns),
        else => {},
    }
}

/// Parsed seed for `--seed` CLI flag.
pub const ParsedSeed = struct {
    key: []const u8,
    tn: winmd.TypeName,
};

/// Parse a `--seed` argument: `<open_name>,<arg>,...`
/// where `open_name` includes backtick arity (e.g. `IVectorView`1`)
/// and each `arg` is a primitive name: `string`, `i32`, `object`, etc.
/// The namespace of the open def is provided by the caller (it's the
/// namespace being emitted). Returns the mangled key and TypeName.
pub fn parseSeed(arena: std.mem.Allocator, namespace: []const u8, seed_str: []const u8) !ParsedSeed {
    // Split on commas: first field is open_name, rest are arg types.
    var parts = std.mem.splitScalar(u8, seed_str, ',');
    const open_name = parts.first();
    if (open_name.len == 0) return error.EmptySeed;

    var args_list = try std.ArrayList(winmd.Ty).initCapacity(arena, 4);
    while (parts.next()) |arg_str| {
        const ty = parsePrimitiveTy(arg_str) orelse return error.UnknownArgType;
        try args_list.append(arena, ty);
    }
    if (args_list.items.len == 0) return error.NoArgs;

    const generics = try arena.dupe(winmd.Ty, args_list.items);
    const key = try mangleInstAlloc(arena, open_name, generics);

    return .{
        .key = key,
        .tn = .{
            .namespace = namespace,
            .name = try arena.dupe(u8, open_name),
            .generics = generics,
        },
    };
}

/// Map a CLI arg-type name to a winmd.Ty primitive.
fn parsePrimitiveTy(name: []const u8) ?winmd.Ty {
    const map = std.StaticStringMap(winmd.Ty).initComptime(.{
        .{ "bool", .bool },
        .{ "char", .char },
        .{ "i8", .i8 },
        .{ "u8", .u8 },
        .{ "i16", .i16 },
        .{ "u16", .u16 },
        .{ "i32", .i32 },
        .{ "u32", .u32 },
        .{ "i64", .i64 },
        .{ "u64", .u64 },
        .{ "f32", .f32 },
        .{ "f64", .f64 },
        .{ "isize", .isize },
        .{ "usize", .usize },
        .{ "string", .string },
        .{ "object", .object },
    });
    return map.get(name);
}

/// Architecture filter for SupportedArchitectureAttribute bitmasks.
/// Values match the ECMA attribute bit layout that `windows-bindgen`
/// uses in `crates/libs/bindgen/src/config/cfg.rs`.
pub const Arch = enum(i32) {
    x86 = 0x1,
    x64 = 0x2,
    arm64 = 0x4,
};

/// Return true if the TypeDef / MethodDef at `(tag, row)` has no
/// `SupportedArchitectureAttribute`, or has one whose bitmask includes
/// `arch`. The attribute lists every arch a declaration applies to;
/// declarations without it are arch-agnostic. This is the minimal arch
/// filter that lets us emit a single set of per-target bindings and
/// drop the off-target duplicates that would otherwise collide on the
/// same name (e.g. `SLIST_HEADER` is defined three times in
/// `Windows.Win32.System.Kernel`, one per arch).
///
/// The Rust `windows-bindgen` equivalent is
/// `crates/libs/bindgen/src/config/cfg.rs::write_arches`, which expands
/// to `#[cfg(target_arch = ...)]`. Zig does not have `cfg`, so the
/// caller picks one arch per generation run and any cross-arch
/// divergence is observed by running the generator with a different
/// `--arch` value.
fn supportsArch(file: *const winmd.File, tag: winmd.HasAttributeTag, row: u32, arch: Arch) bool {
    const attr_row = winmd.findAttribute(file, tag, row, "SupportedArchitectureAttribute") orelse return true;
    var fba_buf: [512]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&fba_buf);
    const args = winmd.readAttributeArgs(fba.allocator(), file, attr_row) catch return true;
    if (args.len == 0) return true;
    const mask: i32 = switch (args[0].value) {
        .i32_val => |x| x,
        .u32_val => |x| @bitCast(x),
        .enum_value => |e| e.value,
        else => return true,
    };
    return (mask & @intFromEnum(arch)) != 0;
}

/// Emit every supported declaration for `namespace` to `writer`,
/// preceded by a header that imports the win-core primitives
/// (`HRESULT`, `HSTRING`, `IInspectable_Vtbl`, ...) the generated
/// code depends on. The output is a self-contained Zig source file
/// modulo cross-namespace type references.
///
/// Order:
///   1. IID GUID constants (`emitIidConstants`)
///   2. Enum declarations (`emitEnums`)
///   3. Value-type structs (`emitStructs`)
///   4. Interface handle structs (`emitInterfaceHandles`)
///   5. Runtime-class handle structs (`emitRuntimeClasses`)
///   6. Interface vtable structs (`emitInterfaceVtbls`)
///
/// Handles are declared before vtbls so the typed `class_name` and
/// default-interface pointers inside each vtbl resolve against an
/// already-declared struct.
pub fn emitNamespace(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    arch: Arch,
) !void {
    return emitNamespaceEx(writer, arena, file, namespace, arch, null);
}

/// Extended `emitNamespace` that accepts optional external generic
/// instantiation seeds — used by bundle drivers to route cross-namespace
/// closed generics to their home namespace for emission.
///
/// `extra_insts`: if non-null, each entry is a `(mangled_name → TypeName)`
/// pair describing a closed generic instantiation whose open definition
/// lives in `namespace`. These are merged into the local instantiation
/// set before emission.
pub fn emitNamespaceEx(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    arch: Arch,
    extra_insts: ?*const GenericInstSet,
) !void {
    // Buffer the body into an arena-backed `Allocating` writer so the
    // cross-namespace alias list at the top is emitted *after* all
    // sub-emitters have had a chance to report their references via
    // the shared `cross` set. The arena already bounds the lifetime
    // of everything in this call, so no explicit `deinit`.
    var cross: CrossNsSet = .empty;
    var body: std.Io.Writer.Allocating = .init(arena);
    const body_writer = &body.writer;

    try emitIidConstants(body_writer, arena, file, namespace);
    try emitGuidConstants(body_writer, arena, file, namespace);
    try emitEnums(body_writer, arena, file, namespace);
    try emitStructsImpl(body_writer, arena, file, namespace, &cross, arch);
    try emitInterfaceHandles(body_writer, arena, file, namespace, &cross);
    try emitDelegates(body_writer, arena, file, namespace);
    try emitRuntimeClasses(body_writer, arena, file, namespace, &cross);
    try emitInterfaceVtblsImpl(body_writer, arena, file, namespace, &cross);
    try emitFreeFunctions(body_writer, arena, file, namespace, &cross, arch);
    try emitConstants(body_writer, arena, file, namespace);

    // M4 Phase 4b: collect closed-generic instantiations whose open
    // definitions live in THIS namespace. Scan every method sig in
    // the namespace for GENERICINST references.
    var insts: GenericInstSet = .empty;
    try collectGenericInstantiations(&insts, arena, file, namespace);

    // Merge externally-seeded instantiations (from cross-namespace
    // routing by a bundle driver).
    if (extra_insts) |ext| {
        for (ext.keys(), ext.values()) |k, v| {
            const key = try arena.dupe(u8, k);
            try insts.put(arena, key, v);
        }
    }

    // Emit closed-generic handle + vtbl structs (worklist-based).
    try emitGenericInstantiations(body_writer, arena, file, namespace, &cross, &insts);

    try writer.writeAll(
        \\// Generated by winbindgen — do not edit.
        \\const win_core = @import("win-core");
        \\
    );

    // Stable alphabetical order keeps the output diffable.
    const keys = cross.keys();
    const sorted = try arena.dupe([]const u8, keys);
    std.mem.sort([]const u8, sorted, {}, struct {
        fn lt(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b);
        }
    }.lt);
    for (sorted) |ns| {
        try writer.print("const @\"{s}\" = @import(\"{s}.zig\");\n", .{ ns, ns });
    }
    try writer.writeAll("\n");

    try writer.writeAll(
        \\pub const HRESULT = win_core.HRESULT;
        \\pub const HSTRING = win_core.HSTRING;
        \\pub const GUID = win_core.GUID;
        \\pub const BOOL = win_core.BOOL;
        \\pub const NTSTATUS = win_core.NTSTATUS;
        \\pub const BOOLEAN = win_core.BOOLEAN;
        \\pub const IInspectable_Vtbl = win_core.IInspectable_Vtbl;
        \\pub const IUnknown_Vtbl = win_core.IUnknown_Vtbl;
        \\pub const IUnknown = win_core.IUnknown;
        \\
        \\
    );

    try writer.writeAll(body.written());
}

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
        // Skip WinRT parameterized-generic typedefs (names like
        // `IAsyncOperation\`1`). `\`` is not a legal Zig identifier
        // character and instantiating generics is deferred to v0.2.
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;
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

/// Emit `pub const <NAME>: GUID = .{ ... };` for every static field on
/// the `Apis` pseudo-class in `namespace` that carries a
/// `GuidAttribute`. Win32 metadata stores CLSID/IID/GUID_* values this
/// way (they are *not* HasConstant records, so `emitConstants` skips
/// them). Fields without a `GuidAttribute` are silently skipped.
pub fn emitGuidConstants(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        if (!std.mem.eql(u8, file.str(.type_def, row, 1), "Apis")) continue;

        const fields = file.list(.type_def, row, 4, .field);
        var f: u32 = fields.start;
        while (f < fields.end) : (f += 1) {
            const attr_row = winmd.findAttribute(file, .field, f, "GuidAttribute") orelse continue;
            const args = winmd.readAttributeArgs(arena, file, attr_row) catch continue;
            if (args.len < 11) continue;

            var parts: [11]u64 = undefined;
            var ok = true;
            inline for (0..11) |i| {
                parts[i] = switch (args[i].value) {
                    .u32_val => |v| v,
                    .u16_val => |v| v,
                    .u8_val => |v| v,
                    else => blk: {
                        ok = false;
                        break :blk 0;
                    },
                };
            }
            if (!ok) continue;

            const name = file.str(.field, f, 1);
            try writer.print(
                \\pub const {s}: GUID = .{{
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
}

test "placeholder" {
    _ = winmd;
    try std.testing.expect(true);
}

/// Emit `pub extern "<dll>" fn Name(...) callconv(.winapi) Ret;`
/// declarations for every P/Invoke method inside the magic `Apis`
/// TypeDef of a Win32 namespace.
///
/// `Apis` is how MIDL surfaces free functions in .winmd: the module
/// holds one `Apis` class per namespace whose (static) methods are
/// the DLL exports. Each method row has a matching `ImplMap` row
/// pointing at a `ModuleRef` that names the owning DLL and the
/// (possibly renamed) import.
///
/// Methods whose signature contains a type the first-slice type
/// mapper can't render are silently skipped, matching the existing
/// struct / interface-handle fallback behavior. Methods whose
/// imported name differs from the MethodDef name (ordinal imports,
/// W/A suffixes added by the linker, etc.) are skipped for now —
/// they'll land once `@extern(.{ .name = ... })` support is wired
/// through the emitter.
pub fn emitFreeFunctions(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
    arch: Arch,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        if (!std.mem.eql(u8, file.str(.type_def, row, 1), "Apis")) continue;

        const methods = file.list(.type_def, row, 5, .method_def);
        var m: u32 = methods.start;
        while (m < methods.end) : (m += 1) {
            const impl_map_row = file.findImplMap(m) orelse continue;

            // Arch-gated duplicates are filtered at the MethodDef level;
            // functions carrying SupportedArchitectureAttribute without
            // the selected arch bit are skipped for the same reason
            // structs are — see `supportsArch` above.
            if (!supportsArch(file, .method_def, m, arch)) continue;

            const method_name = file.str(.method_def, m, 3);
            const import_name = file.implMapImportName(impl_map_row);

            const sig_blob = file.blob(.method_def, m, 4);
            const sig = winmd.readMethodSignature(arena, file, sig_blob) catch continue;
            if (!canRepresent(sig.return_type)) continue;
            var all_ok = true;
            for (sig.params) |p| {
                if (!canRepresent(p)) {
                    all_ok = false;
                    break;
                }
            }
            if (!all_ok) continue;

            const dll_full = file.implMapDll(impl_map_row);
            const dll_base = stripDllSuffix(dll_full);

            if (std.mem.eql(u8, method_name, import_name)) {
                try writer.print("pub extern \"{s}\" fn {s}", .{ dll_base, method_name });
                try writeFnSig(writer, arena, sig, namespace, cross, true);
                try writer.writeAll(";\n");
            } else {
                // Renamed / ordinal-only import: metadata's
                // MethodDef.Name is the Zig-facing identifier,
                // while ImplMap.ImportName is the real symbol or
                // "#<ordinal>". Use `@extern` so the two can differ.
                try writer.print("pub const {s}: *const fn ", .{method_name});
                try writeFnSig(writer, arena, sig, namespace, cross, false);
                try writer.writeAll(" = @extern(*const fn ");
                try writeFnSig(writer, arena, sig, namespace, cross, false);
                try writer.print(", .{{ .name = \"{s}\", .library_name = \"{s}\" }});\n", .{ import_name, dll_base });
            }
        }
    }
}

/// Write `(p0: T0, p1: T1, ...) callconv(.winapi) R` for a method
/// signature. When `with_names` is false, parameter names are omitted
/// so the text can stand in as a function *type* (used by `@extern`).
fn writeFnSig(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    sig: winmd.MethodSignature,
    namespace: []const u8,
    cross: *CrossNsSet,
    with_names: bool,
) !void {
    try writer.writeAll("(");
    for (sig.params, 0..) |p, i| {
        if (i != 0) try writer.writeAll(", ");
        if (with_names) try writer.print("p{d}: ", .{i});
        try writeParam(writer, arena, p, namespace, cross);
    }
    try writer.writeAll(") callconv(.winapi) ");
    if (sig.return_type == .void) {
        try writer.writeAll("void");
    } else {
        _ = try writeZigTy(writer, arena, sig.return_type, namespace, cross, null, null, null);
    }
}

/// Strip a trailing ".dll" (case-insensitive) from `name`. Zig's
/// `extern "<lib>"` string is matched against the import library's
/// basename without extension, so "KERNEL32.dll" must surface as
/// "KERNEL32".
fn stripDllSuffix(name: []const u8) []const u8 {
    if (name.len < 4) return name;
    const tail = name[name.len - 4 ..];
    if (std.ascii.eqlIgnoreCase(tail, ".dll")) return name[0 .. name.len - 4];
    return name;
}

/// One imported DLL plus the set of symbols imported from it.
/// `dll` is the full DLL filename as stored in metadata (e.g.
/// "KERNEL32.dll"); `imports` is a deduplicated, sorted list of the
/// import names (plain symbol names or `#<ordinal>` strings).
pub const DllImports = struct {
    dll: []const u8,
    imports: [][]const u8,
};

/// Scan every `MethodDef` across the whole winmd and group the
/// `ImplMap` → `ModuleRef` pairs by DLL. Used by Phase 5 to emit
/// per-DLL `.def` files that feed Zig 0.16's native `.def → import
/// lib` pipeline, replacing the per-triple `.lib` blobs that
/// `windows-rs` ships under `crates/targets`.
///
/// The result is sorted: outer slice by DLL basename (case-
/// insensitive), inner slice by import name (case-sensitive).
/// Duplicates (overloads sharing a symbol, or the same symbol reached
/// through multiple TypeDefs) are collapsed.
pub fn collectImports(
    arena: std.mem.Allocator,
    file: *const winmd.File,
) ![]DllImports {
    // Bucket: DLL name → set of import names. Both keys point into
    // the mmapped `#Strings` blob; no copying needed.
    var buckets = std.StringArrayHashMapUnmanaged(std.StringArrayHashMapUnmanaged(void)){};

    const method_rows = file.rowCount(.method_def);
    var m: u32 = 0;
    while (m < method_rows) : (m += 1) {
        const impl_map_row = file.findImplMap(m) orelse continue;
        const dll = file.implMapDll(impl_map_row);
        if (dll.len == 0) continue;
        const name = file.implMapImportName(impl_map_row);
        if (name.len == 0) continue;

        const gop = try buckets.getOrPut(arena, dll);
        if (!gop.found_existing) gop.value_ptr.* = .{};
        _ = try gop.value_ptr.getOrPut(arena, name);
    }

    const out = try arena.alloc(DllImports, buckets.count());
    var it = buckets.iterator();
    var i: usize = 0;
    while (it.next()) |entry| : (i += 1) {
        const names = try arena.alloc([]const u8, entry.value_ptr.count());
        const keys = entry.value_ptr.keys();
        for (keys, 0..) |k, j| names[j] = k;
        std.mem.sort([]const u8, names, {}, struct {
            fn lt(_: void, a: []const u8, b: []const u8) bool {
                return std.mem.lessThan(u8, a, b);
            }
        }.lt);
        out[i] = .{ .dll = entry.key_ptr.*, .imports = names };
    }
    std.mem.sort(DllImports, out, {}, struct {
        fn lt(_: void, a: DllImports, b: DllImports) bool {
            return std.ascii.lessThanIgnoreCase(a.dll, b.dll);
        }
    }.lt);
    return out;
}

/// Write a Microsoft module-definition (`.def`) file for a single
/// DLL's imports. The output is the canonical form consumed by
/// `zig dlltool` / Zig 0.16's native `.def → import lib` step:
///
/// ```
/// LIBRARY kernel32.dll
/// EXPORTS
/// CloseHandle
/// CreateFileW
/// ...
/// ```
///
/// Ordinal-only imports stored as `#<ordinal>` in metadata round-trip
/// verbatim as `EXPORTS` entries — dlltool accepts the `@<ordinal>`
/// form, so we rewrite `#N` to `@N` on the way out.
pub fn emitDef(writer: *std.Io.Writer, d: DllImports) !void {
    try writer.print("LIBRARY {s}\nEXPORTS\n", .{d.dll});
    for (d.imports) |name| {
        if (name.len > 0 and name[0] == '#') {
            try writer.print("    @{s}\n", .{name[1..]});
        } else {
            try writer.print("    {s}\n", .{name});
        }
    }
}

/// Emit a comptime-ready `StaticStringMap(u32)` that maps every free
/// function name in `namespace` to its `MethodDef` row number.
///
/// Phase 4's comptime `project()` helper needs O(1) name → row lookups
/// so it can materialize `extern fn`s without scanning the full
/// `MethodDef` table inside the comptime VM. The 23 MB
/// `Windows.Win32.winmd` has hundreds of thousands of MethodDef rows,
/// and a naive linear comptime scan over it does not finish in
/// reasonable time. By pre-computing this index at `zig build
/// bindings` time and committing it to the tree, `project()` can
/// `@import` it and look up rows in constant time.
///
/// The emitted fragment is intentionally a standalone `pub const` so
/// it can be written verbatim into a per-namespace `.zig` file or
/// combined with other emitters in the same output. Arch-gated and
/// DLL-less methods are filtered the same way `emitFreeFunctions`
/// filters them — the index only surfaces functions whose Zig
/// declaration `project()` would actually be able to materialize.
pub fn emitMethodIndex(
    writer: *std.Io.Writer,
    gpa: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    arch: Arch,
) !void {
    // Emits a StaticStringMap keyed by MethodDef name with a rich
    // record value: library, import name, and the raw MethodDef
    // signature blob (as a byte-escaped string literal), plus a
    // sidecar `resolveTypeRef` function that maps the coded-index
    // values found inside those signatures to `{namespace, name}`
    // pairs. This is the Phase 4 option-(c) shape — `project()`
    // reads everything it needs from this table and never touches
    // the winmd at comptime (see checkpoint 059 for why
    // parse-at-comptime isn't viable on 23 MB).
    try writer.writeAll(
        \\pub const MethodRecord = struct {
        \\    library: []const u8,
        \\    import: []const u8,
        \\    signature: []const u8,
        \\};
        \\
        \\pub const TypeRefEntry = struct {
        \\    namespace: []const u8,
        \\    name: []const u8,
        \\};
        \\
        \\pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{
        \\
    );

    // First pass: emit method records and collect every coded-index
    // value that appears in a VALUETYPE/CLASS position inside any
    // signature. The set is used in the second pass to build the
    // `resolveTypeRef` lookup.
    var coded_indices: std.AutoArrayHashMapUnmanaged(u32, void) = .empty;
    defer coded_indices.deinit(gpa);

    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        if (!std.mem.eql(u8, file.str(.type_def, row, 1), "Apis")) continue;

        const methods = file.list(.type_def, row, 5, .method_def);
        var m: u32 = methods.start;
        while (m < methods.end) : (m += 1) {
            const impl_map_row = file.findImplMap(m) orelse continue;
            if (!supportsArch(file, .method_def, m, arch)) continue;
            const method_name = file.str(.method_def, m, 3);
            const import_name = file.implMapImportName(impl_map_row);
            const dll_full = file.implMapDll(impl_map_row);
            const dll_base = stripDllSuffix(dll_full);
            const sig_blob = file.blob(.method_def, m, 4);

            try collectSignatureCodedIndices(gpa, &coded_indices, sig_blob);

            try writer.print(
                "    .{{ \"{s}\", MethodRecord{{ .library = \"{s}\", .import = \"{s}\", .signature = \"",
                .{ method_name, dll_base, import_name },
            );
            try writeZigByteString(writer, sig_blob);
            try writer.writeAll("\" } },\n");
        }
    }
    try writer.writeAll("});\n\n");

    // Second pass: emit `resolveTypeRef(coded: u32) ?TypeRefEntry`
    // as a switch over the collected coded indices. Using a switch
    // (rather than a StaticStringMap keyed by a u32 stringification)
    // keeps the comptime lookup truly O(1) and avoids any
    // allocations inside the comptime VM.
    try writer.writeAll(
        \\pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
        \\    return switch (coded) {
        \\
    );

    // Sort for deterministic output — AutoArrayHashMap insertion
    // order depends on the iteration order of winmd rows which is
    // stable, but explicit sort makes diffs obvious when metadata
    // adds new TypeRefs.
    const sorted = try gpa.alloc(u32, coded_indices.count());
    defer gpa.free(sorted);
    for (coded_indices.keys(), 0..) |k, i| sorted[i] = k;
    std.mem.sort(u32, sorted, {}, std.sort.asc(u32));

    for (sorted) |coded| {
        const resolved = winmd.resolveTypeDefOrRefName(file, coded) catch continue;
        try writer.print(
            "        0x{x} => TypeRefEntry{{ .namespace = \"{s}\", .name = \"{s}\" }},\n",
            .{ coded, resolved.namespace, resolved.name },
        );
    }

    try writer.writeAll(
        \\        else => null,
        \\    };
        \\}
        \\
    );

    // Third pass: emit primitive integer LITERAL constants as
    // untyped `pub const NAME = VALUE;` declarations. Without a type
    // annotation these are `comptime_int` and coerce implicitly to
    // whatever integer type a callee expects — so samples can write
    // `win.CreateFileW(path, idx.GENERIC_WRITE, ...)` without casts.
    //
    // Only ET_I1..ET_U8 primitive literals are emitted here; typed
    // constants (HRESULTs, wrapped enums, strings) stay out of the
    // index and live in the full namespace module. That keeps the
    // index file self-contained (no cross-namespace imports needed).
    const FIELD_ATTR_STATIC: u32 = 0x10;
    const FIELD_ATTR_LITERAL: u32 = 0x40;

    try writer.writeAll("\n");
    // Track emitted constant names to avoid duplicate-symbol errors
    // when an enum member shadows another (e.g. two flag enums both
    // defining `NONE = 0`). First-wins — the winmd row order is
    // stable so this is deterministic across runs.
    var seen: std.StringHashMapUnmanaged(void) = .empty;
    defer seen.deinit(gpa);

    row = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        // Two flavors of flat integer constants surface here:
        //  (a) `Apis` static-literal fields — free-standing consts.
        //  (b) `System.Enum` / `System.ValueType`-extending TypeDefs —
        //      each static-literal field is also emitted flat, so
        //      samples can write `idx.GENERIC_WRITE` without needing
        //      the wrapping type imported. Win32 uses these as C
        //      macros anyway (`#define GENERIC_WRITE 0x40000000`),
        //      not as strongly typed enum members.
        const is_apis = std.mem.eql(u8, file.str(.type_def, row, 1), "Apis");
        if (!is_apis) {
            const extends_tok = file.cell(.type_def, row, 3);
            if (extends_tok == 0) continue;
            const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
            if (!std.mem.eql(u8, base.namespace, "System")) continue;
            if (!std.mem.eql(u8, base.name, "Enum") and !std.mem.eql(u8, base.name, "ValueType")) continue;
        }

        const fields = file.list(.type_def, row, 4, .field);
        var f: u32 = fields.start;
        while (f < fields.end) : (f += 1) {
            const attr = file.cell(.field, f, 0);
            if ((attr & FIELD_ATTR_STATIC) == 0) continue;
            if ((attr & FIELD_ATTR_LITERAL) == 0) continue;

            // Use the Constant table's Type column — not the field
            // signature — to decide whether to emit. Win32 "typed
            // constant" fields have signatures like
            // `ValueType FILE_CREATION_DISPOSITION`, but their
            // Constant row stores a primitive value (U4 = 2 for
            // CREATE_ALWAYS). Filtering on the signature would
            // miss them.
            const parent_tok = (@as(u32, f + 1) << 2) | 0; // HasConstant tag 0 = Field
            const range = file.equalRange(.constant, 1, parent_tok);
            if (range.start == range.end) continue;

            const type_code: u8 = @intCast(file.cell(.constant, range.start, 0) & 0xFF);
            // ECMA-335 §23.1.16 ElementType primitives we accept.
            const is_primitive_int = switch (type_code) {
                0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b => true,
                else => false,
            };
            if (!is_primitive_int) continue;

            const value_blob = file.blob(.constant, range.start, 2);
            const raw = readConstantValue(type_code, value_blob) orelse continue;
            const name = file.str(.field, f, 1);
            const gop = try seen.getOrPut(gpa, name);
            if (gop.found_existing) continue;

            // Sign-extend for the signed primitive widths so the
            // emitted literal matches what C headers and Rust bindings
            // produce for, e.g., `STATUS_*` NTSTATUS constants.
            const is_signed = switch (type_code) {
                0x04, 0x06, 0x08, 0x0a => true,
                else => false,
            };
            if (is_signed) {
                const signed: i64 = switch (type_code) {
                    0x04 => @as(i64, @as(i8, @bitCast(@as(u8, @truncate(raw))))),
                    0x06 => @as(i64, @as(i16, @bitCast(@as(u16, @truncate(raw))))),
                    0x08 => @as(i64, @as(i32, @bitCast(@as(u32, @truncate(raw))))),
                    0x0a => @bitCast(raw),
                    else => unreachable,
                };
                try writer.print("pub const {s} = {d};\n", .{ name, signed });
            } else {
                try writer.print("pub const {s} = {d};\n", .{ name, raw });
            }
        }
    }

    // Fourth pass: emit `pub const aliases = struct { ... };` —
    // a per-namespace lookup from TypeRef name to the Zig type that
    // backs it. Lets `project()` auto-project TypeRefs like `BOOL`,
    // `HRESULT`, `WIN32_ERROR`, `HANDLE`, etc. without a
    // hand-maintained switch in `project.zig`.
    //
    // Two shapes are surfaced here:
    //  1. `System.Enum`-extending TypeDefs → emit `NAME = <repr>;`
    //     where `<repr>` is the underlying integer type.
    //  2. `NativeTypedefAttribute`-decorated TypeDefs (exactly one
    //     field) → emit `NAME = <zig-of-field-type>;` for the cases
    //     we know how to project (primitives, pointer-to-char for
    //     strings, pointer-to-void for opaque pointers, and function
    //     pointers as `?*const anyopaque`).
    var any_alias = false;
    row = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System")) continue;
        if (!std.mem.eql(u8, base.name, "Enum")) continue;

        const repr = enumUnderlyingReprForRow(file, gpa, row) orelse continue;
        const type_name = file.str(.type_def, row, 1);
        if (!any_alias) {
            try writer.writeAll("\npub const aliases = struct {\n");
            any_alias = true;
        }
        try writer.print("    pub const {s} = {s};\n", .{ type_name, repr });
    }

    // Fifth pass (folded into the same `aliases` block): surface
    // every single-field struct whose sole field projects to a
    // concrete Zig type — these are the "Win32 typedef wrappers"
    // (HANDLE, BOOL, HRESULT, PWSTR, PSID, ...). We accept them on
    // one of two signals, matching `windows-bindgen`'s two paths:
    //   (a) `NativeTypedefAttribute` is present, OR
    //   (b) the struct has exactly one field named "Value" whose
    //       type is a primitive (the handle convention).
    // Case (b) is how all `H*` handles land — they lack the
    // attribute in the current winmd but are projected by Rust
    // bindgen as typedef aliases via the "Value" heuristic.
    // Unsupported field shapes are silently skipped and continue
    // to rely on `fnTypeForAlias`'s hand-list.
    row = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        // NativeTypedefAttribute wrappers are single-field structs;
        // if the shape differs (defensive — no known exception in
        // the current winmds), leave it to the hand-list.
        const fields = file.list(.type_def, row, 4, .field);
        if (fields.len() != 1) continue;

        const has_attr = winmd.hasAttribute(file, .type_def, row, "NativeTypedefAttribute");
        const has_value_field = std.mem.eql(u8, file.str(.field, fields.start, 1), "Value");
        if (!has_attr and !has_value_field) continue;

        const sig = file.blob(.field, fields.start, 2);
        const ty = winmd.readFieldSignature(gpa, file, sig) catch continue;
        const zig = nativeTypedefZigType(ty) orelse continue;
        const type_name = file.str(.type_def, row, 1);
        if (!any_alias) {
            try writer.writeAll("\npub const aliases = struct {\n");
            any_alias = true;
        }
        try writer.print("    pub const {s} = {s};\n", .{ type_name, zig });
    }
    // Sixth pass: surface delegate TypeDefs (extends
    // `System.MulticastDelegate`) as function-pointer typedef
    // aliases. In win32metadata these carry 0 fields + 2 methods
    // (`.ctor`, `Invoke`), so the single-field path above skips
    // them. Like struct-wrapped fn-ptr typedefs, we project them
    // as opaque `?*const anyopaque` — the concrete callee signature
    // is reconstructed at the call site via `@ptrCast`, matching
    // how `windows-sys` surfaces callbacks.
    //
    // Some delegates are declared multiple times in the same
    // namespace (once per `[SupportedArchitecture]` variant);
    // dedupe by name so the `aliases` struct has no duplicate
    // members.
    var seen_delegates: std.StringHashMap(void) = .init(gpa);
    defer seen_delegates.deinit();
    row = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System")) continue;
        if (!std.mem.eql(u8, base.name, "MulticastDelegate")) continue;

        const type_name = file.str(.type_def, row, 1);
        const gop = seen_delegates.getOrPut(type_name) catch continue;
        if (gop.found_existing) continue;

        if (!any_alias) {
            try writer.writeAll("\npub const aliases = struct {\n");
            any_alias = true;
        }
        try writer.print("    pub const {s} = ?*const anyopaque;\n", .{type_name});
    }
    if (any_alias) try writer.writeAll("};\n");
}

/// Map the sole field of a `NativeTypedefAttribute`-decorated struct
/// to a Zig type string. Returns null for shapes we don't yet
/// project — the generator's caller falls back to `fnTypeForAlias`'s
/// hand-list for those.
fn nativeTypedefZigType(ty: winmd.Ty) ?[]const u8 {
    return switch (ty) {
        .i8 => "i8",
        .u8 => "u8",
        .i16 => "i16",
        .u16 => "u16",
        .i32 => "i32",
        .u32 => "u32",
        .i64 => "i64",
        .u64 => "u64",
        .isize => "isize",
        .usize => "usize",
        // Pointer-to-char: project as a null-terminated many-item
        // pointer matching the Win32 convention. `ptr_const` and
        // `ptr_mut` both land here — winmd distinguishes them but
        // the generated Zig alias is identical (the const-ness at
        // the API boundary is re-expressed via `[*:0]`-shape on
        // the parameter, not the alias itself).
        .ptr_mut => |p| if (p.depth == 1) switch (p.inner.*) {
            .u8 => "?[*:0]u8",
            .u16, .char => "?[*:0]u16",
            .void => "?*anyopaque",
            else => null,
        } else null,
        .ptr_const => |p| if (p.depth == 1) switch (p.inner.*) {
            .u8 => "?[*:0]u8",
            .u16, .char => "?[*:0]u16",
            .void => "?*anyopaque",
            else => null,
        } else null,
        // Function-pointer typedef (e.g. `LPOVERLAPPED_COMPLETION_ROUTINE`).
        // The exact callee signature is not preserved: callers either
        // pass null or `@ptrCast` a concrete fn pointer at the call
        // site. This mirrors how `windows-sys` surfaces callbacks.
        .fn_ptr => "?*const anyopaque",
        else => null,
    };
}

/// Walk a MethodDef signature blob and record every TypeDefOrRef
/// coded-index value that appears in a VALUETYPE or CLASS position.
/// This is a minimal byte-level scan — it doesn't need to faithfully
/// reconstruct the type graph, only to enumerate reachable
/// TypeRefs. Unknown/unsupported element codes cause an early
/// return (the rest of the blob may be malformed or use features
/// we don't yet understand).
fn collectSignatureCodedIndices(
    gpa: std.mem.Allocator,
    out: *std.AutoArrayHashMapUnmanaged(u32, void),
    blob: []const u8,
) !void {
    if (blob.len < 2) return;
    var pos: usize = 0;
    const flags = blob[pos];
    pos += 1;
    if (flags & 0x10 != 0) {
        // GENERIC — has a generic param count prefix (§II.23.2.1).
        _ = readCompressedAt(blob, &pos) catch return;
    }
    const param_count = readCompressedAt(blob, &pos) catch return;

    // Return type + params.
    var remaining: u32 = param_count + 1;
    while (remaining > 0) : (remaining -= 1) {
        collectOneType(gpa, out, blob, &pos) catch return;
    }
}

fn collectOneType(
    gpa: std.mem.Allocator,
    out: *std.AutoArrayHashMapUnmanaged(u32, void),
    blob: []const u8,
    pos: *usize,
) !void {
    while (pos.* < blob.len) {
        const code = blob[pos.*];
        pos.* += 1;
        switch (code) {
            // ELEMENT_TYPE_VOID, BOOLEAN, CHAR, I1..U, STRING, OBJECT
            0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x18, 0x19, 0x1c => return,
            0x0f, 0x10 => continue, // ELEMENT_TYPE_PTR / BYREF — recurse into inner
            0x1d => continue, // ELEMENT_TYPE_SZARRAY
            0x11, 0x12 => { // VALUETYPE / CLASS
                const ci = try readCompressedAt(blob, pos);
                try out.put(gpa, ci, {});
                return;
            },
            else => return, // modifiers, generics, arrays, sentinel — bail
        }
    }
}

fn readCompressedAt(bytes: []const u8, pos: *usize) !u32 {
    if (pos.* >= bytes.len) return error.ShortBlob;
    const b0 = bytes[pos.*];
    pos.* += 1;
    if (b0 & 0x80 == 0) return b0;
    if (pos.* >= bytes.len) return error.ShortBlob;
    const b1 = bytes[pos.*];
    pos.* += 1;
    if (b0 & 0xc0 == 0x80) {
        return (@as(u32, b0 & 0x3f) << 8) | b1;
    }
    if (pos.* + 1 >= bytes.len) return error.ShortBlob;
    const b2 = bytes[pos.*];
    pos.* += 1;
    const b3 = bytes[pos.*];
    pos.* += 1;
    return (@as(u32, b0 & 0x1f) << 24) | (@as(u32, b1) << 16) | (@as(u32, b2) << 8) | b3;
}

/// Escape a binary blob as a Zig string literal (`\xNN` per byte).
/// Used by `emitMethodIndex` to inline MethodDef signature blobs
/// into the generated index verbatim.
fn writeZigByteString(writer: *std.Io.Writer, bytes: []const u8) !void {
    for (bytes) |b| {
        try writer.print("\\x{x:0>2}", .{b});
    }
}

/// Return true if `(namespace, name)` is already surfaced by the
/// `emitNamespace` prelude as an alias into `win-core`. Such types
/// must not be re-emitted from metadata or Zig would see two
/// top-level decls with the same name.
fn isPreludeAlias(namespace: []const u8, name: []const u8) bool {
    if (std.mem.eql(u8, namespace, "Windows.Win32.Foundation")) {
        if (std.mem.eql(u8, name, "HRESULT")) return true;
        if (std.mem.eql(u8, name, "BOOL")) return true;
        if (std.mem.eql(u8, name, "NTSTATUS")) return true;
        if (std.mem.eql(u8, name, "BOOLEAN")) return true;
    }
    if (std.mem.eql(u8, namespace, "Windows.Win32.System.Com")) {
        if (std.mem.eql(u8, name, "IUnknown")) return true;
    }
    if (std.mem.eql(u8, namespace, "Windows.Win32.System.WinRT")) {
        if (std.mem.eql(u8, name, "HSTRING")) return true;
    }
    return false;
}

/// Emit `pub const NAME: T = VAL;` declarations for every Win32
/// primitive-integer constant in `namespace`. Constants live as
/// static+literal fields of the magic `Apis` TypeDef, with their
/// value in the `Constant` metadata table.
///
/// Only primitive integer / bool / char fields are emitted. Fields
/// whose type is a named typedef (HANDLE, HRESULT, NTSTATUS, GUID…),
/// a string, or a float are skipped — they'll come once the relevant
/// type alias / literal encoders exist.
pub fn emitConstants(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    // FieldAttributes — ECMA-335 §II.23.1.5.
    const FIELD_ATTR_STATIC: u32 = 0x10;
    const FIELD_ATTR_LITERAL: u32 = 0x40;

    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        if (!std.mem.eql(u8, file.str(.type_def, row, 1), "Apis")) continue;

        const fields = file.list(.type_def, row, 4, .field);
        var f: u32 = fields.start;
        while (f < fields.end) : (f += 1) {
            const attr = file.cell(.field, f, 0);
            if ((attr & FIELD_ATTR_STATIC) == 0) continue;
            if ((attr & FIELD_ATTR_LITERAL) == 0) continue;

            const ty = winmd.readFieldSignature(arena, file, file.blob(.field, f, 2)) catch continue;

            // HasConstant coded index: tag 0 = Field, row is 1-based.
            const parent_tok = (@as(u32, f + 1) << 2) | 0;
            const range = file.equalRange(.constant, 1, parent_tok);
            if (range.start == range.end) continue;

            const value_blob = file.blob(.constant, range.start, 2);
            const name = file.str(.field, f, 1);

            switch (ty) {
                .i8, .u8, .i16, .u16, .i32, .u32, .i64, .u64 => {
                    const repr = zigReprFor(ty).?;
                    const type_code: u8 = @intCast(file.cell(.constant, range.start, 0) & 0xFF);
                    const raw = readConstantValue(type_code, value_blob) orelse continue;
                    if (isSignedRepr(ty)) {
                        // Sign-extend from the original width so the printed
                        // decimal matches the intent of the metadata value
                        // (e.g. `-1` not `0xFFFFFFFF`).
                        const signed: i64 = switch (ty) {
                            .i8 => @as(i64, @as(i8, @bitCast(@as(u8, @truncate(raw))))),
                            .i16 => @as(i64, @as(i16, @bitCast(@as(u16, @truncate(raw))))),
                            .i32 => @as(i64, @as(i32, @bitCast(@as(u32, @truncate(raw))))),
                            .i64 => @bitCast(raw),
                            else => @bitCast(raw),
                        };
                        try writer.print("pub const {s}: {s} = {d};\n", .{ name, repr, signed });
                    } else {
                        try writer.print("pub const {s}: {s} = {d};\n", .{ name, repr, raw });
                    }
                },
                .f32 => {
                    if (value_blob.len < 4) continue;
                    const bits = std.mem.readInt(u32, value_blob[0..4], .little);
                    const val: f32 = @bitCast(bits);
                    try writer.print("pub const {s}: f32 = {d};\n", .{ name, val });
                },
                .f64 => {
                    if (value_blob.len < 8) continue;
                    const bits = std.mem.readInt(u64, value_blob[0..8], .little);
                    const val: f64 = @bitCast(bits);
                    try writer.print("pub const {s}: f64 = {d};\n", .{ name, val });
                },
                .string => {
                    // ECMA-335 §II.23.3: ET_STRING Constant.Value is raw
                    // UTF-16LE code units (no length prefix beyond the blob
                    // itself, no terminator). Decode to UTF-8, escape for
                    // a Zig string literal, and emit via the
                    // `win_core.utf16Lit` comptime helper so the result is
                    // a sentinel-terminated `[:0]const u16` — the same
                    // shape `PCWSTR` expects to point at.
                    if (value_blob.len % 2 != 0) continue;
                    const units_n = value_blob.len / 2;
                    const units = try arena.alloc(u16, units_n);
                    for (0..units_n) |i| {
                        units[i] = std.mem.readInt(u16, value_blob[i * 2 ..][0..2], .little);
                    }
                    const utf8 = std.unicode.utf16LeToUtf8Alloc(arena, units) catch continue;
                    try writer.print("pub const {s}: [:0]const u16 = win_core.utf16Lit(\"", .{name});
                    try writeEscapedZigStringLit(writer, utf8);
                    try writer.writeAll("\");\n");
                },
                .value_name => |tn| {
                    // Typed integer constants like `S_OK: HRESULT = 0` or
                    // `STATUS_SUCCESS: NTSTATUS = 0`. We only handle the
                    // four single-field Win32 typedefs that the prelude
                    // aliases into `win-core` primitive ints. For those,
                    // direct integer-literal assignment compiles because
                    // the prelude name resolves to a type alias (not a
                    // wrapper struct). Other typedef-wrapped constants
                    // need generalized single-field resolution + possibly
                    // cross-namespace qualification; deferred to a later
                    // slice.
                    if (!std.mem.eql(u8, tn.namespace, "Windows.Win32.Foundation")) continue;
                    const is_i32_alias = std.mem.eql(u8, tn.name, "HRESULT") or
                        std.mem.eql(u8, tn.name, "BOOL") or
                        std.mem.eql(u8, tn.name, "NTSTATUS");
                    const is_u8_alias = std.mem.eql(u8, tn.name, "BOOLEAN");
                    if (!is_i32_alias and !is_u8_alias) continue;

                    const type_code: u8 = @intCast(file.cell(.constant, range.start, 0) & 0xFF);
                    const raw = readConstantValue(type_code, value_blob) orelse continue;
                    if (is_i32_alias) {
                        // Sign-extend from i32 so negative HRESULTs like
                        // `E_FAIL = 0x80004005` print as `-2147467259`.
                        const signed: i64 = @as(i64, @as(i32, @bitCast(@as(u32, @truncate(raw)))));
                        try writer.print("pub const {s}: {s} = {d};\n", .{ name, tn.name, signed });
                    } else {
                        try writer.print("pub const {s}: {s} = {d};\n", .{ name, tn.name, @as(u8, @truncate(raw)) });
                    }
                },
                else => continue,
            }
        }
    }
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
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;
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
            const vname_fmt: []const u8 = if (isZigReservedIdent(variant_name))
                try std.fmt.allocPrint(arena, "@\"{s}\"", .{variant_name})
            else
                variant_name;
            // Print as signed when underlying type is signed, unsigned
            // otherwise; match the declared enum tag type.
            if (isSignedRepr(repr_ty)) {
                const signed: i64 = @bitCast(raw);
                try writer.print("    {s} = {d},\n", .{ vname_fmt, signed });
            } else {
                try writer.print("    {s} = {d},\n", .{ vname_fmt, raw });
            }
        }

        try writer.writeAll("    _,\n};\n");
    }
}

/// Resolve the underlying Zig integer repr (e.g. `"u32"`) for an
/// enum TypeDef row. Returns null if the row isn't an enum or the
/// repr isn't an integer we project. Mirrors the lookup
/// `emitEnums` uses on the `value__` field.
fn enumUnderlyingReprForRow(
    file: *const winmd.File,
    arena: std.mem.Allocator,
    row: u32,
) ?[]const u8 {
    const fields = file.list(.type_def, row, 4, .field);
    if (fields.start == fields.end) return null;
    var repr_field: u32 = fields.start;
    const first_name = file.str(.field, fields.start, 1);
    if (!std.mem.eql(u8, first_name, "value__")) {
        var f: u32 = fields.start;
        while (f < fields.end) : (f += 1) {
            if (std.mem.eql(u8, file.str(.field, f, 1), "value__")) {
                repr_field = f;
                break;
            }
        } else return null;
    }
    const repr_ty = winmd.readFieldSignature(arena, file, file.blob(.field, repr_field, 2)) catch return null;
    return zigReprFor(repr_ty);
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

/// True if `name` collides with a Zig keyword or primitive type name and
/// therefore must be quoted as `@"name"` when used as a field, parameter,
/// or decl name. Keep in sync with the lexer's keyword list; omitting an
/// entry here produces "expected type expression, found '<kw>'" errors.
fn isZigReservedIdent(name: []const u8) bool {
    const reserved = [_][]const u8{
        "addrspace",      "align",       "allowzero", "and",      "anyframe",
        "anytype",        "asm",         "async",     "await",    "break",
        "callconv",       "catch",       "comptime",  "const",    "continue",
        "defer",          "else",        "enum",      "errdefer", "error",
        "export",         "extern",      "fn",        "for",      "if",
        "inline",         "linksection", "noalias",   "noinline", "nosuspend",
        "opaque",         "or",          "orelse",    "packed",   "pub",
        "resume",         "return",      "struct",    "suspend",  "switch",
        "test",           "threadlocal", "try",       "union",    "unreachable",
        "usingnamespace", "var",         "volatile",  "while",
    };
    for (reserved) |kw| {
        if (std.mem.eql(u8, name, kw)) return true;
    }
    return false;
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

/// Escape `s` so it can be the body of a Zig double-quoted string
/// literal. Assumes valid UTF-8; non-ASCII bytes pass through verbatim
/// (Zig string literals are UTF-8). Control chars outside the common
/// named escapes fall back to `\xNN`.
fn writeEscapedZigStringLit(writer: *std.Io.Writer, s: []const u8) !void {
    for (s) |c| {
        switch (c) {
            '\\' => try writer.writeAll("\\\\"),
            '"' => try writer.writeAll("\\\""),
            '\n' => try writer.writeAll("\\n"),
            '\r' => try writer.writeAll("\\r"),
            '\t' => try writer.writeAll("\\t"),
            0x00...0x08, 0x0B, 0x0C, 0x0E...0x1F, 0x7F => try writer.print("\\x{x:0>2}", .{c}),
            else => try writer.writeByte(c),
        }
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
/// Emit an `extern struct` for every non-generic interface in
/// `namespace` that ends in the expected `<Name>_Vtbl` shape.
///
/// The base member is chosen by `TypeAttributes.WindowsRuntime`
/// (0x4000): WinRT interfaces get `base: IInspectable_Vtbl`, classic
/// COM interfaces get `base: IUnknown_Vtbl`. `IUnknown` itself is the
/// root of the COM chain and has no base — it's emitted via the
/// `win-core` prelude alias, not here.
pub fn emitInterfaceVtbls(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    var cross: CrossNsSet = .empty;
    try emitInterfaceVtblsImpl(writer, arena, file, namespace, &cross);
}

fn emitInterfaceVtblsImpl(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
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

        // IUnknown itself has no base — it's the root of the COM
        // chain and is surfaced to generated code through the
        // `win-core` prelude alias. Re-emitting its vtbl here would
        // shadow that alias with a different (baseless) type.
        if (isPreludeAlias(namespace, name)) continue;

        const is_winrt = (flags & winmd.TYPE_ATTR_WINDOWS_RUNTIME) != 0;
        const base_vtbl = if (is_winrt) "IInspectable_Vtbl" else "IUnknown_Vtbl";

        try writer.print(
            \\pub const {s}_Vtbl = extern struct {{
            \\    base: {s},
            \\
        , .{ name, base_vtbl });

        const methods = file.list(.type_def, row, 5, .method_def);
        var seen_names: std.StringHashMapUnmanaged(u32) = .empty;
        var m = methods.start;
        while (m < methods.end) : (m += 1) {
            const raw_name = file.str(.method_def, m, 3);
            const gop = try seen_names.getOrPut(arena, raw_name);
            if (gop.found_existing) {
                gop.value_ptr.* += 1;
                try writer.print("    @\"{s}_{d}\": ", .{ raw_name, gop.value_ptr.* });
            } else {
                gop.value_ptr.* = 1;
                try writer.print("    {s}: ", .{raw_name});
            }
            try writeMethodPointer(writer, arena, file, m, name, namespace, cross);
            try writer.writeAll(",\n");
        }

        try writer.writeAll("};\n");
    }
}

/// Scan every method signature in `namespace` and collect closed-generic
/// instantiations whose open definition also lives in `namespace`.
/// Recursively walks params, return types, and pointer/ref/array
/// wrappers to find `.class_name` / `.value_name` nodes with a
/// backtick in the name and non-empty generics.
fn collectGenericInstantiations(
    insts: *GenericInstSet,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const methods = file.list(.type_def, row, 5, .method_def);
        var m = methods.start;
        while (m < methods.end) : (m += 1) {
            const sig_blob = file.blob(.method_def, m, 4);
            const sig = winmd.readMethodSignature(arena, file, sig_blob) catch continue;

            try collectInstFromTy(insts, arena, sig.return_type, namespace);
            for (sig.params) |p| {
                try collectInstFromTy(insts, arena, p, namespace);
            }
        }
    }
}

/// Recursively walk a `Ty` tree and register any closed-generic
/// instantiation whose open def lives in `home_namespace`.
fn collectInstFromTy(
    insts: *GenericInstSet,
    arena: std.mem.Allocator,
    ty: winmd.Ty,
    home_namespace: []const u8,
) !void {
    switch (ty) {
        .class_name, .value_name => |tn| {
            if (std.mem.indexOfScalar(u8, tn.name, '`') != null and
                tn.generics.len > 0 and
                std.mem.eql(u8, tn.namespace, home_namespace))
            {
                var all_mangleable = true;
                for (tn.generics) |a| {
                    if (!isMangleableArg(a)) {
                        all_mangleable = false;
                        break;
                    }
                }
                if (all_mangleable) {
                    const key = try mangleInstAlloc(arena, tn.name, tn.generics);
                    if (!insts.contains(key)) {
                        try insts.put(arena, key, tn);
                    }
                }
            }
            // Recurse into generic args (they may themselves be
            // closed generics).
            for (tn.generics) |g| {
                try collectInstFromTy(insts, arena, g, home_namespace);
            }
        },
        .ptr_mut => |p| try collectInstFromTy(insts, arena, p.inner.*, home_namespace),
        .ptr_const => |p| try collectInstFromTy(insts, arena, p.inner.*, home_namespace),
        .ref_mut => |inner| try collectInstFromTy(insts, arena, inner.*, home_namespace),
        .ref_const => |inner| try collectInstFromTy(insts, arena, inner.*, home_namespace),
        .array => |inner| try collectInstFromTy(insts, arena, inner.*, home_namespace),
        .array_fixed => |a| try collectInstFromTy(insts, arena, a.inner.*, home_namespace),
        else => {},
    }
}

/// M4 Phase 4b: discover every closed-generic instantiation referenced
/// by method signatures in `source_namespace` whose open TypeDef lives
/// in a *different* namespace. Groups them by home namespace and
/// appends to `out` (creating per-ns `GenericInstSet`s on demand).
///
/// This is the Phase 4b discovery pre-pass. A bundle driver calls this
/// for each namespace it plans to emit, then routes each collected
/// per-home-namespace set into that home namespace's `emitNamespaceEx`
/// call via `extra_insts`. Without this routing, a reference like
/// `Calendar.Languages → IVectorView\`1<HSTRING>` would never see its
/// closed-generic handle emitted anywhere in the bundle, because
/// `collectGenericInstantiations` only registers open defs whose home
/// matches the currently-emitting namespace.
///
/// Only instantiations whose arg Tys are all `isMangleableArg` are
/// recorded (primitives plus class/value refs); everything else is
/// still out of scope for v0.1.
pub fn discoverCrossNsGenerics(
    out: *PendingGenericMap,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    source_namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), source_namespace)) continue;

        const methods = file.list(.type_def, row, 5, .method_def);
        var m = methods.start;
        while (m < methods.end) : (m += 1) {
            const sig_blob = file.blob(.method_def, m, 4);
            const sig = winmd.readMethodSignature(arena, file, sig_blob) catch continue;

            try collectCrossNsInstFromTy(out, arena, sig.return_type, source_namespace);
            for (sig.params) |p| {
                try collectCrossNsInstFromTy(out, arena, p, source_namespace);
            }
        }
    }
}

/// Walk a `Ty` tree and register any closed-generic instantiation
/// whose home namespace differs from `source_namespace`. The key is
/// inserted into `out[tn.namespace]`. Recurses into pointer/ref/array
/// wrappers and nested generic args.
fn collectCrossNsInstFromTy(
    out: *PendingGenericMap,
    arena: std.mem.Allocator,
    ty: winmd.Ty,
    source_namespace: []const u8,
) !void {
    switch (ty) {
        .class_name, .value_name => |tn| {
            if (std.mem.indexOfScalar(u8, tn.name, '`') != null and
                tn.generics.len > 0 and
                !std.mem.eql(u8, tn.namespace, source_namespace) and
                isProjectableNs(tn.namespace))
            {
                var all_mangleable = true;
                for (tn.generics) |a| {
                    if (!isMangleableArg(a)) {
                        all_mangleable = false;
                        break;
                    }
                }
                if (all_mangleable) {
                    const key = try mangleInstAlloc(arena, tn.name, tn.generics);
                    const home_key = try arena.dupe(u8, tn.namespace);
                    const gop = try out.getOrPut(arena, home_key);
                    if (!gop.found_existing) gop.value_ptr.* = .empty;
                    if (!gop.value_ptr.contains(key)) {
                        try gop.value_ptr.put(arena, key, tn);
                    }
                }
            }
            // Recurse into generic args (they may themselves be
            // cross-namespace closed generics).
            for (tn.generics) |g| {
                try collectCrossNsInstFromTy(out, arena, g, source_namespace);
            }
        },
        .ptr_mut => |p| try collectCrossNsInstFromTy(out, arena, p.inner.*, source_namespace),
        .ptr_const => |p| try collectCrossNsInstFromTy(out, arena, p.inner.*, source_namespace),
        .ref_mut => |inner| try collectCrossNsInstFromTy(out, arena, inner.*, source_namespace),
        .ref_const => |inner| try collectCrossNsInstFromTy(out, arena, inner.*, source_namespace),
        .array => |inner| try collectCrossNsInstFromTy(out, arena, inner.*, source_namespace),
        .array_fixed => |a| try collectCrossNsInstFromTy(out, arena, a.inner.*, source_namespace),
        else => {},
    }
}

/// Result of a bundle emission: one entry per input namespace mapping
/// to the fully-emitted Zig source bytes (arena-allocated). The caller
/// writes these out to disk / buffer.
pub const BundleEmission = std.StringArrayHashMapUnmanaged([]const u8);

/// Emit a bundle of namespaces as a single coordinated batch, auto-routing
/// cross-namespace closed-generic instantiations to their home namespace.
///
/// Workflow:
///   1. Pre-pass: for every input namespace, run `discoverCrossNsGenerics`
///      to route closed generics to their home namespace's pending set.
///   2. Fixpoint: re-run discovery until no new keys are added. Today a
///      single pass suffices (discovery scans unsubstituted sigs, which
///      is idempotent), but the loop guards against future substitution-
///      based discovery. A `max_iters` cap prevents runaway loops.
///   3. Emit: call `emitNamespaceEx` once per namespace, passing in its
///      accumulated pending set as `extra_insts`.
///
/// The returned `BundleEmission` owns no memory beyond the arena; when
/// the arena is freed all buffers vanish. The caller is expected to
/// consume the bytes before arena teardown.
pub fn emitBundle(
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespaces: []const []const u8,
    arch: Arch,
) !BundleEmission {
    var pending: PendingGenericMap = .empty;

    const max_iters: usize = 4;
    var iter: usize = 0;
    while (iter < max_iters) : (iter += 1) {
        var before: usize = 0;
        for (pending.values()) |s| before += s.count();

        for (namespaces) |ns| {
            try discoverCrossNsGenerics(&pending, arena, file, ns);
        }

        var after: usize = 0;
        for (pending.values()) |s| after += s.count();
        if (after == before and iter > 0) break;
    }

    var out: BundleEmission = .empty;
    for (namespaces) |ns| {
        var buf: std.Io.Writer.Allocating = .init(arena);
        const extra = pending.getPtr(ns);
        try emitNamespaceEx(&buf.writer, arena, file, ns, arch, extra);
        try out.put(arena, ns, buf.written());
    }
    return out;
}

/// Emit closed-generic instantiation structs for every entry in
/// `insts`. For each mangled key the set stores the originating
/// `winmd.TypeName` whose `.generics` slice carries the concrete args.
///
/// For each entry the function:
///   1. Finds the open generic TypeDef by `tn.namespace` + `tn.name`.
///   2. Walks its methods, substituting `.var_generic` with the concrete
///      args via `substituteTy`.
///   3. Emits a handle struct: `pub const <Mangled> = extern struct { vtable: *const <Mangled>_Vtbl };`
///   4. Emits a vtbl struct: `pub const <Mangled>_Vtbl = extern struct { base: IInspectable_Vtbl, ... };`
///
/// Uses a worklist to handle transitive same-home-namespace generics:
/// emitting one instantiation may discover additional closed generics
/// (e.g. `IVector<T>` methods reference `IIterator<T>`). The worklist
/// drains to fixpoint with a max-iteration guard.
fn emitGenericInstantiations(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
    insts: *GenericInstSet,
) !void {
    // Worklist: process entries until no new same-namespace
    // instantiations are discovered. Guard against infinite loops.
    var iterations: u32 = 0;
    while (iterations < 64) : (iterations += 1) {
        const snapshot_len = insts.count();
        if (snapshot_len == 0) break;

        // Snapshot current keys so we can iterate while the set grows.
        const keys = try arena.dupe([]const u8, insts.keys());

        for (keys) |mangled_name| {
            const tn = insts.get(mangled_name) orelse continue;

            // Find the open generic TypeDef row by namespace + name.
            const type_def_row = findTypeDefRow(file, tn.namespace, tn.name) orelse continue;
            const flags = file.cell(.type_def, type_def_row, 0);
            const is_winrt = (flags & winmd.TYPE_ATTR_WINDOWS_RUNTIME) != 0;
            const base_vtbl = if (is_winrt) "IInspectable_Vtbl" else "IUnknown_Vtbl";

            // Emit vtbl with substituted method signatures.
            try writer.print(
                \\pub const {s}_Vtbl = extern struct {{
                \\    base: {s},
                \\
            , .{ mangled_name, base_vtbl });

            const methods = file.list(.type_def, type_def_row, 5, .method_def);
            var m = methods.start;
            while (m < methods.end) : (m += 1) {
                const method_name = file.str(.method_def, m, 3);
                // Skip runtime-internal methods (.ctor, .cctor) — they
                // are not part of the COM/WinRT vtbl surface.
                if (method_name.len > 0 and method_name[0] == '.') continue;
                try writer.print("    {s}: ", .{method_name});
                try writeSubstitutedMethodPointer(writer, arena, file, m, mangled_name, namespace, cross, tn.generics);
                try writer.writeAll(",\n");
            }
            try writer.writeAll("};\n");

            // Emit handle struct.
            try writer.print(
                \\pub const {s} = extern struct {{
                \\    vtable: *const {s}_Vtbl,
                \\    pub const Vtbl = {s}_Vtbl;
                \\}};
                \\
            , .{ mangled_name, mangled_name, mangled_name });
        }

        // Remove processed entries. If the worklist grew during
        // emission (transitive generics), loop again.
        for (keys) |k| _ = insts.orderedRemove(k);

        if (insts.count() == 0) break;
    }
}

/// Find the TypeDef row for a given namespace + name.
fn findTypeDefRow(file: *const winmd.File, namespace: []const u8, name: []const u8) ?u32 {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (std.mem.eql(u8, file.str(.type_def, row, 2), namespace) and
            std.mem.eql(u8, file.str(.type_def, row, 1), name))
            return row;
    }
    return null;
}

/// Like `writeMethodPointer` but substitutes `.var_generic` in every
/// param/return type with concrete `type_args` before writing.
fn writeSubstitutedMethodPointer(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    method_row: u32,
    this_name: []const u8,
    current_namespace: []const u8,
    cross: *CrossNsSet,
    type_args: []const winmd.Ty,
) !void {
    const sig_blob = file.blob(.method_def, method_row, 4);
    const sig = winmd.readMethodSignature(arena, file, sig_blob) catch {
        try writer.writeAll("*const anyopaque");
        return;
    };

    // Substitute VAR generics in return type and params.
    const ret = substituteTy(arena, sig.return_type, type_args) catch {
        try writer.writeAll("*const anyopaque");
        return;
    };
    const params = arena.alloc(winmd.Ty, sig.params.len) catch {
        try writer.writeAll("*const anyopaque");
        return;
    };
    for (sig.params, 0..) |p, i| {
        params[i] = substituteTy(arena, p, type_args) catch {
            try writer.writeAll("*const anyopaque");
            return;
        };
    }

    // Representability check on substituted types.
    if (!canRepresent(ret)) {
        try writer.writeAll("*const anyopaque");
        return;
    }
    for (params) |p| {
        if (!canRepresent(p)) {
            try writer.writeAll("*const anyopaque");
            return;
        }
    }

    try writer.print("*const fn (this: *const {s}", .{this_name});
    for (params, 0..) |p, i| {
        try writer.print(", p{d}: ", .{i});
        try writeParam(writer, arena, p, current_namespace, cross);
    }
    if (ret != .void and !isHresultTy(ret)) {
        try writer.writeAll(", result: *");
        _ = try writeZigTy(writer, arena, ret, current_namespace, cross, null, null, null);
    }
    try writer.writeAll(") callconv(.winapi) HRESULT");
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
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
) !void {
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;
        const flags = file.cell(.type_def, row, 0);
        if ((flags & TYPE_ATTR_INTERFACE) == 0) continue;
        const is_winrt = (flags & winmd.TYPE_ATTR_WINDOWS_RUNTIME) != 0;

        const name = file.str(.type_def, row, 1);
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;

        // `IUnknown` already ships as a hand-written handle in
        // `win-core` (aliased into the prelude). Re-emitting it from
        // metadata would produce a duplicate top-level decl.
        if (isPreludeAlias(namespace, name)) continue;

        try writer.print(
            \\pub const {s} = extern struct {{
            \\    vtable: *const {s}_Vtbl,
            \\    pub const Vtbl = {s}_Vtbl;
            \\
        , .{ name, name, name });

        try writeInterfaceIid(writer, arena, file, row);
        try writeIUnknownWrappers(writer, name, is_winrt);

        const methods = file.list(.type_def, row, 5, .method_def);
        var seen_names: std.StringHashMapUnmanaged(u32) = .empty;
        var m = methods.start;
        while (m < methods.end) : (m += 1) {
            const raw_name = file.str(.method_def, m, 3);
            const gop = try seen_names.getOrPut(arena, raw_name);
            if (gop.found_existing) {
                gop.value_ptr.* += 1;
                // Generate a suffixed name for the overload.
                const suffixed = try std.fmt.allocPrint(arena, "{s}_{d}", .{ raw_name, gop.value_ptr.* });
                try writeMethodWrapper(writer, arena, file, m, name, namespace, cross, suffixed);
            } else {
                gop.value_ptr.* = 1;
                try writeMethodWrapper(writer, arena, file, m, name, namespace, cross, null);
            }
        }

        try writer.writeAll("};\n");
    }
}

/// Emit `pub const IID: GUID = .{ ... };` inside an interface handle's
/// struct body when the TypeDef carries a `GuidAttribute`. The WinRT
/// `Windows.Foundation.Metadata.GuidAttribute` ctor has eleven
/// positional args (`u32, u16, u16, u8, u8, u8, u8, u8, u8, u8, u8`)
/// that assemble into a standard COM GUID. Interfaces with no Guid
/// (generic parameterizations, odd synthetic types) just get no IID
/// decl — callers that need it will have to fall back to hand-written
/// constants until a later slice handles them.
fn writeInterfaceIid(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    type_def_row: u32,
) !void {
    const attr_row = winmd.findAttribute(file, .type_def, type_def_row, "GuidAttribute") orelse return;

    const args = winmd.readAttributeArgs(arena, file, attr_row) catch return;
    if (args.len != 11) return;

    const d1 = switch (args[0].value) {
        .u32_val => |v| v,
        else => return,
    };
    const d2 = switch (args[1].value) {
        .u16_val => |v| v,
        else => return,
    };
    const d3 = switch (args[2].value) {
        .u16_val => |v| v,
        else => return,
    };
    var d4: [8]u8 = undefined;
    for (0..8) |i| {
        d4[i] = switch (args[3 + i].value) {
            .u8_val => |v| v,
            else => return,
        };
    }

    try writer.print(
        "    pub const IID: GUID = .{{ .data1 = 0x{x:0>8}, .data2 = 0x{x:0>4}, .data3 = 0x{x:0>4}, .data4 = .{{ 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2}, 0x{x:0>2} }} }};\n",
        .{ d1, d2, d3, d4[0], d4[1], d4[2], d4[3], d4[4], d4[5], d4[6], d4[7] },
    );
}

/// Emit typed `QueryInterface` / `AddRef` / `Release` method
/// wrappers plus a `cast(comptime T)` convenience on a WinRT
/// interface handle. Every WinRT vtbl's first three slots are the
/// IUnknown methods (reached here as `self.vtable.base.base.*` —
/// `base: IInspectable_Vtbl` which has its own `base: IUnknown_Vtbl`).
/// The underlying fn pointers take `this: *anyopaque`, so we
/// `@ptrCast` the typed `self` at each call site and keep the
/// caller's API pointer-typed. `cast` looks up `T.IID` (emitted on
/// every interface by `writeInterfaceIid`) and returns a typed
/// `?*const T` without the caller ever seeing `*anyopaque`.
fn writeIUnknownWrappers(writer: *std.Io.Writer, name: []const u8, is_winrt: bool) !void {
    // WinRT vtbls have two levels of nesting: `base: IInspectable_Vtbl`
    // which has its own `base: IUnknown_Vtbl`. Classic-COM vtbls extend
    // `IUnknown_Vtbl` directly.
    const path = if (is_winrt) "base.base" else "base";
    try writer.print(
        \\    pub fn QueryInterface(self: *const {s}, iid: *const GUID, interface: *?*anyopaque) callconv(.winapi) HRESULT {{
        \\        return self.vtable.{s}.QueryInterface(@ptrCast(@constCast(self)), iid, interface);
        \\    }}
        \\    pub fn AddRef(self: *const {s}) callconv(.winapi) u32 {{
        \\        return self.vtable.{s}.AddRef(@ptrCast(@constCast(self)));
        \\    }}
        \\    pub fn Release(self: *const {s}) callconv(.winapi) u32 {{
        \\        return self.vtable.{s}.Release(@ptrCast(@constCast(self)));
        \\    }}
        \\    pub fn cast(self: *const {s}, comptime T: type) ?*const T {{
        \\        var out: ?*anyopaque = null;
        \\        if (self.QueryInterface(&T.IID, &out) < 0) return null;
        \\        return @ptrCast(@alignCast(out));
        \\    }}
        \\
    , .{ name, path, name, path, name, path, name });
}

/// Emit a method wrapper (`pub fn Name(self, args) HRESULT { return self.vtable.Name(self, args); }`)
/// for one MethodDef row — but only if the signature is fully
/// representable. Unrepresentable methods are skipped entirely (the
/// raw vtbl slot still falls back to `*const anyopaque`, so callers
/// can still reach them by hand).
fn writeMethodWrapper(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    method_row: u32,
    this_name: []const u8,
    current_namespace: []const u8,
    cross: *CrossNsSet,
    name_override: ?[]const u8,
) !void {
    const raw_method_name = file.str(.method_def, method_row, 3);
    const method_name = name_override orelse raw_method_name;
    // The vtbl field may be suffixed for overloads; use the raw name
    // for overload index 1 and the override name for index 2+.
    const vtbl_field_name = if (name_override) |ovr|
        // Overloaded: vtbl field was emitted as @"Name_N"
        ovr
    else
        raw_method_name;
    const sig_blob = file.blob(.method_def, method_row, 4);
    const sig = winmd.readMethodSignature(arena, file, sig_blob) catch return;

    if (!canRepresent(sig.return_type)) return;
    for (sig.params) |p| {
        if (!canRepresent(p)) return;
    }

    try writer.print("    pub fn {s}(self: *const {s}", .{ method_name, this_name });
    for (sig.params, 0..) |p, i| {
        try writer.print(", p{d}: ", .{i});
        try writeParam(writer, arena, p, current_namespace, cross);
    }
    // Classic-COM methods already return HRESULT directly; only
    // synthesize the WinRT-style `result: *T` out-param when the
    // logical return is a non-HRESULT / non-void value.
    const split_return = sig.return_type != .void and !isHresultTy(sig.return_type);
    if (split_return) {
        try writer.writeAll(", result: *");
        _ = try writeZigTy(writer, arena, sig.return_type, current_namespace, cross, null, null, null);
    }
    try writer.print(") callconv(.winapi) HRESULT {{\n        return self.vtable.@\"{s}\"(self", .{vtbl_field_name});
    for (sig.params, 0..) |_, i| {
        try writer.print(", p{d}", .{i});
    }
    if (split_return) {
        try writer.writeAll(", result");
    }
    try writer.writeAll(");\n    }\n");

    // M2 sugar: if any input param is HSTRING, emit a companion
    // `<Method>FromUtf16` wrapper that accepts `[]const u16` for those
    // params and internally creates/deinits `win_core.Hstring` handles.
    // Non-HSTRING params pass through unchanged. Returns `E_OUTOFMEMORY`
    // if `Hstring.create` fails. Uses `[]const u16` (not `[]const u8`)
    // to avoid requiring an allocator — callers feed `win_core.utf16Lit`
    // literals or the slice from an already-created wide string.
    var has_hstring_in = false;
    for (sig.params) |p| {
        if (p == .string) {
            has_hstring_in = true;
            break;
        }
    }
    if (has_hstring_in) {
        try writer.print("    pub fn {s}FromUtf16(self: *const {s}", .{ method_name, this_name });
        for (sig.params, 0..) |p, i| {
            try writer.print(", p{d}: ", .{i});
            if (p == .string) {
                try writer.writeAll("[]const u16");
            } else {
                try writeParam(writer, arena, p, current_namespace, cross);
            }
        }
        if (split_return) {
            try writer.writeAll(", result: *");
            _ = try writeZigTy(writer, arena, sig.return_type, current_namespace, cross, null, null, null);
        }
        try writer.writeAll(") HRESULT {\n");
        for (sig.params, 0..) |p, i| {
            if (p == .string) {
                try writer.print(
                    "        var h{d} = win_core.Hstring.create(p{d}) catch return @as(HRESULT, @bitCast(@as(u32, 0x8007000E)));\n",
                    .{ i, i },
                );
                try writer.print("        defer h{d}.deinit();\n", .{i});
            }
        }
        try writer.print("        return self.vtable.@\"{s}\"(self", .{vtbl_field_name});
        for (sig.params, 0..) |p, i| {
            if (p == .string) {
                try writer.print(", h{d}.raw", .{i});
            } else {
                try writer.print(", p{d}", .{i});
            }
        }
        if (split_return) {
            try writer.writeAll(", result");
        }
        try writer.writeAll(");\n    }\n");
    }

    // M2 sugar: if the split return type is HSTRING, emit a companion
    // `<Method>Owned` wrapper that returns `!win_core.Hstring` instead
    // of taking a `result: *HSTRING` out-param. HRESULT is translated
    // to a Zig error via `win_core.hresult.ok`; on success the raw
    // HSTRING is wrapped in an owning `Hstring` the caller must
    // `defer deinit()`. Input params pass through unchanged (raw
    // HSTRING for any `Ty.string` inputs — callers who want `[]const u16`
    // inputs can compose `FromUtf16` separately).
    if (split_return and sig.return_type == .string) {
        try writer.print("    pub fn {s}Owned(self: *const {s}", .{ method_name, this_name });
        for (sig.params, 0..) |p, i| {
            try writer.print(", p{d}: ", .{i});
            try writeParam(writer, arena, p, current_namespace, cross);
        }
        try writer.writeAll(") !win_core.Hstring {\n");
        try writer.writeAll("        var r: HSTRING = null;\n");
        try writer.print("        try win_core.hresult.ok(self.vtable.@\"{s}\"(self", .{vtbl_field_name});
        for (sig.params, 0..) |_, i| {
            try writer.print(", p{d}", .{i});
        }
        try writer.writeAll(", &r));\n");
        try writer.writeAll("        return win_core.Hstring.fromRaw(r);\n");
        try writer.writeAll("    }\n");
    }
}

/// Emit a function-pointer type for a single MethodDef row, WinRT-ABI
/// shaped: `*const fn(this: *const IFace, <in/out params>) callconv(.winapi) HRESULT`.
///
/// `this_name` is the simple name of the enclosing interface; it
/// produces a typed self-pointer so method wrappers on the handle
/// struct can pass `self` through without casts.
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
    this_name: []const u8,
    current_namespace: []const u8,
    cross: *CrossNsSet,
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

    try writer.print("*const fn (this: *const {s}", .{this_name});
    for (sig.params, 0..) |p, i| {
        try writer.print(", p{d}: ", .{i});
        try writeParam(writer, arena, p, current_namespace, cross);
    }
    // Mirrors the split-return gate in `writeMethodWrapper`. Classic
    // COM: return HRESULT directly. WinRT: logical return becomes a
    // trailing `result: *T` out-param and the function returns HRESULT.
    if (sig.return_type != .void and !isHresultTy(sig.return_type)) {
        try writer.writeAll(", result: *");
        _ = try writeZigTy(writer, arena, sig.return_type, current_namespace, cross, null, null, null);
    }
    try writer.writeAll(") callconv(.winapi) HRESULT");
}

/// One parameter slot. WinRT conventions: `[out]` params arrive as
/// `ELEMENT_TYPE_BYREF T` in the metadata blob (decoded as `ref_mut`
/// / `ref_const` here). We render those as `*T` / `*const T`. In
/// params are passed by value.
fn writeParam(
    writer: *std.Io.Writer,
    gpa: std.mem.Allocator,
    ty: winmd.Ty,
    current_namespace: []const u8,
    cross: *CrossNsSet,
) !void {
    switch (ty) {
        .ref_mut => |inner| {
            try writer.writeAll("*");
            _ = try writeZigTy(writer, gpa, inner.*, current_namespace, cross, null, null, null);
        },
        .ref_const => |inner| {
            try writer.writeAll("*const ");
            _ = try writeZigTy(writer, gpa, inner.*, current_namespace, cross, null, null, null);
        },
        else => _ = try writeZigTy(writer, gpa, ty, current_namespace, cross, null, null, null),
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
        .isize,
        .usize,
        .string,
        .object,
        .class_name,
        .value_name,
        => true,
        .ref_mut, .ref_const => |inner| canRepresent(inner.*),
        .ptr_mut => |p| canRepresent(p.inner.*),
        .ptr_const => |p| canRepresent(p.inner.*),
        .array_fixed => |a| canRepresent(a.inner.*),
        else => false,
    };
}

/// Returns true iff `arg` is a generic-type argument we can mangle
/// into a closed instantiation's Zig identifier. Primitives (including
/// HSTRING as `string`) qualify directly. Class/value-name refs
/// qualify when they carry no nested generics (or all nested generics
/// are themselves mangleable — recursive check). `.object` qualifies
/// as `object`.
fn isMangleableArg(arg: winmd.Ty) bool {
    return switch (arg) {
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
        .isize,
        .usize,
        .string,
        .object,
        => true,
        .class_name, .value_name => |tn| {
            for (tn.generics) |g| {
                if (!isMangleableArg(g)) return false;
            }
            return true;
        },
        else => false,
    };
}

/// Returns true iff every arg is a primitive type (no class/value name
/// refs). Used to gate cross-namespace generic emission: only
/// primitive-arg instantiations can be safely emitted without
/// coordinating imports with the home namespace.
fn allPrimitiveArgs(args: []const winmd.Ty) bool {
    for (args) |a| {
        switch (a) {
            .bool, .char, .i8, .u8, .i16, .u16, .i32, .u32, .i64, .u64, .f32, .f64, .isize, .usize, .string, .object => {},
            else => return false,
        }
    }
    return true;
}

/// Write the Zig identifier fragment for a single generic-arg `Ty`.
/// Mirrors the Zig type name emitted by `writeZigTy` for the
/// primitive cases — so `i32` maps to `i32`, `.string` to `HSTRING`,
/// etc. Class/value-name refs use `Ns_Dotted_Name` encoding
/// (dots → underscores). Nested generics recurse through
/// `writeInstMangle`. Panics on non-mangleable args; callers must
/// gate with `isMangleableArg` first.
fn writeArgMangle(writer: *std.Io.Writer, arg: winmd.Ty) !void {
    switch (arg) {
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
        .isize => try writer.writeAll("isize"),
        .usize => try writer.writeAll("usize"),
        .string => try writer.writeAll("HSTRING"),
        .object => try writer.writeAll("object"),
        .class_name, .value_name => |tn| {
            // Encode namespace + name with dots → underscores.
            for (tn.namespace) |c| try writer.writeByte(if (c == '.') '_' else c);
            try writer.writeByte('_');
            // Strip backtick-arity from name before mangling.
            const tick_idx = std.mem.indexOfScalar(u8, tn.name, '`') orelse tn.name.len;
            try writer.writeAll(tn.name[0..tick_idx]);
            // Recurse for nested generic args.
            if (tn.generics.len > 0) {
                try writer.print("__G{d}", .{tn.generics.len});
                for (tn.generics) |g| {
                    try writer.writeAll("__");
                    try writeArgMangle(writer, g);
                }
            }
        },
        else => unreachable,
    }
}

/// Write the mangled Zig identifier for a closed generic
/// instantiation. Example: `IReference\`1` with args `[i32]` yields
/// `IReference__G1__i32`. The backtick-arity suffix is stripped from
/// the open-def name; `__G<N>__<arg0>__<arg1>...` is appended where
/// `<argK>` is produced by `writeArgMangle`.
fn writeInstMangle(writer: *std.Io.Writer, open_name: []const u8, args: []const winmd.Ty) !void {
    const tick_idx = std.mem.indexOfScalar(u8, open_name, '`') orelse open_name.len;
    try writer.writeAll(open_name[0..tick_idx]);
    try writer.print("__G{d}", .{args.len});
    for (args) |a| {
        try writer.writeAll("__");
        try writeArgMangle(writer, a);
    }
}

/// Build the mangled name into an arena-allocated buffer so it can
/// be used as a HashMap key. Convenience wrapper over
/// `writeInstMangle`.
fn mangleInstAlloc(arena: std.mem.Allocator, open_name: []const u8, args: []const winmd.Ty) ![]u8 {
    var aw: std.Io.Writer.Allocating = .init(arena);
    errdefer aw.deinit();
    try writeInstMangle(&aw.writer, open_name, args);
    return aw.toOwnedSlice();
}

/// M4 Phase 4a: arena-allocate a deep copy of `ty` with every
/// `.var_generic = n` replaced by `type_args[n]`. Non-generic nodes
/// are cloned verbatim so the returned `Ty` can outlive the caller's
/// frame. Nested pointer/array inner slots are allocated in `arena`.
/// Returns the input unchanged (by value) when it contains no
/// `.var_generic` — a harmless over-allocation is acceptable.
fn substituteTy(arena: std.mem.Allocator, ty: winmd.Ty, type_args: []const winmd.Ty) !winmd.Ty {
    return switch (ty) {
        .var_generic => |idx| if (idx < type_args.len) type_args[idx] else ty,
        .ref_mut => |inner| blk: {
            const sub = try arena.create(winmd.Ty);
            sub.* = try substituteTy(arena, inner.*, type_args);
            break :blk .{ .ref_mut = sub };
        },
        .ref_const => |inner| blk: {
            const sub = try arena.create(winmd.Ty);
            sub.* = try substituteTy(arena, inner.*, type_args);
            break :blk .{ .ref_const = sub };
        },
        .ptr_mut => |p| blk: {
            const sub = try arena.create(winmd.Ty);
            sub.* = try substituteTy(arena, p.inner.*, type_args);
            break :blk .{ .ptr_mut = .{ .inner = sub, .depth = p.depth } };
        },
        .ptr_const => |p| blk: {
            const sub = try arena.create(winmd.Ty);
            sub.* = try substituteTy(arena, p.inner.*, type_args);
            break :blk .{ .ptr_const = .{ .inner = sub, .depth = p.depth } };
        },
        .array_fixed => |a| blk: {
            const sub = try arena.create(winmd.Ty);
            sub.* = try substituteTy(arena, a.inner.*, type_args);
            break :blk .{ .array_fixed = .{ .inner = sub, .size = a.size } };
        },
        else => ty,
    };
}

/// Returns true iff `ty` is the ECMA-335 type reference for
/// `Windows.Win32.Foundation.HRESULT`. Used by classic-COM method
/// emission to suppress the WinRT "out-HRESULT + logical-return
/// result-param" ABI split — classic COM methods already return
/// HRESULT directly, so the transformation would add a spurious
/// trailing `result: *HRESULT` parameter and break callers.
fn isHresultTy(ty: winmd.Ty) bool {
    return switch (ty) {
        .value_name => |tn| std.mem.eql(u8, tn.namespace, "Windows.Win32.Foundation") and
            std.mem.eql(u8, tn.name, "HRESULT"),
        else => false,
    };
}

/// Write a Zig type name for `ty`. Caller must have already verified
/// via `canRepresent` that `ty` is supported; this function never
/// returns `false` for supported input.
///
/// `renames`, when non-null, remaps `.value_name` references whose
/// namespace matches `current_namespace` and whose name is a key in
/// the map. Used by `emitOneStruct` to rewrite MIDL-mangled anon
/// nested type names (`_Anonymous_e__Union`) into stable
/// `<outer>_<index>` names that match `windows-bindgen` conventions.
fn writeZigTy(
    writer: *std.Io.Writer,
    gpa: std.mem.Allocator,
    ty: winmd.Ty,
    current_namespace: []const u8,
    cross: *CrossNsSet,
    renames: ?*const std.StringHashMapUnmanaged([]const u8),
    entries: ?*const TypeEntryMap,
    file: ?*const winmd.File,
) !bool {
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
        .isize => try writer.writeAll("isize"),
        .usize => try writer.writeAll("usize"),
        .string => try writer.writeAll("HSTRING"),
        // ELEMENT_TYPE_OBJECT (System.Object / IInspectable*). WinRT
        // factory methods commonly declare their logical return as
        // `object` even when it semantically carries an
        // `IReference<T>`; the projection happens at the call site
        // via QueryInterface, not in the sig. We emit an opaque
        // pointer so callers can pass the handle on to
        // QueryInterface or wrap it in `IInspectable` themselves.
        .object => try writer.writeAll("?*const anyopaque"),
        // WinRT / COM interface reference. In metadata this is
        // inherently a pointer — ELEMENT_TYPE_CLASS represents the
        // object by reference — so we emit `*<Name>` pointing at the
        // handle struct from `emitInterfaceHandles`. If `tn` lives in
        // a different `Windows.*` namespace we qualify the reference
        // as `*@"Windows.Foo".Name` and record `Windows.Foo` in
        // `cross` so `emitNamespace` adds the matching `@import`.
        .class_name => |tn| {
            // Delegate refs project as opaque fn-pointer typedef —
            // class_name already denotes a reference (pointer), so we
            // do NOT add a leading `*`. Outer `ptr_mut`/`ptr_const`
            // wrappers still prepend one as usual.
            if (entries != null and file != null and
                std.mem.indexOfScalar(u8, tn.name, '`') == null)
            {
                const key = try std.fmt.allocPrint(gpa, "{s}.{s}", .{ tn.namespace, tn.name });
                if (entries.?.get(key)) |entry| {
                    if (entry.kind == .delegate) {
                        try writer.writeAll("?*const anyopaque");
                        return true;
                    }
                }
            }
            // Generic WinRT interfaces (`IReference\`1` etc.). If all
            // type arguments are mangleable, emit the mangled
            // closed-instantiation reference. Same-namespace generics
            // reference the local mangled struct; cross-namespace
            // generics qualify with `@"<home-ns>"` and add the home
            // namespace to `cross` so `emitNamespace` adds the import.
            if (std.mem.indexOfScalar(u8, tn.name, '`') != null) {
                if (tn.generics.len > 0) {
                    var all_mangleable = true;
                    for (tn.generics) |a| {
                        if (!isMangleableArg(a)) {
                            all_mangleable = false;
                            break;
                        }
                    }
                    if (all_mangleable) {
                        if (std.mem.eql(u8, tn.namespace, current_namespace)) {
                            // Same namespace — unqualified reference.
                            try writer.writeAll("*");
                            try writeInstMangle(writer, tn.name, tn.generics);
                        } else if (isProjectableNs(tn.namespace) and allPrimitiveArgs(tn.generics)) {
                            // Cross-namespace with primitive-only args —
                            // safe to emit qualified reference because
                            // the home namespace can define it without
                            // importing a third namespace.
                            try cross.put(gpa, tn.namespace, {});
                            try writer.writeAll("*@\"");
                            try writer.writeAll(tn.namespace);
                            try writer.writeAll("\".");
                            try writeInstMangle(writer, tn.name, tn.generics);
                        } else {
                            // Cross-namespace with class/value args —
                            // the home ns may not have a seed for this
                            // instantiation. Fall back to opaque until
                            // a bundle driver seeds it.
                            try writer.writeAll("*anyopaque");
                        }
                        return true;
                    }
                }
                try writer.writeAll("*anyopaque");
            } else if (isProjectableNs(tn.namespace) and !std.mem.eql(u8, tn.namespace, current_namespace)) {
                try cross.put(gpa, tn.namespace, {});
                try writer.print("*@\"{s}\".{s}", .{ tn.namespace, tn.name });
            } else {
                try writer.print("*{s}", .{tn.name});
            }
        },
        // WinRT value type (enum or struct) passed by value. Same
        // cross-namespace rule as `class_name`, just without the
        // leading `*`.
        .value_name => |tn| {
            // Sidecar mode: enum refs (any namespace) collapse to their
            // underlying integer so the sidecar doesn't need to import
            // the enum's declaring namespace. Tried first so generic-name
            // / `isProjectableNs` routing below applies only to struct
            // and union refs.
            if (entries != null and file != null and
                std.mem.indexOfScalar(u8, tn.name, '`') == null)
            {
                const key = try std.fmt.allocPrint(gpa, "{s}.{s}", .{ tn.namespace, tn.name });
                if (entries.?.get(key)) |entry| {
                    if (entry.kind == .enum_type) {
                        if (enumUnderlyingReprForRow(file.?, gpa, entry.row)) |repr| {
                            try writer.writeAll(repr);
                            return true;
                        }
                    }
                    if (entry.kind == .delegate) {
                        // Delegate → opaque fn-pointer typedef projection.
                        try writer.writeAll("?*const anyopaque");
                        return true;
                    }
                }
            }

            if (std.mem.indexOfScalar(u8, tn.name, '`') != null) {
                return false;
            } else if (std.mem.eql(u8, tn.namespace, "System") and std.mem.eql(u8, tn.name, "Guid")) {
                // `System.Guid` is the ECMA-335 name for the same
                // struct `win-core` projects as `GUID`.
                try writer.writeAll("GUID");
            } else if (isProjectableNs(tn.namespace) and !std.mem.eql(u8, tn.namespace, current_namespace)) {
                try cross.put(gpa, tn.namespace, {});
                try writer.print("@\"{s}\".{s}", .{ tn.namespace, tn.name });
            } else if (renames) |r| {
                // Rewrite references to MIDL anon nested siblings
                // like `_Anonymous_e__Union` → `<outer>_<i>`.
                if (r.get(tn.name)) |new_name| {
                    try writer.writeAll(new_name);
                } else {
                    try writer.writeAll(tn.name);
                }
            } else {
                try writer.writeAll(tn.name);
            }
        },
        .ptr_mut => |p| {
            // `*void` is illegal in Zig — the C idiom `LPVOID` projects
            // as `*anyopaque` for the innermost indirection, with any
            // outer pointer layers prepended unchanged.
            if (p.inner.* == .void) {
                var d: u32 = 0;
                while (d + 1 < p.depth) : (d += 1) try writer.writeAll("*");
                try writer.writeAll("*anyopaque");
                return true;
            }
            var d: u32 = 0;
            while (d < p.depth) : (d += 1) try writer.writeAll("*");
            return writeZigTy(writer, gpa, p.inner.*, current_namespace, cross, renames, entries, file);
        },
        .ptr_const => |p| {
            if (p.inner.* == .void) {
                var d: u32 = 0;
                while (d + 1 < p.depth) : (d += 1) try writer.writeAll("*const ");
                try writer.writeAll("*const anyopaque");
                return true;
            }
            var d: u32 = 0;
            while (d < p.depth) : (d += 1) try writer.writeAll("*const ");
            return writeZigTy(writer, gpa, p.inner.*, current_namespace, cross, renames, entries, file);
        },
        .array_fixed => |a| {
            // ELEMENT_TYPE_ARRAY with explicit size — projects as a
            // fixed-length Zig array whose element type follows the
            // same representability rules as a standalone field.
            try writer.print("[{d}]", .{a.size});
            return writeZigTy(writer, gpa, a.inner.*, current_namespace, cross, renames, entries, file);
        },
        // Function-pointer typedef (ELEMENT_TYPE_FNPTR). Same opaque
        // projection as the aliases-block emits for delegate-shaped
        // fn-ptr typedefs: the inner MethodDefSig is consumed by the
        // reader but not reconstructed — callers `@ptrCast` a concrete
        // fn pointer at the call site.
        .fn_ptr => try writer.writeAll("?*const anyopaque"),
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
        "ToString: *const fn (this: *const IStringable, result: *HSTRING) callconv(.winapi) HRESULT",
    ) != null);

    // IClosable.Close: `void Close()` → no trailing out param.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IClosable_Vtbl = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "Close: *const fn (this: *const IClosable) callconv(.winapi) HRESULT",
    ) != null);

    // IUriRuntimeClassFactory.CreateUri(HSTRING uri) returns a
    // runtime class (`Uri`) — a class_name reference. With typed
    // interface handles the out param becomes `**Uri`.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "CreateUri: *const fn (this: *const IUriRuntimeClassFactory, p0: HSTRING, result: **Uri) callconv(.winapi) HRESULT",
    ) != null);

    // IAsyncInfo.get_Status returns the `AsyncStatus` enum — a
    // by-value value_name reference. The mapper should emit the
    // short name verbatim so downstream can resolve it via @import.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "get_Status: *const fn (this: *const IAsyncInfo, result: *AsyncStatus) callconv(.winapi) HRESULT",
    ) != null);

    // IPropertyValueStatics.CreateInt32 returns ELEMENT_TYPE_OBJECT
    // (System.Object / IInspectable*) in its sig — previously this
    // forced the entire slot to fall back to `*const anyopaque`. With
    // `.object` representable we now emit a fully typed slot with
    // `p0: i32` and a trailing `result: *?*const anyopaque` out-param.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "CreateInt32: *const fn (this: *const IPropertyValueStatics, p0: i32, result: *?*const anyopaque) callconv(.winapi) HRESULT",
    ) != null);

    // At least one interface in Windows.Foundation uses types we don't
    // yet support (e.g. `IReference`1` methods with classes) — those
    // must degrade to opaque rather than fail the whole emit.
    try std.testing.expect(std.mem.indexOf(u8, out, "*const anyopaque") != null);
}

test "emitInterfaceVtbls picks IUnknown_Vtbl for classic COM, skips IUnknown itself" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitInterfaceVtbls(&buf.writer, arena.allocator(), &file, "Windows.Win32.System.Com");
    const out = buf.written();

    // Classic COM interfaces in Windows.Win32 are NOT WindowsRuntime;
    // the base must be IUnknown_Vtbl, never IInspectable_Vtbl.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IStream_Vtbl = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "base: IUnknown_Vtbl") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "base: IInspectable_Vtbl") == null);

    // IUnknown itself must not be re-emitted here — it ships via the
    // win-core prelude alias with a baseless vtbl definition.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IUnknown_Vtbl = extern struct {") == null);

    // Classic-COM methods already return HRESULT; the WinRT-style
    // split that synthesizes a trailing `result: *T` out-param must
    // NOT fire. `IStream.SetSize([in] ULARGE_INTEGER)` is a minimal
    // canary — the vtbl slot must be a direct `(this, p0: u64)` with
    // no phantom `*HRESULT` tail.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "SetSize: *const fn (this: *const IStream, p0: u64) callconv(.winapi) HRESULT",
    ) != null);
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
/// * SequentialLayout / AutoLayout types emit as `extern struct`.
/// * ExplicitLayout value types emit as `extern union` — Win32
///   metadata uses ExplicitLayout exclusively for C unions (matches
///   `windows-bindgen` convention).
/// * If any instance field's type isn't currently representable
///   (e.g. a generic type arg), the whole struct is skipped rather
///   than emitted with a hole — this keeps the output compilable.
pub fn emitStructs(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    arch: Arch,
) !void {
    var cross: CrossNsSet = .empty;
    try emitStructsImpl(writer, arena, file, namespace, &cross, arch);
}

/// Emit a self-contained `<namespace>.structs.zig` sidecar: the
/// same struct body as `emitStructs` plus the header imports every
/// cross-namespace `@"Windows.X.Y"` reference needs.
///
/// Unlike `emitNamespace`, this only pulls in the `win_core`
/// aliases that actually appear in struct bodies (`BOOL`, `GUID`,
/// `HRESULT`) — the rest (HSTRING, IInspectable_Vtbl, etc.) belong
/// to interface/method output.
///
/// Cross-namespace struct refs resolve through sibling sidecars:
/// a ref to `Windows.Win32.Foundation.FILETIME` inside the
/// Storage.FileSystem sidecar emits `@"Windows.Win32.Foundation"`
/// as an import of `Windows.Win32.Foundation.structs.zig`.
pub fn emitStructsFile(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    arch: Arch,
) !void {
    var cross: CrossNsSet = .empty;
    var body: std.Io.Writer.Allocating = .init(arena);
    const body_writer = &body.writer;

    try emitStructsImpl(body_writer, arena, file, namespace, &cross, arch);

    try writer.writeAll(
        \\// Generated by winbindgen — do not edit.
        \\const win_core = @import("win-core");
        \\const BOOL = win_core.BOOL;
        \\const GUID = win_core.GUID;
        \\const HRESULT = win_core.HRESULT;
        \\const NTSTATUS = win_core.NTSTATUS;
        \\const BOOLEAN = win_core.BOOLEAN;
        \\
    );

    const keys = cross.keys();
    const sorted = try arena.dupe([]const u8, keys);
    std.mem.sort([]const u8, sorted, {}, struct {
        fn lt(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b);
        }
    }.lt);
    for (sorted) |ns| {
        try writer.print("const @\"{s}\" = @import(\"{s}.structs.zig\");\n", .{ ns, ns });
    }
    try writer.writeAll("\n");

    try writer.writeAll(body.written());
}

/// BFS the cross-namespace graph starting at `root_ns`: run the
/// struct emitter once per namespace with a discarding writer,
/// harvest the `CrossNsSet` it populated, and recurse until every
/// transitively reachable namespace has been visited.
///
/// Used by `--structs-closure <ns>` to answer "what full list of
/// `*.structs.zig` sidecars does this namespace need?" without the
/// caller having to hand-trace TypeRefs.
///
/// The returned slice is arena-owned, sorted for determinism, and
/// includes `root_ns` itself.
pub fn collectStructsClosure(
    arena: std.mem.Allocator,
    file: *const winmd.File,
    root_ns: []const u8,
    arch: Arch,
) ![]const []const u8 {
    var visited: std.StringArrayHashMapUnmanaged(void) = .empty;
    var queue: std.ArrayList([]const u8) = try .initCapacity(arena, 0);
    try queue.append(arena, root_ns);

    while (queue.pop()) |ns| {
        if (visited.contains(ns)) continue;
        try visited.put(arena, ns, {});

        var cross: CrossNsSet = .empty;
        var scratch: std.Io.Writer.Allocating = .init(arena);
        defer scratch.deinit();
        try emitStructsImpl(&scratch.writer, arena, file, ns, &cross, arch);

        for (cross.keys()) |dep| {
            if (!visited.contains(dep)) try queue.append(arena, dep);
        }
    }

    const result = try arena.dupe([]const u8, visited.keys());
    std.mem.sort([]const u8, result, {}, struct {
        fn lt(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b);
        }
    }.lt);
    return result;
}

fn emitStructsImpl(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
    arch: Arch,
) !void {
    // TypeAttributes bits (ECMA-335 §II.23.1.15).
    const VISIBILITY_MASK: u32 = 0x7;
    const VIS_NOT_PUBLIC: u32 = 0x0;
    const VIS_PUBLIC: u32 = 0x1;

    const rows = file.rowCount(.type_def);
    const entries = try buildTypeEntryMap(arena, file);
    var memo: EmitMemo = .empty;
    var emitted_names: std.StringHashMapUnmanaged(void) = .empty;
    defer emitted_names.deinit(arena);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const flags = file.cell(.type_def, row, 0);
        const vis = flags & VISIBILITY_MASK;
        if (vis != VIS_NOT_PUBLIC and vis != VIS_PUBLIC) continue; // nested

        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System")) continue;
        if (!std.mem.eql(u8, base.name, "ValueType")) continue;

        // Drop off-target arch-gated duplicates. `SLIST_HEADER` etc.
        // appear once per supported arch in the metadata; emit only
        // the variant targeting the requested `arch`.
        if (!supportsArch(file, .type_def, row, arch)) continue;

        const name = file.str(.type_def, row, 1);
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;
        if (isPreludeAlias(namespace, name)) continue;
        // Some names appear on multiple rows (e.g. callback-typedef
        // placeholders). Skip duplicates so we don't re-declare a type.
        if (emitted_names.contains(name)) continue;

        // If the struct isn't representable as an extern layout (e.g.
        // a nested union field references a type we can't project,
        // like VARIANT's `pRecInfo: IRecordInfo`), still emit an
        // opaque placeholder at the top level. Extern fn signatures
        // in the same namespace pass `*VARIANT` / `*OLEUICHANGESOURCEW`
        // by pointer, so an opaque declaration keeps the file
        // self-consistent without committing to a (wrong) layout.
        // Callers who actually use the type by value will fail later
        // with a targeted "opaque type has no layout" error instead
        // of the whole namespace failing to compile.
        if (!typeDefRepresentable(file, arena, row, arch, &entries, &memo)) {
            try writer.print("pub const {s} = opaque {{}};\n", .{name});
            try emitted_names.put(arena, name, {});
            continue;
        }

        var all_names: std.StringHashMapUnmanaged(void) = .empty;
        try all_names.put(arena, name, {});
        try emitOneStruct(writer, arena, file, namespace, cross, row, name, arch, &entries, &memo, &all_names);
        try emitted_names.put(arena, name, {});
    }
}

/// Emit a single TypeDef (struct or union) plus every TypeDef nested
/// inside it, recursively.
///
/// MIDL-generated C++ headers often contain anonymous unions inside
/// structs; the Windows metadata projects them as separately-named
/// nested TypeDefs with mangled names like `_Anonymous_e__Union`,
/// `_Privileges_e__Union`, or `_Attribute_e__Union`. The parent
/// struct's field references these by simple name, so Zig can only
/// compile the parent if the nested TypeDefs are also emitted as
/// siblings in the same namespace module.
///
/// The Rust bindgen equivalent is
/// `crates/libs/bindgen/src/types/cpp_struct.rs` which appends nested
/// structs to the parent's TokenStream (lines 238-243). The
/// `NestedClass` table (§II.22.32) is sorted by `EnclosingClass`
/// (column 1), so `equalRange` on that column cheaply finds every
/// nested TypeDef row of a given parent.
/// Categorizes a TypeDef's extends token into the three kinds
/// that matter for sidecar emission: struct/union (emittable by
/// `emitStructs`), enum (skipped — emitted by other machinery),
/// and everything else (delegate, class, interface — not
/// representable inside a struct field).
const TypeKind = enum { struct_or_union, enum_type, delegate, other };

const TypeEntry = struct {
    kind: TypeKind,
    /// TypeDef row index (0-based) for the canonical occurrence.
    /// Some names (e.g. `SLIST_HEADER`) have per-arch duplicates;
    /// last-writer-wins works because the structural checks that
    /// depend on it tolerate either row.
    row: u32,
};

const TypeEntryMap = std.StringHashMapUnmanaged(TypeEntry);

const EmitStatus = enum { unknown, in_progress, yes, no };
const EmitMemo = std.AutoHashMapUnmanaged(u32, EmitStatus);

/// Walk every TypeDef in `file` once, record its kind keyed by
/// `"<namespace>.<name>"`. Used during sidecar emission to reject
/// structs whose fields reference enums, delegates, or classes —
/// names that would be undefined inside the sidecar.
fn buildTypeEntryMap(arena: std.mem.Allocator, file: *const winmd.File) !TypeEntryMap {
    var map: TypeEntryMap = .empty;
    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        const ns = file.str(.type_def, row, 2);
        const name = file.str(.type_def, row, 1);
        if (ns.len == 0 and std.mem.eql(u8, name, "<Module>")) continue;

        const extends_tok = file.cell(.type_def, row, 3);
        var kind: TypeKind = .other;
        if (extends_tok != 0) {
            const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch {
                continue;
            };
            if (std.mem.eql(u8, base.namespace, "System")) {
                if (std.mem.eql(u8, base.name, "ValueType")) {
                    kind = .struct_or_union;
                } else if (std.mem.eql(u8, base.name, "Enum")) {
                    kind = .enum_type;
                } else if (std.mem.eql(u8, base.name, "MulticastDelegate")) {
                    // Function-pointer typedef (C callback). Fields
                    // of this type project as opaque `?*const anyopaque`
                    // in both structs and the aliases block — callers
                    // `@ptrCast` a concrete fn pointer at the call site.
                    kind = .delegate;
                }
            }
        }

        const key = try std.fmt.allocPrint(arena, "{s}.{s}", .{ ns, name });
        try map.put(arena, key, .{ .kind = kind, .row = row });
    }
    return map;
}

/// Sidecar-aware representability: same rules as `canRepresent`
/// plus every `.value_name` / `.class_name` must resolve (via
/// `entries`) to a struct/union TypeDef whose own fields are
/// themselves representable. Enum refs are rejected outright;
/// delegate/class refs likewise. Refs that don't appear in
/// `entries` (cross-winmd TypeRefs) pass through unchecked — the
/// sidecar's cross-namespace import mechanism carries them.
///
/// Recursion uses `memo` to break cycles. When the DFS hits an
/// ancestor that is still `in_progress`, we return a tentative
/// `yes` and set `tainted_out.* = true`. Tainted `yes` results
/// are not memoized — they'd otherwise poison cousins that
/// depend on an ancestor which later resolves to `.no`
/// (e.g. RESTRICTION → RESTRICTION_0 → NODERESTRICTION, where
/// NODERESTRICTION.paRes points back at the still-`in_progress`
/// RESTRICTION). After the outermost DFS call returns, no row
/// is `in_progress`, so re-querying a tainted row yields a
/// definitive answer.
fn canRepresentField(
    ty: winmd.Ty,
    file: *const winmd.File,
    entries: *const TypeEntryMap,
    memo: *EmitMemo,
    arena: std.mem.Allocator,
    arch: Arch,
    tainted_out: *bool,
) bool {
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
        .isize,
        .usize,
        .string,
        => true,
        .value_name, .class_name => |tn| blk: {
            const key = std.fmt.allocPrint(arena, "{s}.{s}", .{ tn.namespace, tn.name }) catch
                break :blk false;
            const entry = entries.get(key) orelse break :blk true;
            // Enum refs are representable via underlying-int substitution
            // (writeZigTy does the rewrite); no need to emit the enum.
            if (entry.kind == .enum_type) break :blk true;
            // Delegate refs project as opaque `?*const anyopaque`
            // (matches the aliases block and writeZigTy).
            if (entry.kind == .delegate) break :blk true;
            if (entry.kind != .struct_or_union) break :blk false;
            break :blk isRowEmittable(file, entry.row, arch, entries, memo, arena, tainted_out);
        },
        .ref_mut, .ref_const => |inner| canRepresentField(inner.*, file, entries, memo, arena, arch, tainted_out),
        .ptr_mut => |p| canRepresentField(p.inner.*, file, entries, memo, arena, arch, tainted_out),
        .ptr_const => |p| canRepresentField(p.inner.*, file, entries, memo, arena, arch, tainted_out),
        .array_fixed => |a| canRepresentField(a.inner.*, file, entries, memo, arena, arch, tainted_out),
        // Function-pointer typedef: always representable as opaque
        // `?*const anyopaque` (matches `writeZigTy`). The underlying
        // callee signature isn't reconstructed, so no recursion into
        // the inner type graph is needed.
        .fn_ptr => true,
        else => false,
    };
}

/// Memoized DFS: is this TypeDef row emittable into a sidecar?
/// Answer is `yes` iff every non-static instance field has a
/// representable type and every nested TypeDef is itself
/// emittable. Cycles return `yes` tentatively (via `tainted_out`)
/// to support types that (indirectly) point at themselves; the
/// tentative result is not memoized so later re-queries can settle
/// definitively once the cycle's ancestors have committed.
fn isRowEmittable(
    file: *const winmd.File,
    row: u32,
    arch: Arch,
    entries: *const TypeEntryMap,
    memo: *EmitMemo,
    arena: std.mem.Allocator,
    tainted_out: *bool,
) bool {
    if (memo.get(row)) |s| switch (s) {
        .yes => return true,
        .no => return false,
        .in_progress => {
            // Cycle: return tentative yes. Caller must treat their
            // own result as tainted so it doesn't get memoized.
            tainted_out.* = true;
            return true;
        },
        .unknown => {},
    };
    memo.put(arena, row, .in_progress) catch return false;

    if (!supportsArch(file, .type_def, row, arch)) {
        memo.put(arena, row, .no) catch {};
        return false;
    }

    var local_tainted: bool = false;

    const FIELD_ATTR_STATIC: u32 = 0x10;
    const field_list = file.list(.type_def, row, 4, .field);
    var f: u32 = field_list.start;
    while (f < field_list.end) : (f += 1) {
        const field_flags = file.cell(.field, f, 0);
        if ((field_flags & FIELD_ATTR_STATIC) != 0) continue;
        const ty = winmd.readFieldSignature(arena, file, file.blob(.field, f, 2)) catch {
            memo.put(arena, row, .no) catch {};
            return false;
        };
        if (!canRepresentField(ty, file, entries, memo, arena, arch, &local_tainted)) {
            memo.put(arena, row, .no) catch {};
            return false;
        }
    }

    const nc_total = file.rowCount(.nested_class);
    var i: u32 = 0;
    while (i < nc_total) : (i += 1) {
        if (file.cell(.nested_class, i, 1) != row + 1) continue;
        const nested_typedef = file.cell(.nested_class, i, 0);
        if (nested_typedef == 0) continue;
        const child_row = nested_typedef - 1;
        if (!supportsArch(file, .type_def, child_row, arch)) continue;
        if (!isRowEmittable(file, child_row, arch, entries, memo, arena, &local_tainted)) {
            memo.put(arena, row, .no) catch {};
            return false;
        }
    }

    if (local_tainted) {
        // Our `yes` depended on an ancestor still `in_progress`.
        // Don't memoize — clear the `in_progress` placeholder so a
        // later query re-runs the DFS (by which time the ancestor
        // will have committed either `.yes` or `.no`).
        _ = memo.remove(row);
        tainted_out.* = true;
    } else {
        memo.put(arena, row, .yes) catch {};
    }
    return true;
}

fn typeDefRepresentable(
    file: *const winmd.File,
    arena: std.mem.Allocator,
    row: u32,
    arch: Arch,
    entries: *const TypeEntryMap,
    memo: *EmitMemo,
) bool {
    var tainted: bool = false;
    return isRowEmittable(file, row, arch, entries, memo, arena, &tainted);
}

fn emitOneStruct(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
    row: u32,
    name: []const u8,
    arch: Arch,
    entries: *const TypeEntryMap,
    memo: *EmitMemo,
    all_names: *std.StringHashMapUnmanaged(void),
) !void {
    const LAYOUT_MASK: u32 = 0x18;
    const LAYOUT_EXPLICIT: u32 = 0x10;
    const FIELD_ATTR_STATIC: u32 = 0x10;

    const flags = file.cell(.type_def, row, 0);
    const is_union = (flags & LAYOUT_MASK) == LAYOUT_EXPLICIT;

    const field_list = file.list(.type_def, row, 4, .field);
    if (field_list.start == field_list.end) return;

    // Representability is checked transitively over all nested TypeDefs
    // because we emit each nested as an inline `pub const` in the parent
    // body. A nested type with an out-of-scope field type would leave a
    // dangling identifier in the parent's field list, so drop the whole
    // tree rather than emit half of it.
    if (!typeDefRepresentable(file, arena, row, arch, entries, memo)) return;

    try writer.print("pub const {s} = extern {s} {{\n", .{ name, if (is_union) "union" else "struct" });

    // Emit nested TypeDefs as inner pub const decls so field types
    // like `_Anonymous_e__Union` resolve via Zig struct-scope lookup
    // without polluting the namespace. Multiple parents can each
    // have their own `_Anonymous_e__Union` without colliding. The
    // nested_class table is sorted by NestedClass (column 0), not
    // EnclosingClass, so linear-scan to collect all children of this
    // row.
    //
    // MIDL-generated anon unions/structs come through the metadata as
    // `_Anonymous_e__Union` / `_Anonymous_e__Struct`, which survive
    // verbatim in `windows-sys` but are renamed by `windows-bindgen`
    // into stable `<outer>_<index>` identifiers. We follow the Rust
    // convention so consumers can switch between projections without
    // hunting for renamed field types, and so nested siblings get
    // unique names instead of colliding on `_Anonymous_e__Struct`.
    var renames: std.StringHashMapUnmanaged([]const u8) = .empty;
    var anon_index: u32 = 0;
    const nc_total = file.rowCount(.nested_class);
    var i: u32 = 0;
    while (i < nc_total) : (i += 1) {
        if (file.cell(.nested_class, i, 1) != row + 1) continue;
        const nested_typedef = file.cell(.nested_class, i, 0);
        if (nested_typedef == 0) continue;
        const child_row = nested_typedef - 1;
        if (!supportsArch(file, .type_def, child_row, arch)) continue;
        const child_name = file.str(.type_def, child_row, 1);
        if (std.mem.indexOfScalar(u8, child_name, '`') != null) continue;

        const base_name = if (std.mem.startsWith(u8, child_name, "_Anonymous")) blk: {
            const renamed = try std.fmt.allocPrint(arena, "{s}_{d}", .{ name, anon_index });
            anon_index += 1;
            break :blk renamed;
        } else child_name;

        // Ensure unique name across the whole emitted top-level struct
        // tree. Zig 0.16 treats `pub const X` inside a container as
        // visible from every descendant, so sibling scopes with the
        // same name produce an ambiguous-reference error (no shadow).
        // When a collision exists, suffix with `_2`, `_3`, ... until
        // free, and record the original name in `renames` so this
        // scope's field signatures resolve to the new identifier.
        var effective_name: []const u8 = base_name;
        if (all_names.contains(effective_name)) {
            var suffix: u32 = 2;
            while (true) : (suffix += 1) {
                const candidate = try std.fmt.allocPrint(arena, "{s}_{d}", .{ base_name, suffix });
                if (!all_names.contains(candidate)) {
                    effective_name = candidate;
                    break;
                }
            }
        }
        if (!std.mem.eql(u8, effective_name, child_name)) {
            try renames.put(arena, child_name, effective_name);
        }
        try all_names.put(arena, effective_name, {});

        try emitOneStruct(writer, arena, file, namespace, cross, child_row, effective_name, arch, entries, memo, all_names);
    }

    var f: u32 = field_list.start;
    while (f < field_list.end) : (f += 1) {
        const field_flags = file.cell(.field, f, 0);
        if ((field_flags & FIELD_ATTR_STATIC) != 0) continue;
        const ty = winmd.readFieldSignature(arena, file, file.blob(.field, f, 2)) catch continue;
        const field_name = file.str(.field, f, 1);
        if (isZigReservedIdent(field_name)) {
            try writer.print("    @\"{s}\": ", .{field_name});
        } else {
            try writer.print("    {s}: ", .{field_name});
        }
        _ = try writeZigTy(writer, arena, ty, namespace, cross, if (renames.count() == 0) null else &renames, entries, file);
        try writer.writeAll(",\n");
    }
    try writer.writeAll("};\n");
}

test "emitStructs writes Point/Rect/TimeSpan from Windows.Foundation" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Foundation", .x64);
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

test "emitInterfaceHandles writes IStringable handle with method wrappers" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;

    try emitInterfaceHandles(&buf.writer, arena.allocator(), &file, "Windows.Foundation", &cross);
    const out = buf.written();

    // Canonical COM object layout: first word is the vtbl pointer,
    // followed by method wrappers that forward through the vtable.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const IStringable = extern struct {\n    vtable: *const IStringable_Vtbl,\n    pub const Vtbl = IStringable_Vtbl;\n",
    ) != null);

    // The ToString wrapper forwards to `self.vtable.ToString(self, result)`.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn ToString(self: *const IStringable, result: *HSTRING) callconv(.winapi) HRESULT {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "return self.vtable.@\"ToString\"(self, result);") != null);

    // IUnknown wrappers reach the IUnknown slots at `vtable.base.base.*`
    // (IInspectable_Vtbl.base is IUnknown_Vtbl).
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn QueryInterface(self: *const IStringable, iid: *const GUID, interface: *?*anyopaque) callconv(.winapi) HRESULT {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "return self.vtable.base.base.QueryInterface(@ptrCast(@constCast(self)), iid, interface);",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub fn AddRef(self: *const IStringable) callconv(.winapi) u32 {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub fn Release(self: *const IStringable) callconv(.winapi) u32 {") != null);

    // `cast` is the typed QueryInterface convenience — looks up
    // `T.IID` (emitted by writeInterfaceIid on every interface).
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn cast(self: *const IStringable, comptime T: type) ?*const T {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "if (self.QueryInterface(&T.IID, &out) < 0) return null;") != null);

    // IStringable's IID from WinRT metadata: {96369f54-8eb6-48f0-abce-c1b211e627c3}.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const IID: GUID = .{ .data1 = 0x96369f54, .data2 = 0x8eb6, .data3 = 0x48f0, .data4 = .{ 0xab, 0xce, 0xc1, 0xb2, 0x11, 0xe6, 0x27, 0xc3 } };",
    ) != null);

    // IClosable.Close: void-returning, no trailing out param.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn Close(self: *const IClosable) callconv(.winapi) HRESULT {",
    ) != null);

    // M2 sugar: `IUriRuntimeClassFactory.CreateUri` takes an HSTRING in,
    // so the emitter should produce a `CreateUriFromUtf16` companion that
    // accepts a `[]const u16` slice and internally creates/deinits the
    // HSTRING via `win_core.Hstring.create`. This keeps the raw wrapper
    // untouched and offers a UTF-16-friendly alternative.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn CreateUriFromUtf16(self: *const IUriRuntimeClassFactory, p0: []const u16, result: **Uri) HRESULT {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "var h0 = win_core.Hstring.create(p0) catch return @as(HRESULT, @bitCast(@as(u32, 0x8007000E)));",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "defer h0.deinit();") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "return self.vtable.@\"CreateUri\"(self, h0.raw, result);") != null);

    // Methods with no HSTRING inputs (e.g. IStringable.ToString) should
    // NOT get a FromUtf16 companion — the sugar is opt-in by signature.
    try std.testing.expect(std.mem.indexOf(u8, out, "ToStringFromUtf16") == null);

    // M2 return-side sugar: `IStringable.ToString` returns an HSTRING
    // via a `result: *HSTRING` out-param, so the emitter should add a
    // `ToStringOwned` companion that returns `!win_core.Hstring` and
    // internally translates the HRESULT through `win_core.hresult.ok`,
    // then wraps the raw handle with `Hstring.fromRaw` for caller
    // `defer deinit()`.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn ToStringOwned(self: *const IStringable) !win_core.Hstring {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "var r: HSTRING = null;") != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "try win_core.hresult.ok(self.vtable.@\"ToString\"(self, &r));",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "return win_core.Hstring.fromRaw(r);") != null);

    // Non-HSTRING-returning methods (e.g. IClosable.Close, which is
    // void/HRESULT-only) should NOT get an `Owned` companion.
    try std.testing.expect(std.mem.indexOf(u8, out, "CloseOwned") == null);

    // Many interfaces should have been emitted.
    var count: usize = 0;
    var search = out;
    while (std.mem.indexOf(u8, search, "pub const I")) |idx| {
        count += 1;
        search = search[idx + 1 ..];
    }
    try std.testing.expect(count > 5);
}

/// Emit opaque handle structs for every WinRT runtime class in
/// `namespace`. A runtime class is a `TypeDef` that:
///
///   * is not an interface (`tdInterface` clear),
///   * is not `System.ValueType` / `System.Enum` / `System.MulticastDelegate`
///     derived,
///   * extends `System.Object`.
///
/// This is what vtbls produced by `emitInterfaceVtbls` reference when
/// a method returns or consumes a runtime class (e.g.
/// `IUriRuntimeClassFactory.CreateUri` returns `**Uri`). Emitting
/// these as `extern struct { vtable: *const anyopaque }` gives the
/// generated code a valid, pointer-compatible destination for those
/// references; resolving the default interface to produce a typed
/// vtable pointer is a later slice.
pub fn emitRuntimeClasses(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
    cross: *CrossNsSet,
) !void {
    const VISIBILITY_MASK: u32 = 0x7;
    const VIS_NOT_PUBLIC: u32 = 0x0;
    const VIS_PUBLIC: u32 = 0x1;

    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const flags = file.cell(.type_def, row, 0);
        const vis = flags & VISIBILITY_MASK;
        if (vis != VIS_NOT_PUBLIC and vis != VIS_PUBLIC) continue;
        if ((flags & TYPE_ATTR_INTERFACE) != 0) continue;
        if ((flags & winmd.TYPE_ATTR_WINDOWS_RUNTIME) == 0) continue;

        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        // Accept any WinRT class regardless of base — derived classes
        // (e.g. AnimationPropertyInfo : CompositionObject) need handles
        // too. Skip non-class metadata types like attributes and
        // contracts.
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        // Attributes and API contracts extend System.Attribute /
        // System.ValueType — not runtime-constructable classes.
        if (std.mem.eql(u8, base.namespace, "System") and
            !std.mem.eql(u8, base.name, "Object"))
            continue;

        const name = file.str(.type_def, row, 1);
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;

        // Resolve the default interface, if present. Every WinRT
        // runtime class has at most one InterfaceImpl row carrying a
        // `DefaultAttribute`; its `Interface` column (a TypeDefOrRef
        // coded index) is the default-interface type whose vtable
        // layout is what a `*<Class>` handle really points at.
        const default_name = defaultInterface(file, row);

        if (default_name) |tn| {
            // Emit a typed vtable pointer only when the default
            // interface lives in the same namespace — cross-namespace
            // imports land in a later slice. Generic default
            // interfaces (IVector`1 etc.) still fall back to opaque
            // because their `_Vtbl` symbol isn't emitted either.
            const same_ns = std.mem.eql(u8, tn.namespace, namespace);
            const is_generic = std.mem.indexOfScalar(u8, tn.name, '`') != null;
            if (same_ns and !is_generic) {
                try writer.print(
                    \\pub const {s} = extern struct {{
                    \\    vtable: *const {s}_Vtbl,
                    \\
                , .{ name, tn.name });
                try writeClassNames(writer, namespace, name);
                try writeActivateMethod(writer, arena, file, row, name, tn.name);
                try writeFactoryAlias(writer, arena, file, row, namespace, cross);
                try writeStaticsAliases(writer, arena, file, row, namespace, cross);
                try writer.writeAll("};\n");
                continue;
            }
        }

        try writer.print(
            \\pub const {s} = extern struct {{
            \\    vtable: *const anyopaque,
            \\
        , .{name});
        try writeClassNames(writer, namespace, name);
        try writeFactoryAlias(writer, arena, file, row, namespace, cross);
        try writeStaticsAliases(writer, arena, file, row, namespace, cross);
        try writer.writeAll("};\n");
    }
}

/// Emit a `pub fn activate() !*Self` convenience method inside a
/// runtime-class body when the class can be default-constructed via
/// the universal `IActivationFactory::ActivateInstance` path.
///
/// Gating: only emitted when `hasParameterlessActivation` is true for
/// `class_row`. Classes whose `[Activatable]` attributes all name a
/// typed factory (e.g. `Windows.Foundation.Uri`) construct through
/// that factory instead and never receive this method.
///
/// Signature convention: returns a raw pointer to the runtime-class
/// handle itself (`*Self`), not a `Com(...)` wrapper. The handle's
/// layout is `extern struct { vtable: *const <DefaultInterface>_Vtbl }`
/// — identical to the raw COM pointer `activateInstance` hands back,
/// so the trailing `@ptrCast` is pure type punning. The caller owns
/// one reference and must `Release` through the default-interface
/// vtable before dropping the pointer.
///
/// The `default_iface_name` is the bare type name of the default
/// interface (e.g. `"IJsonObject"`), used to name its `_Vtbl` symbol.
/// It must live in the same projectable namespace as the class — the
/// caller has already checked `same_ns and !is_generic` before invoking
/// this helper, so cross-namespace defaults are not handled here.
fn writeActivateMethod(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    class_row: u32,
    class_name: []const u8,
    default_iface_name: []const u8,
) !void {
    if (!hasParameterlessActivation(arena, file, class_row)) return;
    try writer.print(
        \\    pub fn activate() !*{s} {{
        \\        const raw = try win_core.activateInstance({s}_Vtbl, &NAME_W);
        \\        return @ptrCast(raw);
        \\    }}
        \\
    , .{ class_name, default_iface_name });
}

/// Emit the fully-qualified runtime class name as two compile-time
/// constants inside a class's `extern struct` body:
///   - `NAME`: UTF-8 `[]const u8`, handy for logs and diagnostics.
///   - `NAME_W`: UTF-16 LE array, directly consumable by
///     `win_core.activationFactory` (which takes `[]const u16`)
///     and other WinRT string APIs. Runtime class names are ASCII
///     by contract, so each byte widens 1:1 to a u16 code unit.
fn writeClassNames(
    writer: *std.Io.Writer,
    namespace: []const u8,
    name: []const u8,
) !void {
    try writer.print("    pub const NAME: []const u8 = \"{s}.{s}\";\n", .{ namespace, name });
    const total_len = namespace.len + 1 + name.len;
    try writer.print("    pub const NAME_W: [{d}]u16 = .{{", .{total_len});
    var first = true;
    for (namespace) |b| {
        if (!first) try writer.writeAll(",");
        try writer.print(" {d}", .{b});
        first = false;
    }
    try writer.print(", {d}", .{@as(u8, '.')});
    for (name) |b| {
        try writer.print(", {d}", .{b});
    }
    try writer.writeAll(" };\n");
}

/// Emit `pub const Factory = <FactoryInterface>;` inside a runtime
/// class body when the class carries an `ActivatableAttribute` whose
/// first positional argument is a `System.Type` naming the factory
/// interface (i.e. `[Activatable(typeof(IFooFactory), version)]`).
///
/// Classes with only the parameterless `[Activatable(version)]`
/// overload activate through the generic `IActivationFactory` and
/// need no class-specific alias — they are skipped.
///
/// When the factory lives in a different projectable namespace
/// (`Windows.*`) the alias is qualified through the namespace import
/// block: `pub const Factory = @"Windows.Foo".IFooFactory;`, and the
/// factory's namespace is recorded in `cross` so `emitNamespace`
/// threads the matching `@import` into the file header. Generic
/// factory interfaces and non-projectable namespaces are dropped
/// silently.
///
/// The emitted alias names the factory's *handle* type (not its
/// `_Vtbl`) so callers reach `.IID`, the IUnknown wrappers, and any
/// typed method wrappers the factory interface exposes. For an
/// activation call they then pass the vtbl type explicitly, e.g.
/// `win_core.activationFactory(IUriRuntimeClassFactory_Vtbl,
/// &Uri.Factory.IID, &Uri.NAME_W)`.
fn writeFactoryAlias(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    class_row: u32,
    namespace: []const u8,
    cross: *CrossNsSet,
) !void {
    const factory = activationFactoryName(arena, file, class_row) orelse return;
    if (std.mem.indexOfScalar(u8, factory.name, '`') != null) return;
    if (std.mem.eql(u8, factory.namespace, namespace)) {
        try writer.print("    pub const Factory = {s};\n", .{factory.name});
    } else if (isProjectableNs(factory.namespace)) {
        try cross.put(arena, factory.namespace, {});
        try writer.print("    pub const Factory = @\"{s}\".{s};\n", .{ factory.namespace, factory.name });
    } else {
        return;
    }
    try writer.writeAll(
        \\    pub fn factory() !win_core.Com(Factory.Vtbl) {
        \\        return win_core.activationFactory(Factory.Vtbl, &Factory.IID, &NAME_W);
        \\    }
        \\
    );
}

/// Scan the custom attributes on runtime-class row `class_row` for
/// an `ActivatableAttribute` whose first positional argument is a
/// `System.Type` — i.e. the explicit-factory overload
/// `[Activatable(typeof(IFooFactory), version)]`. Returns the
/// resolved `TypeName` of that factory interface.
///
/// Classes can carry several `ActivatableAttribute` rows (one per
/// contract version plus zero or more static-factory siblings). The
/// first typed overload wins — in practice every class has at most
/// one activation factory, and the version/contract ordering is not
/// relevant for codegen.
///
/// Returns null when:
///   - the class has no `ActivatableAttribute`,
///   - every attribute uses the parameterless `[Activatable(version)]`
///     overload (generic `IActivationFactory` path), or
///   - the arg blob cannot be decoded (malformed metadata).
fn activationFactoryName(
    arena: std.mem.Allocator,
    file: *const winmd.File,
    class_row: u32,
) ?winmd.TypeName {
    const range = winmd.attributes(file, .type_def, class_row);
    var i = range.start;
    while (i < range.end) : (i += 1) {
        const tn = winmd.attributeName(file, i) orelse continue;
        if (!std.mem.eql(u8, tn.name, "ActivatableAttribute")) continue;

        const args = winmd.readAttributeArgs(arena, file, i) catch continue;
        if (args.len == 0) continue;
        switch (args[0].value) {
            .type_name => |factory| return factory,
            else => continue,
        }
    }
    return null;
}

/// Does this runtime class carry any parameterless `[Activatable]` attribute?
///
/// A WinRT class can be default-constructed when at least one of its
/// `ActivatableAttribute` rows uses the *un*-typed overload — i.e. the
/// first positional arg is a `uint` contract version rather than a
/// `System.Type` factory. That overload tells the runtime "use the
/// universal `IActivationFactory::ActivateInstance`"; it's the code
/// path behind `winrt::default_activation_factory` in C++/WinRT and
/// `IActivationFactory` in windows-rs.
///
/// A class can expose both overloads (a typed custom factory *and* a
/// parameterless one). We only care whether at least one parameterless
/// row exists — that's the signal to emit an `activate()` convenience.
fn hasParameterlessActivation(
    arena: std.mem.Allocator,
    file: *const winmd.File,
    class_row: u32,
) bool {
    const range = winmd.attributes(file, .type_def, class_row);
    var i = range.start;
    while (i < range.end) : (i += 1) {
        const tn = winmd.attributeName(file, i) orelse continue;
        if (!std.mem.eql(u8, tn.name, "ActivatableAttribute")) continue;

        const args = winmd.readAttributeArgs(arena, file, i) catch continue;
        if (args.len == 0) continue;
        switch (args[0].value) {
            // Typed factory overload; keep looking for a parameterless sibling.
            .type_name => continue,
            // Any non-type first arg (uint version in practice) means the
            // parameterless `IActivationFactory` path applies.
            else => return true,
        }
    }
    return false;
}

/// Emit zero or more `Statics` aliases on a runtime class's body —
/// one per `[Static(typeof(IFooStatics), version)]` custom attribute.
/// A class may advertise several statics interfaces across contract
/// versions (e.g. `IUriRuntimeClassStatics` plus
/// `IUriRuntimeClassStatics2`); the aliases are numbered in the
/// order metadata presents them:
///
///     pub const Statics  = IUriRuntimeClassStatics;
///     pub const Statics2 = IUriRuntimeClassStatics2;
///
/// Callers reach the IID via `Class.Statics.IID` and activate via
/// `win_core.activationFactory(IFooStatics_Vtbl, &Class.Statics.IID,
/// &Class.NAME_W)` — the same shape as `Factory`.
///
/// Cross-namespace statics interfaces (inside another `Windows.*`
/// namespace) are qualified via the namespace import block and
/// recorded in `cross`; generic and non-projectable interfaces are
/// skipped silently.
fn writeStaticsAliases(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    class_row: u32,
    namespace: []const u8,
    cross: *CrossNsSet,
) !void {
    const range = winmd.attributes(file, .type_def, class_row);
    var i = range.start;
    var index: u32 = 0;
    while (i < range.end) : (i += 1) {
        const tn = winmd.attributeName(file, i) orelse continue;
        if (!std.mem.eql(u8, tn.name, "StaticAttribute")) continue;

        const args = winmd.readAttributeArgs(arena, file, i) catch continue;
        if (args.len == 0) continue;
        const statics = switch (args[0].value) {
            .type_name => |t| t,
            else => continue,
        };
        if (std.mem.indexOfScalar(u8, statics.name, '`') != null) continue;

        const same_ns = std.mem.eql(u8, statics.namespace, namespace);
        if (!same_ns and !isProjectableNs(statics.namespace)) continue;

        index += 1;
        if (same_ns) {
            if (index == 1) {
                try writer.print("    pub const Statics = {s};\n", .{statics.name});
            } else {
                try writer.print("    pub const Statics{d} = {s};\n", .{ index, statics.name });
            }
        } else {
            try cross.put(arena, statics.namespace, {});
            if (index == 1) {
                try writer.print("    pub const Statics = @\"{s}\".{s};\n", .{ statics.namespace, statics.name });
            } else {
                try writer.print("    pub const Statics{d} = @\"{s}\".{s};\n", .{ index, statics.namespace, statics.name });
            }
        }
        if (index == 1) {
            try writer.writeAll(
                \\    pub fn statics() !win_core.Com(Statics.Vtbl) {
                \\        return win_core.activationFactory(Statics.Vtbl, &Statics.IID, &NAME_W);
                \\    }
                \\
            );
        } else {
            try writer.print(
                "    pub fn statics{d}() !win_core.Com(Statics{d}.Vtbl) {{\n" ++
                    "        return win_core.activationFactory(Statics{d}.Vtbl, &Statics{d}.IID, &NAME_W);\n" ++
                    "    }}\n",
                .{ index, index, index, index },
            );
        }
    }
}

/// Emit an opaque handle struct for every WinRT delegate in
/// `namespace`. Delegates (function-pointer contracts like
/// `AsyncActionCompletedHandler`) are TypeDefs whose base is
/// `System.MulticastDelegate`. Full call-syntax support is deferred —
/// for now we just make cross-references to the name resolve so vtbl
/// slots that pass a `*DelegateName` compile.
pub fn emitDelegates(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    file: *const winmd.File,
    namespace: []const u8,
) !void {
    const rows = file.rowCount(.type_def);
    var emitted_names: std.StringHashMapUnmanaged(void) = .empty;
    defer emitted_names.deinit(arena);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        if (!std.mem.eql(u8, file.str(.type_def, row, 2), namespace)) continue;

        const flags = file.cell(.type_def, row, 0);
        if ((flags & TYPE_ATTR_INTERFACE) != 0) continue;

        const extends_tok = file.cell(.type_def, row, 3);
        if (extends_tok == 0) continue;
        const base = winmd.resolveTypeDefOrRefName(file, extends_tok) catch continue;
        if (!std.mem.eql(u8, base.namespace, "System")) continue;
        if (!std.mem.eql(u8, base.name, "MulticastDelegate")) continue;

        const name = file.str(.type_def, row, 1);
        if (std.mem.indexOfScalar(u8, name, '`') != null) continue;
        if (emitted_names.contains(name)) continue;

        try writer.print("pub const {s} = opaque {{}};\n", .{name});
        try emitted_names.put(arena, name, {});
    }
}

/// Return the default interface of the runtime-class TypeDef row, or
/// null if the class has no `DefaultAttribute`-tagged InterfaceImpl.
///
/// InterfaceImpl (§II.22.23) is sorted by Class, so we binary-search
/// for the rows belonging to `class_row` (values are stored 1-based)
/// and scan for the one with a `DefaultAttribute` custom attribute.
fn defaultInterface(file: *const winmd.File, class_row: u32) ?winmd.TypeName {
    const impls = file.equalRange(.interface_impl, 0, class_row + 1);
    var i = impls.start;
    while (i < impls.end) : (i += 1) {
        if (!winmd.hasAttribute(file, .interface_impl, i, "DefaultAttribute")) continue;
        const iface_tok = file.cell(.interface_impl, i, 1);
        return winmd.resolveTypeDefOrRefName(file, iface_tok) catch null;
    }
    return null;
}

test "emitRuntimeClasses writes Uri handle" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;

    try emitRuntimeClasses(&buf.writer, arena.allocator(), &file, "Windows.Foundation", &cross);
    const out = buf.written();

    // `Uri`'s default interface is `IUriRuntimeClass` — same namespace,
    // non-generic — so we expect a typed vtable pointer plus both the
    // UTF-8 `NAME` and UTF-16 `NAME_W` compile-time constants, plus a
    // `Factory` alias pointing at `IUriRuntimeClassFactory` (from
    // `[Activatable(typeof(IUriRuntimeClassFactory), ...)]`).
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Uri = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "vtable: *const IUriRuntimeClass_Vtbl,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const NAME: []const u8 = \"Windows.Foundation.Uri\";") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const NAME_W: [22]u16 = .{ 87, 105, 110, 100, 111, 119, 115, 46, 70, 111, 117, 110, 100, 97, 116, 105, 111, 110, 46, 85, 114, 105 };") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Factory = IUriRuntimeClassFactory;") != null);
    // `Uri` carries `[Static(typeof(IUriEscapeStatics), ...)]`, the
    // home of `UnescapeComponent` / `EscapeComponent`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Statics = IUriEscapeStatics;") != null);
    // `GuidHelper` and `PropertyValue` are static-only runtime
    // classes in the same namespace — both should pick up the alias.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Statics = IGuidHelperStatics;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Statics = IPropertyValueStatics;") != null);

    // WwwFormUrlDecoder is another Windows.Foundation runtime class.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const WwwFormUrlDecoder = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const NAME: []const u8 = \"Windows.Foundation.WwwFormUrlDecoder\";") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const NAME_W: [36]u16 = .{") != null);

    // `Uri` activates only through its typed factory
    // (`[Activatable(typeof(IUriRuntimeClassFactory), ...)]` — no
    // parameterless overload), so the `activate()` convenience must
    // NOT be emitted.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub fn activate") == null);

    // No interface names should appear here — those go through
    // `emitInterfaceHandles`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IStringable") == null);
}

test "emitRuntimeClasses emits activate() on parameterless WinRT classes" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;

    try emitRuntimeClasses(&buf.writer, arena.allocator(), &file, "Windows.Data.Json", &cross);
    const out = buf.written();

    // `JsonObject` and `JsonArray` both carry parameterless
    // `[Activatable(version)]` attributes — they should pick up the
    // default-construction convenience that delegates to
    // `win_core.activateInstance`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const JsonObject = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub fn activate() !*JsonObject {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "        const raw = try win_core.activateInstance(IJsonObject_Vtbl, &NAME_W);") != null);

    try std.testing.expect(std.mem.indexOf(u8, out, "pub const JsonArray = extern struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub fn activate() !*JsonArray {") != null);

    // `JsonValue` has only `[Static(...)]` attributes — no activation
    // at all, not even typed — so no `activate()` should be emitted
    // on it.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const JsonValue = extern struct {") != null);
    // Scan the slice of `out` starting at `JsonValue` up to the next
    // top-level `pub const ` (i.e. the following class) for any
    // `pub fn activate`. This is a stronger check than a raw
    // `indexOf` on the whole buffer since JsonObject/JsonArray
    // legitimately carry the method.
    const jv_start = std.mem.indexOf(u8, out, "pub const JsonValue = extern struct {").?;
    const jv_end_rel = std.mem.indexOf(u8, out[jv_start..], "\n};\n").?;
    const jv_body = out[jv_start .. jv_start + jv_end_rel];
    try std.testing.expect(std.mem.indexOf(u8, jv_body, "pub fn activate") == null);
}

test "emitDelegates writes opaque handles for WinRT delegates" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitDelegates(&buf.writer, std.testing.allocator, &file, "Windows.Foundation");
    const out = buf.written();

    // AsyncActionCompletedHandler / DeferralCompletedHandler are
    // non-generic delegates in Windows.Foundation.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const AsyncActionCompletedHandler = opaque {};") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const DeferralCompletedHandler = opaque {};") != null);

    // Generic-arity delegates (AsyncOperationCompletedHandler`1 etc.)
    // are skipped — no backticks in the output.
    try std.testing.expect(std.mem.indexOfScalar(u8, out, '`') == null);

    // Interfaces and runtime classes must not leak into this emitter.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IStringable") == null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const Uri ") == null);
}

test "emitNamespace composes all sub-emitters for Windows.Foundation" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Foundation", .x64);
    const out = buf.written();

    // Header establishes the win-core dependency and bridges the
    // primitives each sub-emitter references by bare name.
    try std.testing.expect(std.mem.indexOf(u8, out, "const win_core = @import(\"win-core\");") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const HRESULT = win_core.HRESULT;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const HSTRING = win_core.HSTRING;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const IInspectable_Vtbl = win_core.IInspectable_Vtbl;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const IUnknown_Vtbl = win_core.IUnknown_Vtbl;") != null);

    // One representative from each sub-emitter — ordering matters
    // because typed vtbls reference handles declared earlier.
    const iid = std.mem.indexOf(u8, out, "pub const IID_IStringable: GUID = .{").?;
    const enum_async = std.mem.indexOf(u8, out, "pub const AsyncStatus = enum(i32)").?;
    const point = std.mem.indexOf(u8, out, "pub const Point = extern struct {").?;
    const handle = std.mem.indexOf(u8, out, "pub const IStringable = extern struct {").?;
    const rt_class = std.mem.indexOf(u8, out, "pub const Uri = extern struct {").?;
    const vtbl = std.mem.indexOf(u8, out, "pub const IStringable_Vtbl = extern struct {").?;

    try std.testing.expect(iid < enum_async);
    try std.testing.expect(enum_async < point);
    try std.testing.expect(point < handle);
    try std.testing.expect(handle < rt_class);
    try std.testing.expect(rt_class < vtbl);
}

test "emitNamespace qualifies cross-namespace refs and emits import aliases" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Globalization pulls types from Windows.Foundation and
    // Windows.System (e.g. `User`, `DateTime`) — a known-busy namespace
    // for exercising the cross-ns emit path.
    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Globalization", .x64);
    const out = buf.written();

    // Each referenced namespace gets a `const @"<ns>" = @import("<ns>.zig");`
    // line emitted before the body.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "const @\"Windows.Foundation\" = @import(\"Windows.Foundation.zig\");",
    ) != null);

    // Qualified references appear in vtbl method signatures. Pick
    // `DateTime` (a `Windows.Foundation` value type) since it shows up
    // as a `*@"Windows.Foundation".DateTime` out-param in Calendar's
    // IClosable-adjacent methods.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "@\"Windows.Foundation\".DateTime",
    ) != null);

    // Same-namespace references (Calendar → Calendar) must stay
    // unqualified so we don't uselessly bloat every vtbl slot.
    try std.testing.expect(std.mem.indexOf(u8, out, "@\"Windows.Globalization\"") == null);

    // The import block must come before the first declaration.
    const import_idx = std.mem.indexOf(u8, out, "@import(\"Windows.Foundation.zig\")").?;
    if (std.mem.indexOf(u8, out, "pub const ")) |decl_idx| {
        try std.testing.expect(import_idx < decl_idx);
    }
}

test "emitNamespace Globalization references cross-ns IVectorView<HSTRING>" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Globalization", .x64);
    const out = buf.written();

    // Calendar's ICalendar interface has `get_Languages` which returns
    // IVectorView`1<HSTRING>. Phase 4b should emit a cross-namespace
    // qualified reference to the mangled instantiation in Collections.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "@\"Windows.Foundation.Collections\".IVectorView__G1__HSTRING",
    ) != null);

    // Collections must appear in the import aliases.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "@import(\"Windows.Foundation.Collections.zig\")",
    ) != null);
}

test "emitNamespace skips generic-arity typedefs (no backticks in output)" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Foundation contains `IAsyncOperation\`1`, `IReference\`1`,
    // etc. Their names contain a backtick which is not a legal Zig
    // identifier character, and instantiating WinRT generics is
    // deferred to a later phase — so emitted output must contain no
    // literal backticks anywhere.
    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Foundation", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.indexOfScalar(u8, out, '`') == null);

    // Spot check: non-generic declarations are still there.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const IID_IStringable") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const AsyncStatus") != null);
}

test "emitNamespace emits closed-generic instantiation for TypedEventHandler" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Foundation contains IMemoryBufferReference.add_Closed
    // whose param is TypedEventHandler`2<IMemoryBufferReference, object>.
    // This is the one same-namespace closed generic in the corpus.
    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Foundation", .x64);
    const out = buf.written();

    // The mangled instantiation vtbl + handle should be emitted.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const TypedEventHandler__G2__Windows_Foundation_IMemoryBufferReference__object_Vtbl = extern struct {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const TypedEventHandler__G2__Windows_Foundation_IMemoryBufferReference__object = extern struct {",
    ) != null);

    // No backticks in the output.
    try std.testing.expect(std.mem.indexOfScalar(u8, out, '`') == null);
}

test "emitNamespaceEx accepts external generic seeds" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Seed a cross-namespace instantiation: IVector`1<HSTRING> lives
    // in Foundation.Collections. Simulate a bundle driver routing this
    // from a consumer namespace.
    var seeds: GenericInstSet = .empty;
    try seeds.put(arena.allocator(), "IVector__G1__HSTRING", .{
        .namespace = "Windows.Foundation.Collections",
        .name = "IVector`1",
        .generics = &.{.string},
    });

    try emitNamespaceEx(
        &buf.writer,
        arena.allocator(),
        &file,
        "Windows.Foundation.Collections",
        .x64,
        &seeds,
    );
    const out = buf.written();

    // The seeded instantiation should produce a handle + vtbl.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const IVector__G1__HSTRING_Vtbl = extern struct {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const IVector__G1__HSTRING = extern struct {",
    ) != null);

    // Vtbl should have substituted method signatures (GetAt returns
    // HSTRING, not a VAR placeholder).
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "GetAt:",
    ) != null);
}

test "writeArgMangle handles class_name with namespace" {
    var buf_storage: [256]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf_storage);
    var aw: std.Io.Writer.Allocating = .init(fba.allocator());
    defer aw.deinit();

    try writeArgMangle(&aw.writer, .{ .class_name = .{
        .namespace = "Windows.Foundation",
        .name = "IMemoryBufferReference",
    } });
    try std.testing.expectEqualSlices(u8, "Windows_Foundation_IMemoryBufferReference", aw.written());
}

test "isMangleableArg accepts class_name and object" {
    try std.testing.expect(isMangleableArg(.object));
    try std.testing.expect(isMangleableArg(.{ .class_name = .{
        .namespace = "Windows.Foundation",
        .name = "Uri",
    } }));
    try std.testing.expect(isMangleableArg(.i32));
    try std.testing.expect(isMangleableArg(.string));
    // var_generic is not mangleable.
    try std.testing.expect(!isMangleableArg(.{ .var_generic = 0 }));
}

test "Phase 4c canary: Calendar.Languages → IVectorView<HSTRING> end-to-end" {
    // This test verifies the complete cross-namespace generic path:
    // 1. Globalization references IVectorView`1<HSTRING> from Collections
    // 2. Collections is seeded with IVectorView`1,string
    // 3. The seeded instantiation produces a typed GetAt method
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    // Step 1: Emit Collections with an HSTRING seed for IVectorView.
    var seeds: GenericInstSet = .empty;
    try seeds.put(arena.allocator(), "IVectorView__G1__HSTRING", .{
        .namespace = "Windows.Foundation.Collections",
        .name = "IVectorView`1",
        .generics = &.{.string},
    });

    var col_buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer col_buf.deinit();
    try emitNamespaceEx(
        &col_buf.writer,
        arena.allocator(),
        &file,
        "Windows.Foundation.Collections",
        .x64,
        &seeds,
    );
    const col_out = col_buf.written();

    // The seeded handle + vtbl must be present.
    try std.testing.expect(std.mem.indexOf(
        u8,
        col_out,
        "pub const IVectorView__G1__HSTRING_Vtbl = extern struct {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        col_out,
        "pub const IVectorView__G1__HSTRING = extern struct {",
    ) != null);

    // GetAt should reference HSTRING (substituted from VAR(0)).
    try std.testing.expect(std.mem.indexOf(
        u8,
        col_out,
        "GetAt:",
    ) != null);
    // The vtbl should have base: IInspectable_Vtbl (WinRT interface).
    try std.testing.expect(std.mem.indexOf(
        u8,
        col_out,
        "base: IInspectable_Vtbl",
    ) != null);

    // Step 2: Verify Globalization references the Collections type.
    var glob_buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer glob_buf.deinit();
    try emitNamespace(
        &glob_buf.writer,
        arena.allocator(),
        &file,
        "Windows.Globalization",
        .x64,
    );
    const glob_out = glob_buf.written();

    // get_Languages should reference the cross-ns mangled type.
    try std.testing.expect(std.mem.indexOf(
        u8,
        glob_out,
        "get_Languages:",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        glob_out,
        "@\"Windows.Foundation.Collections\".IVectorView__G1__HSTRING",
    ) != null);
}

test "emitInterfaceVtblsImpl deduplicates overloaded method names" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Globalization has ITimeZoneOnCalendar with overloaded
    // TimeZoneAsString (0-param and 1-param). The emitter should
    // suffix the duplicate as TimeZoneAsString_2.
    try emitInterfaceVtbls(&buf.writer, arena.allocator(), &file, "Windows.Globalization");
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "TimeZoneAsString:",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "@\"TimeZoneAsString_2\":",
    ) != null);

    // No backticks in the output.
    try std.testing.expect(std.mem.indexOfScalar(u8, out, '`') == null);
}

test "collectNamespaceClosure returns transitive deps for Globalization" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const closure = try collectNamespaceClosure(
        arena.allocator(),
        &file,
        &.{"Windows.Globalization"},
        .x64,
    );

    // Must include the root itself.
    var has_root = false;
    var has_foundation = false;
    var has_system = false;
    for (closure) |ns| {
        if (std.mem.eql(u8, ns, "Windows.Globalization")) has_root = true;
        if (std.mem.eql(u8, ns, "Windows.Foundation")) has_foundation = true;
        if (std.mem.eql(u8, ns, "Windows.System")) has_system = true;
    }
    try std.testing.expect(has_root);
    try std.testing.expect(has_foundation);
    try std.testing.expect(has_system);

    // All entries must be projectable Windows.* namespaces.
    for (closure) |ns| {
        try std.testing.expect(isProjectableNs(ns));
    }
}

test "emitFreeFunctions emits kernel32 exports for Windows.Win32.Foundation" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;
    try emitFreeFunctions(&buf.writer, arena.allocator(), &file, "Windows.Win32.Foundation", &cross, .x64);
    const out = buf.written();

    // CloseHandle(HANDLE) -> BOOL. HANDLE is a typedef over *mut c_void
    // in Win32 metadata, which the first-slice mapper renders as a
    // pointer; the exact spelling can shift as type support grows, so
    // anchor on the fixed framing instead.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub extern \"KERNEL32\" fn CloseHandle(",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "callconv(.winapi)") != null);

    // Every emitted line must use the extern / callconv framing —
    // there should never be a bare `fn ` outside `callconv(.winapi)`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub extern ") != null);
}

test "emitFreeFunctions uses @extern for renamed P/Invoke (RtlGenRandom)" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;
    try emitFreeFunctions(&buf.writer, arena.allocator(), &file, "Windows.Win32.Security.Authentication.Identity", &cross, .x64);
    const out = buf.written();

    // RtlGenRandom is exported from ADVAPI32 under the real name
    // "SystemFunction036" — a textbook rename that requires
    // `@extern(.., .{ .name = ..., .library_name = ... })`.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const RtlGenRandom: *const fn ") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "= @extern(*const fn ") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".name = \"SystemFunction036\"") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".library_name = \"ADVAPI32\"") != null);
}

test "emitMethodIndex emits a StaticStringMap entry for GetLastError" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitMethodIndex(&buf.writer, arena.allocator(), &file, "Windows.Win32.Foundation", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.startsWith(
        u8,
        out,
        "pub const MethodRecord = struct {\n",
    ));
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{\n",
    ) != null);

    // GetLastError lives in Windows.Win32.Foundation.Apis and is
    // exported from KERNEL32. The exact signature bytes depend on
    // the metadata snapshot, so the test only asserts the entry
    // exists with the expected library + import name.
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "\"GetLastError\", MethodRecord{ .library = \"KERNEL32\", .import = \"GetLastError\", .signature = \"",
    ) != null);

    // The sidecar `resolveTypeRef` switch must also be emitted and
    // include at least one entry (GetLastError's return type is
    // WIN32_ERROR, a VALUETYPE TypeRef).
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        "pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "=> TypeRefEntry{") != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        out,
        ".name = \"WIN32_ERROR\"",
    ) != null);
}

test "emitConstants emits primitive Win32 constants" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Win32.Storage.FileSystem is a dense source of
    // primitive integer constants (MAX_PATH, FILE_* flags, …).
    try emitConstants(&buf.writer, arena.allocator(), &file, "Windows.Win32.Storage.FileSystem");
    const out = buf.written();

    // At least one `pub const NAME: u32 = ...;` must appear — the
    // namespace has hundreds of u32 flag constants.
    try std.testing.expect(std.mem.indexOf(u8, out, ": u32 = ") != null);

    // Every emitted line must start with `pub const ` (no stray
    // output from unsupported field types).
    var it = std.mem.splitScalar(u8, out, '\n');
    while (it.next()) |line| {
        if (line.len == 0) continue;
        try std.testing.expect(std.mem.startsWith(u8, line, "pub const "));
    }
}

test "emitStructs suppresses HRESULT and BOOL in Windows.Win32.Foundation" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);
    _ = &file;

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var cross: CrossNsSet = .empty;

    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Win32.Foundation", .x64);
    _ = &cross;
    const out = buf.written();

    // Prelude aliases must NOT be re-emitted from metadata as
    // `pub const HRESULT = extern struct ...`; they resolve through
    // `win_core` via the prelude aliases written by emitNamespace.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HRESULT = extern struct") == null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const BOOL = extern struct") == null);
}

test "emitNamespace produces a self-consistent body for Windows.Win32.Foundation" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitNamespace(&buf.writer, arena.allocator(), &file, "Windows.Win32.Foundation", .x64);
    const out = buf.written();

    // Prelude must appear exactly once.
    try std.testing.expect(std.mem.indexOf(u8, out, "const win_core = @import(\"win-core\");") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const HRESULT = win_core.HRESULT;") != null);

    // No duplicate HRESULT/BOOL emitted from metadata.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HRESULT = extern struct") == null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const BOOL = extern struct") == null);

    // A well-known direct P/Invoke from this namespace.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub extern \"KERNEL32\" fn CloseHandle(") != null);
}

test "emitGuidConstants emits CLSID/FMTID fields for a Win32 namespace" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitGuidConstants(&buf.writer, arena.allocator(), &file, "Windows.Win32.System.Com");
    const out = buf.written();

    // Every emitted line should start with `pub const ` and carry the
    // `GUID` type annotation so downstream compilation is well-formed.
    try std.testing.expect(out.len > 0);
    try std.testing.expect(std.mem.indexOf(u8, out, ": GUID = .{") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".data1 = 0x") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, ".data4 = .{") != null);

    // Every line must start with "pub const " (emission framing).
    var it = std.mem.splitScalar(u8, out, '\n');
    while (it.next()) |line| {
        if (line.len == 0) continue;
        if (std.mem.startsWith(u8, line, "pub const ")) continue;
        // Continuation lines of the multi-line initializer start with
        // four spaces.
        if (std.mem.startsWith(u8, line, "    .")) continue;
        if (std.mem.eql(u8, line, "};")) continue;
        // Anything else is unexpected.
        std.debug.print("unexpected line: {s}\n", .{line});
        try std.testing.expect(false);
    }
}

test "emitConstants emits Win32 f32 constants (D3D11_DEFAULT_BLEND_FACTOR_ALPHA)" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitConstants(&buf.writer, arena.allocator(), &file, "Windows.Win32.Graphics.Direct3D11");
    const out = buf.written();

    // D3D11_DEFAULT_BLEND_FACTOR_{R,G,B,A} are f32 literals = 1.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const D3D11_DEFAULT_BLEND_FACTOR_ALPHA: f32 = 1") != null);
}

test "emitConstants emits Win32 PCWSTR string constants (SERVICES_ACTIVE_DATABASE)" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitConstants(&buf.writer, arena.allocator(), &file, "Windows.Win32.System.Services");
    const out = buf.written();

    // SERVICES_ACTIVE_DATABASE is "ServicesActive" as UTF-16 (PCWSTR).
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const SERVICES_ACTIVE_DATABASE: [:0]const u16 = win_core.utf16Lit(\"ServicesActive\");") != null);
}

test "emitConstants emits Win32 HRESULT/NTSTATUS typed integer constants" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitConstants(&buf.writer, arena.allocator(), &file, "Windows.Win32.Foundation");
    const out = buf.written();

    // S_OK: HRESULT = 0 (prelude alias → direct int-literal assign).
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const S_OK: HRESULT = 0;") != null);
    // E_FAIL = 0x80004005 sign-extends to -2147467259 (i32).
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const E_FAIL: HRESULT = -2147467259;") != null);
    // TRUE/FALSE as BOOL.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const TRUE: BOOL = 1;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const FALSE: BOOL = 0;") != null);
    // STATUS_SUCCESS as NTSTATUS.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const STATUS_SUCCESS: NTSTATUS = 0;") != null);
}

test "emitStructs emits Win32 ExplicitLayout TypeDefs as extern union" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Windows.Win32.Storage.FileSystem contains FILE_SEGMENT_ELEMENT —
    // a simple 2-field C union (Buffer/Alignment). ExplicitLayout in
    // Win32 metadata always means a C union; windows-bindgen uses the
    // same convention.
    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Win32.Storage.FileSystem", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(u8, out, "pub const FILE_SEGMENT_ELEMENT = extern union") != null);
    // And at least one normal struct still emits as `extern struct`.
    try std.testing.expect(std.mem.indexOf(u8, out, "extern struct") != null);
}

test "emitStructs emits SYSTEM_INFO with usize and *anyopaque" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // SYSTEM_INFO exercises two projection codepaths that were
    // previously blocking `emitStructs`:
    //   * `dwActiveProcessorMask: DWORD_PTR` → ELEMENT_TYPE_U → `usize`
    //   * `lpMinimumApplicationAddress: LPVOID` → `PTR(VOID)` → `*anyopaque`
    // Both were rejected by `canRepresent`/`writeZigTy` in earlier
    // drafts, causing SYSTEM_INFO to silently drop out of the output
    // even though it's referenced by GetSystemInfo/GetNativeSystemInfo.
    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Win32.System.SystemInformation", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(u8, out, "pub const SYSTEM_INFO = extern struct") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "dwActiveProcessorMask: usize,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "lpMinimumApplicationAddress: *anyopaque,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "lpMaximumApplicationAddress: *anyopaque,") != null);
}

test "emitStructs emits WIN32_FIND_DATAW with fixed-size u16 arrays" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // WIN32_FIND_DATAW has two ELEMENT_TYPE_ARRAY fields — `cFileName`
    // ([260]WCHAR) and `cAlternateFileName` ([14]WCHAR) — which were
    // previously rejected by `canRepresent` and caused the entire
    // struct to be dropped from the generator output. `tyToZigType`
    // in hand-written `project.zig` projects WCHAR as `u16`, and the
    // generator matches that.
    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Win32.Storage.FileSystem", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(u8, out, "pub const WIN32_FIND_DATAW = extern struct") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "cFileName: [260]u16,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "cAlternateFileName: [14]u16,") != null);
}

test "collectStructsClosure walks cross-namespace TypeRef graph" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    // `Windows.Win32.Storage.FileSystem` pulls in `Foundation`
    // (HANDLE, FILETIME, etc.) and `Security` (SECURITY_ATTRIBUTES)
    // through TypeRefs in struct bodies. The closure must surface
    // both without the caller hand-listing them.
    const closure = try collectStructsClosure(
        arena.allocator(),
        &file,
        "Windows.Win32.Storage.FileSystem",
        .x64,
    );

    var saw_self = false;
    var saw_foundation = false;
    var saw_security = false;
    for (closure) |ns| {
        if (std.mem.eql(u8, ns, "Windows.Win32.Storage.FileSystem")) saw_self = true;
        if (std.mem.eql(u8, ns, "Windows.Win32.Foundation")) saw_foundation = true;
        if (std.mem.eql(u8, ns, "Windows.Win32.Security")) saw_security = true;
    }
    try std.testing.expect(saw_self);
    try std.testing.expect(saw_foundation);
    try std.testing.expect(saw_security);

    // Closure is sorted and de-duplicated.
    var i: usize = 1;
    while (i < closure.len) : (i += 1) {
        try std.testing.expect(std.mem.lessThan(u8, closure[i - 1], closure[i]));
    }
}

test "emitMethodIndex emits aliases block for enum TypeDefs" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    try emitMethodIndex(
        &buf.writer,
        arena.allocator(),
        &file,
        "Windows.Win32.Foundation",
        .x64,
    );
    const out = buf.written();

    // Foundation hosts WIN32_ERROR, WAIT_EVENT, HANDLE_FLAGS, and
    // a handful of other System.Enum-extending TypeDefs. They
    // must all land in the emitted `aliases = struct { … };` block
    // so `project.zig` can look them up by TypeRef name without a
    // hand-maintained switch.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const aliases = struct {") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const WIN32_ERROR = u32;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const WAIT_EVENT = u32;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HANDLE_FLAGS = u32;") != null);
    // BOOL, HRESULT, NTSTATUS are NativeTypedefAttribute wrappers
    // around a single `i32` field — they land in the same aliases
    // block via the second pass.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const BOOL = i32;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HRESULT = i32;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const NTSTATUS = i32;") != null);
    // HANDLE and friends wrap a `*void` field (Win32 convention);
    // the "Value"-heuristic path picks them up and projects them
    // as null-able anyopaque pointers.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HANDLE = ?*anyopaque;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const HMODULE = ?*anyopaque;") != null);
    // PWSTR wraps `*u16`; projects to a null-terminated many-item
    // pointer at the alias boundary.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const PWSTR = ?[*:0]u16;") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const PSTR = ?[*:0]u8;") != null);
}

test "emitStructs renames MIDL anon nested types to <outer>_<index>" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // SYSTEM_INFO has a `_Anonymous_e__Union` which itself contains a
    // `_Anonymous_e__Struct`. The raw MIDL mangled names are stable
    // but ugly and, worse, can collide when one parent has several
    // anon children. `windows-bindgen` renames them to
    // `<outer>_<index>` (`SYSTEM_INFO_0`, `SYSTEM_INFO_0_0`) so
    // consumers can switch between the Rust and Zig projections
    // without renaming every field access. We follow the same rule.
    try emitStructs(&buf.writer, arena.allocator(), &file, "Windows.Win32.System.SystemInformation", .x64);
    const out = buf.written();

    // The outer union is renamed, and the struct inside the union is
    // renamed relative to its own (already-renamed) parent. Both the
    // declaration and the field-type reference must use the new name.
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const SYSTEM_INFO_0 = extern union") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const SYSTEM_INFO_0_0 = extern struct") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "Anonymous: SYSTEM_INFO_0,") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "Anonymous: SYSTEM_INFO_0_0,") != null);
    // The raw MIDL names must not leak through.
    try std.testing.expect(std.mem.indexOf(u8, out, "_Anonymous_e__Union") == null);
    try std.testing.expect(std.mem.indexOf(u8, out, "_Anonymous_e__Struct") == null);
}

test "emitStructsFile produces a self-contained sidecar" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    // Storage.FileSystem pulls in FILETIME from Foundation through
    // `WIN32_FIND_DATAW`, so the sidecar header must import the
    // Foundation structs sibling. The `win-core` aliases show up
    // unconditionally because they're cheap and keep the header
    // predictable.
    try emitStructsFile(&buf.writer, arena.allocator(), &file, "Windows.Win32.Storage.FileSystem", .x64);
    const out = buf.written();

    try std.testing.expect(std.mem.indexOf(u8, out, "const win_core = @import(\"win-core\");") != null);
    try std.testing.expect(std.mem.indexOf(u8, out, "const GUID = win_core.GUID;") != null);
    try std.testing.expect(
        std.mem.indexOf(
            u8,
            out,
            "const @\"Windows.Win32.Foundation\" = @import(\"Windows.Win32.Foundation.structs.zig\");",
        ) != null,
    );
    try std.testing.expect(std.mem.indexOf(u8, out, "pub const WIN32_FIND_DATAW = extern struct") != null);
    try std.testing.expect(
        std.mem.indexOf(u8, out, "ftCreationTime: @\"Windows.Win32.Foundation\".FILETIME,") != null,
    );
}

test "emitNamespace succeeds on every Windows.Wdk namespace" {
    const bytes = @embedFile("Windows.Wdk.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    // Collect distinct namespaces.
    var seen = std.StringArrayHashMapUnmanaged(void).empty;
    defer seen.deinit(std.testing.allocator);

    const n = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < n) : (row += 1) {
        const ns = file.str(.type_def, row, 2);
        if (ns.len == 0) continue;
        try seen.put(std.testing.allocator, ns, {});
    }

    // Every namespace must emit without panic. At least one namespace
    // must produce a non-empty body so we know the Wdk pipeline is
    // actually wired up (not silently skipped).
    var any_non_empty = false;
    var it = seen.iterator();
    while (it.next()) |e| {
        var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
        defer buf.deinit();

        try emitNamespace(&buf.writer, arena.allocator(), &file, e.key_ptr.*, .x64);
        if (buf.written().len > 0) any_non_empty = true;
    }
    try std.testing.expect(any_non_empty);
}

test "collectImports groups Win32 MethodDefs by DLL" {
    const bytes = @embedFile("Windows.Win32.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const groups = try collectImports(arena.allocator(), &file);

    // Win32 has hundreds of distinct DLLs; anything less than a few
    // dozen means the scan is broken. Also verify outer ordering is
    // case-insensitive ascending.
    try std.testing.expect(groups.len > 50);
    var prev: []const u8 = "";
    for (groups) |g| {
        try std.testing.expect(g.imports.len > 0);
        if (prev.len != 0) {
            try std.testing.expect(!std.ascii.lessThanIgnoreCase(g.dll, prev));
        }
        prev = g.dll;
    }

    // kernel32 must carry at least the usual suspects.
    var k32: ?DllImports = null;
    for (groups) |g| if (std.ascii.eqlIgnoreCase(g.dll, "KERNEL32.dll")) {
        k32 = g;
        break;
    };
    try std.testing.expect(k32 != null);
    var has_create_file_w = false;
    var has_close_handle = false;
    for (k32.?.imports) |n| {
        if (std.mem.eql(u8, n, "CreateFileW")) has_create_file_w = true;
        if (std.mem.eql(u8, n, "CloseHandle")) has_close_handle = true;
    }
    try std.testing.expect(has_create_file_w);
    try std.testing.expect(has_close_handle);
}

test "emitDef writes LIBRARY/EXPORTS with ordinal rewrite" {
    var buf: std.Io.Writer.Allocating = .init(std.testing.allocator);
    defer buf.deinit();

    var imports_buf = [_][]const u8{ "CloseHandle", "CreateFileW", "#42" };
    try emitDef(&buf.writer, .{ .dll = "kernel32.dll", .imports = &imports_buf });

    const expected =
        \\LIBRARY kernel32.dll
        \\EXPORTS
        \\    CloseHandle
        \\    CreateFileW
        \\    @42
        \\
    ;
    try std.testing.expectEqualStrings(expected, buf.written());
}

test "discoverCrossNsGenerics finds Calendar.Languages → IVectorView`1<HSTRING>" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var pending: PendingGenericMap = .empty;
    try discoverCrossNsGenerics(
        &pending,
        arena.allocator(),
        &file,
        "Windows.Globalization",
    );

    // Windows.Globalization.Calendar.Languages returns
    // IVectorView`1<HSTRING>, whose open def lives in
    // Windows.Foundation.Collections. Phase 4b discovery must route
    // this into pending["Windows.Foundation.Collections"].
    const collections_insts = pending.get("Windows.Foundation.Collections") orelse {
        std.debug.print("expected pending entry for Windows.Foundation.Collections, got keys: ", .{});
        for (pending.keys()) |k| std.debug.print("{s}, ", .{k});
        std.debug.print("\n", .{});
        return error.NoCollectionsSeed;
    };

    try std.testing.expect(collections_insts.contains("IVectorView__G1__HSTRING"));
}

test "discoverCrossNsGenerics ignores same-namespace closed generics" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var pending: PendingGenericMap = .empty;
    try discoverCrossNsGenerics(
        &pending,
        arena.allocator(),
        &file,
        "Windows.Foundation",
    );

    // The well-known TypedEventHandler`2<IMemoryBufferReference, object>
    // instantiation is same-namespace (Windows.Foundation → Windows.Foundation),
    // so it must NOT appear in the cross-ns pending map under
    // "Windows.Foundation".
    if (pending.get("Windows.Foundation")) |_| {
        return error.SameNamespaceLeakedIntoPending;
    }
}

test "emitBundle auto-routes IVectorView<HSTRING> to Foundation.Collections" {
    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const namespaces = [_][]const u8{
        "Windows.Foundation",
        "Windows.Foundation.Collections",
        "Windows.Globalization",
    };

    var out = try emitBundle(arena.allocator(), &file, &namespaces, .x64);

    // Every input namespace must produce an emission entry.
    for (namespaces) |ns| {
        try std.testing.expect(out.contains(ns));
    }

    // Foundation.Collections must carry the seeded IVectorView`1<HSTRING>
    // closed-generic pair because Globalization's Calendar.Languages
    // returns it.
    const collections = out.get("Windows.Foundation.Collections").?;
    try std.testing.expect(std.mem.indexOf(
        u8,
        collections,
        "pub const IVectorView__G1__HSTRING = extern struct {",
    ) != null);
    try std.testing.expect(std.mem.indexOf(
        u8,
        collections,
        "pub const IVectorView__G1__HSTRING_Vtbl = extern struct {",
    ) != null);
}
