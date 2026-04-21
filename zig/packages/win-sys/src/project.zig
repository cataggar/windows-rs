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

/// Generated per-namespace index modules. Exposed publicly so
/// samples and downstream code can reference primitive integer
/// constants emitted alongside the method table — e.g.
/// `win_sys.index.@"Windows.Win32.Storage.FileSystem".GENERIC_WRITE`.
pub const index = struct {
    pub const @"Windows.Win32.Foundation" =
        @import("generated/Windows.Win32.Foundation.index.zig");
    pub const @"Windows.Win32.System.LibraryLoader" =
        @import("generated/Windows.Win32.System.LibraryLoader.index.zig");
    pub const @"Windows.Win32.System.Threading" =
        @import("generated/Windows.Win32.System.Threading.index.zig");
    pub const @"Windows.Win32.System.Console" =
        @import("generated/Windows.Win32.System.Console.index.zig");
    pub const @"Windows.Win32.UI.WindowsAndMessaging" =
        @import("generated/Windows.Win32.UI.WindowsAndMessaging.index.zig");
    pub const @"Windows.Win32.Storage.FileSystem" =
        @import("generated/Windows.Win32.Storage.FileSystem.index.zig");
    pub const @"Windows.Win32.System.Memory" =
        @import("generated/Windows.Win32.System.Memory.index.zig");
    pub const @"Windows.Win32.System.SystemInformation" =
        @import("generated/Windows.Win32.System.SystemInformation.index.zig");
    pub const @"Windows.Win32.Security" =
        @import("generated/Windows.Win32.Security.index.zig");
    pub const @"Windows.Win32.System.Diagnostics.Debug" =
        @import("generated/Windows.Win32.System.Diagnostics.Debug.index.zig");
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
    if (std.mem.eql(u8, name, "WAIT_EVENT")) return u32;
    if (std.mem.eql(u8, name, "STD_HANDLE")) return u32;
    if (std.mem.eql(u8, name, "CONSOLE_MODE")) return u32;
    if (std.mem.eql(u8, name, "MESSAGEBOX_STYLE")) return u32;
    if (std.mem.eql(u8, name, "MESSAGEBOX_RESULT")) return i32;
    if (std.mem.eql(u8, name, "FILE_SHARE_MODE")) return u32;
    if (std.mem.eql(u8, name, "FILE_CREATION_DISPOSITION")) return u32;
    if (std.mem.eql(u8, name, "FILE_FLAGS_AND_ATTRIBUTES")) return u32;
    if (std.mem.eql(u8, name, "HEAP_FLAGS")) return u32;
    if (std.mem.eql(u8, name, "VIRTUAL_ALLOCATION_TYPE")) return u32;
    if (std.mem.eql(u8, name, "VIRTUAL_FREE_TYPE")) return u32;
    if (std.mem.eql(u8, name, "PAGE_PROTECTION_FLAGS")) return u32;
    // Security namespace — WELL_KNOWN_SID_TYPE is a C-style enum
    // (first member `value__: i32`), and PSID is a raw opaque
    // pointer (`*mut c_void` in windows-rs). Callers pass buffers
    // or previously-returned handles; we don't inspect fields.
    if (std.mem.eql(u8, name, "WELL_KNOWN_SID_TYPE")) return i32;
    if (std.mem.eql(u8, name, "PSID")) return ?*anyopaque;
    // TOKEN_ACCESS_MASK is a flags enum (TOKEN_QUERY, TOKEN_ADJUST_*,
    // etc.) backed by DWORD. TOKEN_INFORMATION_CLASS is a C enum
    // selector for GetTokenInformation (TokenElevation = 20, etc.).
    if (std.mem.eql(u8, name, "TOKEN_ACCESS_MASK")) return u32;
    if (std.mem.eql(u8, name, "TOKEN_INFORMATION_CLASS")) return i32;
    if (std.mem.eql(u8, name, "HANDLE")) return isize;
    if (std.mem.eql(u8, name, "HWND")) return isize;
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

    // Struct TypeRefs that win-sys treats as opaque: callers pass
    // pointers (usually null) rather than filling fields in. The
    // high-level `win` layer will wrap these with proper structs
    // when a call actually needs to populate them.
    //
    // SECURITY_ATTRIBUTES is the canonical example — almost every
    // handle-creating Win32 API takes `LPSECURITY_ATTRIBUTES` as a
    // "pass null for default" parameter. Keeping it opaque lets
    // CreateEventW/CreateMutex/etc. project without pulling in the
    // whole Security namespace's struct layouts.
    if (std.mem.eql(u8, name, "SECURITY_ATTRIBUTES")) return anyopaque;
    // OVERLAPPED is the async-I/O control block used by ReadFile/
    // WriteFile. Synchronous callers pass null; async callers will
    // eventually want the real struct, but keep opaque at the sys
    // layer until the I/O namespace is actually wired.
    if (std.mem.eql(u8, name, "OVERLAPPED")) return anyopaque;

    // Concrete Win32 structs that callers need to *read* field-wise.
    // Unlike the opaque aliases above, these expose their layout so
    // samples can access e.g. cFileName without @ptrCast gymnastics.
    //
    // The generator will eventually emit these from winmd TypeDef
    // Field tables; for now, handcraft them here as the first test
    // of the pattern. Layouts are `extern struct` to guarantee C
    // ABI compat — Zig is free to reorder plain structs but extern
    // is fixed field order, no padding insertions beyond C rules.
    if (std.mem.eql(u8, name, "FILETIME")) return structs.FILETIME;
    if (std.mem.eql(u8, name, "WIN32_FIND_DATAW")) return structs.WIN32_FIND_DATAW;
    // SYSTEM_INFO has an anonymous union (`Anonymous: SYSTEM_INFO_0`)
    // at offset 0 — the winmd encodes this as a NestedType reference
    // `SYSTEM_INFO_0 → SYSTEM_INFO`. For now, match the top-level
    // struct by its canonical name; the inner union and `_0_0` struct
    // are only referenced *from inside* SYSTEM_INFO's layout, so they
    // never surface through an API signature and don't need aliases.
    if (std.mem.eql(u8, name, "SYSTEM_INFO")) return structs.SYSTEM_INFO;
    return null;
}

/// Concrete struct projections. Public so callers can name the
/// types in their own declarations (e.g. `var fd: win_sys.structs
/// .WIN32_FIND_DATAW = undefined;`). Field names mirror the Win32
/// headers verbatim for grep-ability.
pub const structs = struct {
    /// §winbase.h. 64-bit FILETIME split as two u32s because the
    /// struct predates native 64-bit alignment on x86.
    pub const FILETIME = extern struct {
        dwLowDateTime: u32,
        dwHighDateTime: u32,
    };

    /// §minwinbase.h. Out-param of FindFirstFileW / FindNextFileW.
    /// cFileName has room for MAX_PATH (260) wide chars including
    /// NUL. cAlternateFileName is the 8.3 short name (14 wide
    /// chars). The struct is 592 bytes — verify with @sizeOf at
    /// call sites if tightly-coupled code depends on layout.
    pub const WIN32_FIND_DATAW = extern struct {
        dwFileAttributes: u32,
        ftCreationTime: FILETIME,
        ftLastAccessTime: FILETIME,
        ftLastWriteTime: FILETIME,
        nFileSizeHigh: u32,
        nFileSizeLow: u32,
        dwReserved0: u32,
        dwReserved1: u32,
        cFileName: [260]u16,
        cAlternateFileName: [14]u16,
    };

    /// §sysinfoapi.h. Out-param of GetSystemInfo / GetNativeSystemInfo.
    /// The first field is an anonymous union — Windows chose the
    /// `dwOemId` compatibility alias in the union head, but every
    /// modern caller reads `Anonymous.Anonymous.wProcessorArchitecture`.
    /// Size is 48 on x86 / 56 on x64 (pointer & usize fields drive the
    /// spread). Zig's `extern union` honors C union semantics: all
    /// variants overlap at offset 0, alignment = max variant align.
    pub const SYSTEM_INFO = extern struct {
        Anonymous: SYSTEM_INFO_0,
        dwPageSize: u32,
        lpMinimumApplicationAddress: ?*anyopaque,
        lpMaximumApplicationAddress: ?*anyopaque,
        dwActiveProcessorMask: usize,
        dwNumberOfProcessors: u32,
        dwProcessorType: u32,
        dwAllocationGranularity: u32,
        wProcessorLevel: u16,
        wProcessorRevision: u16,
    };

    /// Anonymous union inside SYSTEM_INFO. Name `_0` mirrors the
    /// suffix windows-rs generates for unnamed nested types, so a
    /// future generator pass can emit matching identifiers without
    /// renaming.
    pub const SYSTEM_INFO_0 = extern union {
        dwOemId: u32,
        Anonymous: SYSTEM_INFO_0_0,
    };

    /// Anonymous struct inside SYSTEM_INFO_0. `wProcessorArchitecture`
    /// is the field modern callers read (PROCESSOR_ARCHITECTURE enum
    /// is u16; kept as raw u16 here pending enum projection).
    pub const SYSTEM_INFO_0_0 = extern struct {
        wProcessorArchitecture: u16,
        wReserved: u16,
    };
};

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
        //
        // Special case: `Ptr<void>` (LPVOID) is the C idiom for an
        // opaque pointer. Zig's `?*void` is a zero-sized-pointer
        // oddity that refuses integer casts; `?*anyopaque` is the
        // idiomatic replacement and lets callers `@ptrCast`
        // arbitrary buffers through.
        if (depth == 0 and ty == void) {
            ty = anyopaque;
        }
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
    // StaticStringMap.get() on the big namespace indexes
    // (Storage.FileSystem has 300+ entries, UI.WindowsAndMessaging
    // similar) blows the default 1000-branch quota after just a
    // handful of lookups. Bump generously — comptime eval is still
    // one-shot per project() call.
    @setEvalBranchQuota(100_000);
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
    @setEvalBranchQuota(100_000);
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

test "project: Console { GetStdHandle, GetConsoleCP } type-checks" {
    // Fourth namespace wired. Exercises two new VALUETYPE → u32
    // flag enum aliases added to the alias table:
    //   - STD_HANDLE    (param of GetStdHandle)
    //   - CONSOLE_MODE  (unused here but registered alongside)
    // Plus a no-alias primitive-only API (GetConsoleCP) as a
    // sanity check that the Console namespace resolves at all.
    const win = project(.{
        .@"Windows.Win32.System.Console" = .{ "GetStdHandle", "GetConsoleCP" },
    });

    // GetStdHandle(STD_HANDLE) -> HANDLE
    try std.testing.expectEqual(
        @as(type, *const fn (u32) callconv(.winapi) isize),
        @TypeOf(win.GetStdHandle),
    );

    // GetConsoleCP() -> u32
    try std.testing.expectEqual(
        @as(type, *const fn () callconv(.winapi) u32),
        @TypeOf(win.GetConsoleCP),
    );
}

test "project: WindowsAndMessaging { GetDesktopWindow, IsWindow } type-checks" {
    // Fifth namespace wired. Exercises the new HWND -> isize alias.
    // GetDesktopWindow() -> HWND is the minimal HWND-returning call;
    // IsWindow(HWND) -> BOOL exercises HWND as a parameter + BOOL return.
    const win = project(.{
        .@"Windows.Win32.UI.WindowsAndMessaging" = .{ "GetDesktopWindow", "IsWindow" },
    });

    try std.testing.expectEqual(
        @as(type, *const fn () callconv(.winapi) isize),
        @TypeOf(win.GetDesktopWindow),
    );
    try std.testing.expectEqual(
        @as(type, *const fn (isize) callconv(.winapi) i32),
        @TypeOf(win.IsWindow),
    );
}

test "project: WindowsAndMessaging { MessageBoxW } type-checks" {
    // MessageBoxW(hwnd: HWND, text: PWSTR, caption: PWSTR, style: MESSAGEBOX_STYLE)
    //   -> MESSAGEBOX_RESULT.
    // The generator encodes both strings as PWSTR in the signature blob
    // (winmd collapses PCWSTR/PWSTR through the TypeRef tag); MESSAGEBOX_STYLE
    // maps to u32 (flag enum) and MESSAGEBOX_RESULT maps to i32 (signed
    // IDOK/IDCANCEL/... values, matching the windows-rs projection).
    const win = project(.{
        .@"Windows.Win32.UI.WindowsAndMessaging" = .{"MessageBoxW"},
    });

    try std.testing.expectEqual(
        @as(
            type,
            *const fn (isize, ?[*:0]u16, ?[*:0]u16, u32) callconv(.winapi) i32,
        ),
        @TypeOf(win.MessageBoxW),
    );
}

test "project: Storage.FileSystem { CreateFileW, WriteFile, DeleteFileW } type-checks" {
    // CreateFileW signature:
    //   HANDLE CreateFileW(
    //       PCWSTR                lpFileName,        -- PWSTR in winmd
    //       u32                   dwDesiredAccess,   -- bare u32 (no enum wrapper)
    //       FILE_SHARE_MODE       dwShareMode,       -- u32 alias
    //       SECURITY_ATTRIBUTES*  lpSecurityAttrs,   -- anyopaque alias → ?*anyopaque
    //       FILE_CREATION_DISPOSITION dwCreationDisposition, -- u32 alias
    //       FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes,  -- u32 alias
    //       HANDLE                hTemplateFile,
    //   );
    //
    // WriteFile(HANDLE, *const u8, u32, *u32, OVERLAPPED*) -> BOOL.
    //   OVERLAPPED aliases to anyopaque so synchronous callers pass null.
    //
    // DeleteFileW(PCWSTR) -> BOOL. Exercises a single-PWSTR API and
    // keeps the sample able to clean up its temp file without leaking.
    const win = project(.{
        .@"Windows.Win32.Storage.FileSystem" = .{ "CreateFileW", "WriteFile", "DeleteFileW" },
    });

    try std.testing.expectEqual(
        @as(
            type,
            *const fn (?[*:0]u16, u32, u32, ?*anyopaque, u32, u32, isize) callconv(.winapi) isize,
        ),
        @TypeOf(win.CreateFileW),
    );
    try std.testing.expectEqual(
        @as(
            type,
            *const fn (isize, ?*u8, u32, ?*u32, ?*anyopaque) callconv(.winapi) i32,
        ),
        @TypeOf(win.WriteFile),
    );
    try std.testing.expectEqual(
        @as(type, *const fn (?[*:0]u16) callconv(.winapi) i32),
        @TypeOf(win.DeleteFileW),
    );
}
