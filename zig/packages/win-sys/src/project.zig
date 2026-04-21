//! Comptime `project()` — materializes Win32 extern function
//! pointers from a filter of `(namespace, method_name)` pairs.
//!
//! Pipeline:
//!
//!   filter → index.<ns>.method_def_by_name.get(name) → MethodRecord
//!            ↓
//!         sig.decode(record.signature) → Sig
//!            ↓
//!         map each Ty to a Zig type (primitives inline,
//!         value_ref/class_ref through index.<ns>.resolveTypeRef
//!         + alias table)
//!            ↓
//!         @Type(.{ .@"fn" = ... }) → *const FnType
//!            ↓
//!         @extern(FnPtr, .{ .name, .library_name })
//!
//! The returned type is a `struct` with one function-pointer
//! *field* per requested method. Consumers call
//!
//!     const win = win_sys.project(.{
//!         .@"Windows.Win32.Foundation" = .{ "GetLastError" },
//!     });
//!     const e = win.GetLastError();
//!
//! Struct fields are used instead of decls because `@Type` cannot
//! synthesize `extern` declarations dynamically in Zig 0.16 — but
//! it can synthesize a struct whose fields are function-pointer
//! types, which we initialize via `@extern` in the `project()`
//! factory. Functionally equivalent to calling an extern fn;
//! the cost is an extra indirection.

const std = @import("std");
const sig_mod = @import("sig.zig");

const index = struct {
    pub const @"Windows.Win32.Foundation" =
        @import("generated/Windows.Win32.Foundation.index.zig");
    pub const @"Windows.Win32.System.LibraryLoader" =
        @import("generated/Windows.Win32.System.LibraryLoader.index.zig");
    pub const @"Windows.Win32.System.Threading" =
        @import("generated/Windows.Win32.System.Threading.index.zig");
};

/// Alias table for well-known `Windows.Win32.Foundation` TypeRefs.
/// Values are ZST markers; the actual Zig type comes from
/// `fnTypeForAlias`. This keeps the alias list in one place and
/// compile-checks every name at comptime.
fn fnTypeForAlias(comptime name: []const u8) ?type {
    // Handles are all pointer-sized opaque values. Flag/error
    // enums are u32. HRESULT/NTSTATUS are signed 32-bit status
    // codes. String types are null-terminated pointers.
    if (std.mem.eql(u8, name, "BOOL")) return i32;
    if (std.mem.eql(u8, name, "HRESULT")) return i32;
    if (std.mem.eql(u8, name, "NTSTATUS")) return i32;
    if (std.mem.eql(u8, name, "WIN32_ERROR")) return u32;
    if (std.mem.eql(u8, name, "DUPLICATE_HANDLE_OPTIONS")) return u32;
    if (std.mem.eql(u8, name, "HANDLE_FLAGS")) return u32;
    if (std.mem.eql(u8, name, "LOAD_LIBRARY_FLAGS")) return u32;
    if (std.mem.eql(u8, name, "HANDLE")) return isize;
    if (std.mem.eql(u8, name, "HMODULE")) return isize;
    if (std.mem.eql(u8, name, "HGLOBAL")) return isize;
    if (std.mem.eql(u8, name, "HLOCAL")) return isize;
    if (std.mem.eql(u8, name, "HRSRC")) return isize;
    if (std.mem.eql(u8, name, "BSTR")) return ?[*:0]u16;
    if (std.mem.eql(u8, name, "PWSTR")) return ?[*:0]u16;
    if (std.mem.eql(u8, name, "PSTR")) return ?[*:0]u8;
    // FARPROC and friends are raw function pointers; project()
    // surfaces them as opaque so callers @ptrCast to the concrete
    // signature they need (GetProcAddress's whole point).
    if (std.mem.eql(u8, name, "FARPROC")) return ?*const anyopaque;
    return null;
}

/// Map a decoded `Ty` to a Zig type. `NamespaceIndex` must expose
/// a `resolveTypeRef(u32) ?TypeRefEntry` function (all generated
/// index files do).
fn tyToZigType(
    comptime NamespaceIndex: type,
    comptime method_name: []const u8,
    comptime t: sig_mod.Ty,
) type {
    const base: type = switch (t.kind) {
        .void => void,
        .bool => bool,
        .i8 => i8,
        .u8 => u8,
        .i16 => i16,
        .u16 => u16,
        .i32 => i32,
        .u32 => u32,
        .i64 => i64,
        .u64 => u64,
        .f32 => f32,
        .f64 => f64,
        .isize => isize,
        .usize => usize,
        .char => u16, // §II.23.1.16 CHAR is a 16-bit UTF-16 code unit.
        .value_ref, .class_ref => blk: {
            const resolved = NamespaceIndex.resolveTypeRef(t.coded_index) orelse
                @compileError("project: unresolved TypeRef in " ++ method_name ++
                    " (coded index missing from resolveTypeRef table)");
            const aliased = fnTypeForAlias(resolved.name) orelse
                @compileError("project: no alias for TypeRef " ++
                    resolved.namespace ++ "." ++ resolved.name ++
                    " (referenced by " ++ method_name ++ ")");
            break :blk aliased;
        },
        .unsupported => @compileError("project: unsupported signature element in " ++ method_name),
    };

    var ty: type = base;
    var depth: u8 = 0;
    while (depth < t.ptrs) : (depth += 1) {
        // Win32 pointers in method signatures are C-style: may be
        // null, addressable element count unknown → `?*` (or
        // `?[*]` for explicitly array-shaped uses, but we can't
        // distinguish at this level). `?*T` round-trips through
        // the C ABI as a plain pointer.
        ty = ?*ty;
    }
    return ty;
}

fn fnTypeFor(
    comptime NamespaceIndex: type,
    comptime method_name: []const u8,
    comptime s: sig_mod.Sig,
) type {
    // ECMA-335 §II.23.2.1 HASTHIS on a P/Invoke method is
    // nonsensical — Win32 DLL exports are free functions. Error
    // rather than silently dropping the `this` slot.
    if (s.has_this) @compileError("project: HASTHIS unexpected on Win32 free function " ++ method_name);

    comptime var param_types: [sig_mod.MAX_PARAMS]type = undefined;
    comptime var param_attrs: [sig_mod.MAX_PARAMS]std.builtin.Type.Fn.Param.Attributes = undefined;
    comptime var i: usize = 0;
    inline while (i < s.param_count) : (i += 1) {
        param_types[i] = tyToZigType(NamespaceIndex, method_name, s.params_buf[i]);
        param_attrs[i] = .{};
    }

    const RetT = tyToZigType(NamespaceIndex, method_name, s.return_type);

    return @Fn(
        param_types[0..s.param_count],
        param_attrs[0..s.param_count],
        RetT,
        .{ .@"callconv" = .winapi },
    );
}

fn namespaceIndex(comptime ns: []const u8) type {
    return @field(index, ns);
}

/// Build the container struct type from the filter. One field per
/// requested method, typed `*const FnType` where FnType is
/// reconstructed from the method's signature blob.
fn ProjectType(comptime filter: anytype) type {
    const Filter = @TypeOf(filter);
    comptime var total: usize = 0;
    inline for (@typeInfo(Filter).@"struct".fields) |nsf| {
        const names = @field(filter, nsf.name);
        inline for (@typeInfo(@TypeOf(names)).@"struct".fields) |_| total += 1;
    }

    comptime var names_buf: [64][:0]const u8 = undefined;
    comptime var types_buf: [64]type = undefined;
    comptime var attrs_buf: [64]std.builtin.Type.StructField.Attributes = undefined;
    if (total > names_buf.len) @compileError("project: too many methods in filter (>64)");

    comptime var idx: usize = 0;
    inline for (@typeInfo(Filter).@"struct".fields) |nsf| {
        const NsIdx = namespaceIndex(nsf.name);
        const names = @field(filter, nsf.name);
        inline for (@typeInfo(@TypeOf(names)).@"struct".fields) |namef| {
            const name: []const u8 = @field(names, namef.name);
            const rec = NsIdx.method_def_by_name.get(name) orelse
                @compileError("project: method not found in " ++ nsf.name ++ ": " ++ name);
            const s = sig_mod.decode(rec.signature) catch
                @compileError("project: signature decode failed for " ++ name);
            const FnT = fnTypeFor(NsIdx, name, s);
            const FnPtr = *const FnT;
            names_buf[idx] = name ++ "";
            types_buf[idx] = FnPtr;
            attrs_buf[idx] = .{};
            idx += 1;
        }
    }

    return @Struct(
        .auto,
        null,
        names_buf[0..total],
        types_buf[0..total],
        attrs_buf[0..total],
    );
}

/// Factory — pass a struct filter mapping namespace to a tuple of
/// method names. Returns a populated struct value whose fields
/// are the projected extern function pointers.
pub fn project(comptime filter: anytype) ProjectType(filter) {
    const T = ProjectType(filter);
    var out: T = undefined;
    inline for (@typeInfo(@TypeOf(filter)).@"struct".fields) |nsf| {
        const NsIdx = namespaceIndex(nsf.name);
        const names = @field(filter, nsf.name);
        inline for (@typeInfo(@TypeOf(names)).@"struct".fields) |namef| {
            const name: []const u8 = @field(names, namef.name);
            const rec = comptime NsIdx.method_def_by_name.get(name).?;
            const FnPtr = @FieldType(T, name);
            @field(out, name) = @extern(FnPtr, .{
                .name = rec.import,
                .library_name = rec.library,
            });
        }
    }
    return out;
}

// ---- Tests --------------------------------------------------------------

test "project: Foundation { GetLastError, SetLastError } type-checks" {
    const win = project(.{
        .@"Windows.Win32.Foundation" = .{ "GetLastError", "SetLastError" },
    });

    // Field types must match the decoded signatures. GetLastError
    // takes no params and returns WIN32_ERROR (u32 via alias).
    const GetLastErrorT = @TypeOf(win.GetLastError);
    try std.testing.expectEqual(@as(type, *const fn () callconv(.winapi) u32), GetLastErrorT);

    // SetLastError takes a WIN32_ERROR and returns void.
    const SetLastErrorT = @TypeOf(win.SetLastError);
    try std.testing.expectEqual(@as(type, *const fn (u32) callconv(.winapi) void), SetLastErrorT);
}

test "project: Foundation { SysAllocString } returns BSTR" {
    const win = project(.{
        .@"Windows.Win32.Foundation" = .{"SysAllocString"},
    });

    // SysAllocString(PCWSTR) -> BSTR. PCWSTR is itself a VALUETYPE
    // in Foundation, mapping to ?[*:0]u16 via the alias table.
    // BSTR also maps to ?[*:0]u16.
    const T = @TypeOf(win.SysAllocString);
    const info = @typeInfo(T).pointer.child;
    const fn_info = @typeInfo(info).@"fn";
    try std.testing.expectEqual(@as(u32, 1), fn_info.params.len);
    try std.testing.expectEqual(@as(?type, ?[*:0]u16), fn_info.return_type);
}

test "project: LibraryLoader { GetModuleHandleW, GetProcAddress, LoadLibraryW } type-checks" {
    // Cross-namespace projection: all three functions live in
    // System.LibraryLoader but take Foundation handles (HMODULE,
    // PWSTR, PSTR, BOOL) — resolved through LibraryLoader's own
    // resolveTypeRef table + the shared alias table.
    const win = project(.{
        .@"Windows.Win32.System.LibraryLoader" = .{
            "GetModuleHandleW",
            "GetProcAddress",
            "LoadLibraryW",
        },
    });

    // GetModuleHandleW(PCWSTR) -> HMODULE
    const GetModuleHandleWT = @TypeOf(win.GetModuleHandleW);
    try std.testing.expectEqual(
        @as(type, *const fn (?[*:0]u16) callconv(.winapi) isize),
        GetModuleHandleWT,
    );

    // GetProcAddress(HMODULE, PCSTR) -> FARPROC (opaque fn ptr)
    const GetProcAddressT = @TypeOf(win.GetProcAddress);
    try std.testing.expectEqual(
        @as(type, *const fn (isize, ?[*:0]u8) callconv(.winapi) ?*const anyopaque),
        GetProcAddressT,
    );

    // LoadLibraryW(PCWSTR) -> HMODULE
    const LoadLibraryWT = @TypeOf(win.LoadLibraryW);
    try std.testing.expectEqual(
        @as(type, *const fn (?[*:0]u16) callconv(.winapi) isize),
        LoadLibraryWT,
    );
}

test "project: Threading { GetCurrentThreadId, Sleep } type-checks" {
    // Windows.Win32.System.Threading is the third namespace wired
    // through the comptime projection pipeline. These two APIs
    // exercise the simplest signature shapes:
    //   - GetCurrentThreadId(): u32            → 0 params, primitive return
    //   - Sleep(u32): void                     → 1 u32 param, void return
    // No TypeRefs involved, so this validates the primitive path
    // for a fresh namespace without depending on the alias table.
    const win = project(.{
        .@"Windows.Win32.System.Threading" = .{ "GetCurrentThreadId", "Sleep" },
    });

    try std.testing.expectEqual(
        @as(type, *const fn () callconv(.winapi) u32),
        @TypeOf(win.GetCurrentThreadId),
    );
    try std.testing.expectEqual(
        @as(type, *const fn (u32) callconv(.winapi) void),
        @TypeOf(win.Sleep),
    );
}
