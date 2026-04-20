//! `win-core` — hand-written Windows primitives with no metadata dependency.
//!
//! GUID, HRESULT, BOOL, PCWSTR, PCSTR, BSTR, HSTRING, IInspectable vtable
//! scaffolding, and the comptime COM vtable helper. Everything the
//! generated bindings rely on at runtime lives here.

const std = @import("std");

/// 128-bit interface / class identifier, ABI-compatible with Win32 `GUID`.
pub const GUID = extern struct {
    data1: u32,
    data2: u16,
    data3: u16,
    data4: [8]u8,

    /// Parse the canonical `{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}` form
    /// (braces optional) at comptime.
    pub fn parse(comptime s: []const u8) GUID {
        const t = if (s.len > 0 and s[0] == '{') s[1 .. s.len - 1] else s;
        if (t.len != 36) @compileError("GUID must be 36 chars");
        if (t[8] != '-' or t[13] != '-' or t[18] != '-' or t[23] != '-')
            @compileError("GUID dashes misplaced");
        return .{
            .data1 = hex(u32, t[0..8].*),
            .data2 = hex(u16, t[9..13].*),
            .data3 = hex(u16, t[14..18].*),
            .data4 = .{
                hex(u8, t[19..21].*), hex(u8, t[21..23].*),
                hex(u8, t[24..26].*), hex(u8, t[26..28].*),
                hex(u8, t[28..30].*), hex(u8, t[30..32].*),
                hex(u8, t[32..34].*), hex(u8, t[34..36].*),
            },
        };
    }

    fn hex(comptime T: type, comptime src: anytype) T {
        var v: T = 0;
        inline for (src) |c| {
            const d: T = if (c >= '0' and c <= '9')
                c - '0'
            else if (c >= 'a' and c <= 'f')
                c - 'a' + 10
            else if (c >= 'A' and c <= 'F')
                c - 'A' + 10
            else
                @compileError("bad hex char in GUID");
            v = v * 16 + d;
        }
        return v;
    }
};

// ---- HRESULT / NTSTATUS ---------------------------------------------------

/// Windows `HRESULT` — success/failure status code.
///
/// Kept as a plain `i32` alias so it is unconditionally ABI-compatible with
/// every Win32 / COM entry point that returns one. Use the `hresult`
/// namespace below for decomposition and the well-known constants.
pub const HRESULT = i32;

/// NT status code. Kernel / Nt* APIs return this.
pub const NTSTATUS = i32;

pub const hresult = struct {
    pub const S_OK: HRESULT = 0;
    pub const S_FALSE: HRESULT = 1;
    // Common errors — keep tiny; the generated code will add more via
    // comptime-produced constants once `winbindgen` lands.
    pub const E_NOTIMPL: HRESULT = @bitCast(@as(u32, 0x8000_4001));
    pub const E_NOINTERFACE: HRESULT = @bitCast(@as(u32, 0x8000_4002));
    pub const E_POINTER: HRESULT = @bitCast(@as(u32, 0x8000_4003));
    pub const E_ABORT: HRESULT = @bitCast(@as(u32, 0x8000_4004));
    pub const E_FAIL: HRESULT = @bitCast(@as(u32, 0x8000_4005));
    pub const E_ACCESSDENIED: HRESULT = @bitCast(@as(u32, 0x8000_70E4));
    pub const E_OUTOFMEMORY: HRESULT = @bitCast(@as(u32, 0x8007_000E));
    pub const E_INVALIDARG: HRESULT = @bitCast(@as(u32, 0x8007_0057));

    /// `SUCCEEDED(hr)` — true iff the top bit is clear.
    pub inline fn succeeded(hr: HRESULT) bool {
        return hr >= 0;
    }

    /// `FAILED(hr)` — true iff the top bit is set.
    pub inline fn failed(hr: HRESULT) bool {
        return hr < 0;
    }

    /// `hr == S_OK`. Distinct from `succeeded` because `S_FALSE` also
    /// succeeds but carries different semantics.
    pub inline fn isOk(hr: HRESULT) bool {
        return hr == S_OK;
    }

    /// Two-bit severity field (§HRESULT layout).
    pub inline fn severity(hr: HRESULT) u2 {
        return @truncate(@as(u32, @bitCast(hr)) >> 30);
    }

    /// 11-bit facility field.
    pub inline fn facility(hr: HRESULT) u11 {
        return @truncate(@as(u32, @bitCast(hr)) >> 16);
    }

    /// 16-bit code field.
    pub inline fn code(hr: HRESULT) u16 {
        return @truncate(@as(u32, @bitCast(hr)));
    }

    /// Curated Zig error set for the `HRESULT` values that have a clean
    /// semantic mapping. Everything else collapses to `Unknown`, and the
    /// raw code is stashed in `last_hresult` so callers can recover it.
    pub const Error = error{
        Aborted,
        AccessDenied,
        Fail,
        InvalidArg,
        NoInterface,
        NotImplemented,
        OutOfMemory,
        Pointer,
        Unknown,
    };

    /// The last `HRESULT` passed to `ok` / `toError`. Thread-local so
    /// failures are not racy across threads. Callers that care about the
    /// exact raw code (for logging or for HRESULT→COM interop) read this
    /// after catching `Error.Unknown` — but it's correct for *any* error
    /// returned by `ok`.
    pub threadlocal var last_hresult: HRESULT = S_OK;

    /// Map an `HRESULT` to its curated `Error` variant, without caring
    /// whether it's a success or failure. Only useful on a known-failed
    /// code; prefer `ok`.
    pub fn toError(hr: HRESULT) Error {
        last_hresult = hr;
        return switch (hr) {
            E_ABORT => error.Aborted,
            E_ACCESSDENIED => error.AccessDenied,
            E_FAIL => error.Fail,
            E_INVALIDARG => error.InvalidArg,
            E_NOINTERFACE => error.NoInterface,
            E_NOTIMPL => error.NotImplemented,
            E_OUTOFMEMORY => error.OutOfMemory,
            E_POINTER => error.Pointer,
            else => error.Unknown,
        };
    }

    /// The `?` of Zig for COM calls. `S_OK` and `S_FALSE` (and every other
    /// non-negative code) return `void`; failures become a curated `Error`.
    ///
    /// ```zig
    /// try hresult.ok(vtbl.CreateSomething(this, &out));
    /// ```
    pub fn ok(hr: HRESULT) Error!void {
        if (succeeded(hr)) {
            last_hresult = hr;
            return;
        }
        return toError(hr);
    }
};

pub const ntstatus = struct {
    pub const STATUS_SUCCESS: NTSTATUS = 0;

    pub inline fn isSuccess(s: NTSTATUS) bool {
        return s >= 0;
    }

    /// NTSTATUS severity: bits 31..30 — 0=Success, 1=Informational,
    /// 2=Warning, 3=Error.
    pub inline fn severity(s: NTSTATUS) u2 {
        return @truncate(@as(u32, @bitCast(s)) >> 30);
    }

    /// Facility — bits 28..16.
    pub inline fn facility(s: NTSTATUS) u12 {
        return @truncate(@as(u32, @bitCast(s)) >> 16);
    }

    pub inline fn code(s: NTSTATUS) u16 {
        return @truncate(@as(u32, @bitCast(s)));
    }
};

// ---- Booleans -------------------------------------------------------------

/// 32-bit Windows `BOOL`.
pub const BOOL = i32;

/// 8-bit Windows `BOOLEAN`.
pub const BOOLEAN = u8;

/// Convert a Zig `bool` to a Win32 `BOOL`.
pub inline fn boolToWin32(b: bool) BOOL {
    return if (b) 1 else 0;
}

/// Interpret a Win32 `BOOL` — any non-zero value is true, matching the Win32
/// documentation ("Although not every 32-bit value is a TRUE, only zero is
/// a FALSE"). `FindFirstFile` and friends return assorted non-zero values.
pub inline fn boolFromWin32(b: BOOL) bool {
    return b != 0;
}

// ---- C string types -------------------------------------------------------

/// Const pointer to a NUL-terminated UTF-16 string.
pub const PCWSTR = ?[*:0]const u16;

/// Const pointer to a NUL-terminated 8-bit string.
pub const PCSTR = ?[*:0]const u8;

pub const pcwstr = struct {
    /// `wcslen` — number of u16 code units before the NUL.
    pub fn len(s: PCWSTR) usize {
        const p = s orelse return 0;
        return std.mem.len(p);
    }

    /// View the string as a NUL-terminated slice. Returns an empty slice for
    /// a null pointer.
    pub fn slice(s: PCWSTR) []const u16 {
        const p = s orelse return &[_]u16{};
        return std.mem.span(p);
    }
};

pub const pcstr = struct {
    pub fn len(s: PCSTR) usize {
        const p = s orelse return 0;
        return std.mem.len(p);
    }

    pub fn slice(s: PCSTR) []const u8 {
        const p = s orelse return &[_]u8{};
        return std.mem.span(p);
    }
};

/// Comptime UTF-16 string literal — the `L"..."` of Zig, for use at call
/// sites that take `PCWSTR`. Assumes the input is valid UTF-8 (the default
/// for Zig source).
///
/// ```zig
/// const name = utf16Lit("Hello");
/// const handle = CreateFileW(name, ...);
/// ```
pub fn utf16Lit(comptime s: []const u8) [:0]const u16 {
    return std.unicode.utf8ToUtf16LeStringLiteral(s);
}

// ---- COM ------------------------------------------------------------------

/// The `IUnknown` vtable — the first `@sizeOf(IUnknown_Vtbl)` bytes of every
/// COM vtable in existence. Lays out exactly as documented in `Unknwn.h`.
pub const IUnknown_Vtbl = extern struct {
    QueryInterface: *const fn (
        this: *anyopaque,
        iid: *const GUID,
        interface: *?*anyopaque,
    ) callconv(.winapi) HRESULT,
    AddRef: *const fn (this: *anyopaque) callconv(.winapi) u32,
    Release: *const fn (this: *anyopaque) callconv(.winapi) u32,

    pub const IID: GUID = GUID.parse("00000000-0000-0000-C000-000000000046");
};

/// `IID_IUnknown` — every COM object must answer `QueryInterface` for this.
pub const IID_IUnknown = GUID.parse("00000000-0000-0000-C000-000000000046");

/// Owning COM interface pointer. `Vtbl` must begin (layout-wise) with the
/// three `IUnknown` slots; this is how every COM vtable is defined, either
/// by inheritance (C++) or by convention (C).
///
/// The smart pointer owns one reference: `deinit` calls `Release`, `clone`
/// calls `AddRef`. Use `from` to wrap a raw pointer returned by a COM API
/// (which already has a refcount on your behalf).
pub fn Com(comptime Vtbl: type) type {
    return struct {
        const Self = @This();

        /// Pointer to the underlying object. The first pointer-sized field
        /// of the object is its vtable pointer.
        ptr: *anyopaque,

        /// Wrap a raw COM pointer obtained from a factory / QI call. Takes
        /// ownership of the reference returned by the callee.
        pub inline fn from(raw: *anyopaque) Self {
            return .{ .ptr = raw };
        }

        /// Read the per-interface vtable off the object.
        pub inline fn vtbl(self: Self) *const Vtbl {
            return @as(*const *const Vtbl, @ptrCast(@alignCast(self.ptr))).*;
        }

        /// View the vtable as its `IUnknown` prefix.
        pub inline fn unknown(self: Self) *const IUnknown_Vtbl {
            return @ptrCast(self.vtbl());
        }

        pub inline fn addRef(self: Self) u32 {
            return self.unknown().AddRef(self.ptr);
        }

        pub inline fn release(self: Self) u32 {
            return self.unknown().Release(self.ptr);
        }

        pub inline fn queryInterface(
            self: Self,
            iid: *const GUID,
            out: *?*anyopaque,
        ) HRESULT {
            return self.unknown().QueryInterface(self.ptr, iid, out);
        }

        /// Typed `QueryInterface`. Asks the underlying object for the
        /// interface identified by `iid`, expects a pointer back, and
        /// wraps it as `Com(V2)`. The returned smart pointer owns the
        /// fresh reference produced by `QueryInterface`.
        pub fn cast(self: Self, comptime V2: type, iid: *const GUID) !Com(V2) {
            var raw: ?*anyopaque = null;
            try hresult.ok(self.queryInterface(iid, &raw));
            return .{ .ptr = @ptrCast(@alignCast(raw.?)) };
        }

        /// Bump the refcount and hand back a fresh smart pointer.
        pub fn clone(self: Self) Self {
            _ = self.addRef();
            return self;
        }

        /// Release one reference. Safe to call exactly once per owner.
        pub fn deinit(self: Self) void {
            _ = self.release();
        }
    };
}

/// Shorthand for a `Com(IUnknown_Vtbl)` — any COM object, viewed through its
/// `IUnknown` face.
pub const IUnknown = Com(IUnknown_Vtbl);

// ---- BSTR -----------------------------------------------------------------

/// Raw OLE Automation string: a UTF-16LE `[*]const u16` whose four bytes
/// *before* the pointer hold the byte length. Null is a valid empty value.
/// Allocated and freed exclusively by `OleAut32.dll`.
pub const BSTR = ?[*]const u16;

/// Externs from `OleAut32.dll` for `BSTR` management.
pub const oleaut32 = struct {
    pub extern "oleaut32" fn SysAllocStringLen(
        str: ?[*]const u16,
        len: u32,
    ) callconv(.winapi) BSTR;

    pub extern "oleaut32" fn SysFreeString(bstr: BSTR) callconv(.winapi) void;

    pub extern "oleaut32" fn SysStringLen(bstr: BSTR) callconv(.winapi) u32;
};

/// Owning `BSTR` wrapper. Free-at-drop via `SysFreeString`; cheap to move
/// (it's just a pointer); cannot be cloned without the OS allocator.
///
/// The four-byte length prefix that lives before the pointer is managed
/// by `SysAllocStringLen` / `SysStringLen`, so this type never needs to
/// touch it directly.
pub const Bstr = struct {
    raw: BSTR = null,

    /// Take ownership of a `BSTR` returned by a Win32 API (which allocated
    /// it via `SysAllocString*`).
    pub inline fn fromRaw(raw: BSTR) Bstr {
        return .{ .raw = raw };
    }

    /// Allocate a fresh `BSTR` copy of the given UTF-16 slice.
    pub fn alloc(utf16: []const u16) error{OutOfMemory}!Bstr {
        const raw = oleaut32.SysAllocStringLen(
            if (utf16.len == 0) null else utf16.ptr,
            @intCast(utf16.len),
        );
        if (raw == null and utf16.len != 0) return error.OutOfMemory;
        return .{ .raw = raw };
    }

    /// Allocate a fresh `BSTR` from a UTF-8 string, converting to UTF-16LE
    /// on the fly using the provided allocator for the intermediate buffer.
    pub fn allocUtf8(allocator: std.mem.Allocator, s: []const u8) !Bstr {
        const utf16 = try std.unicode.utf8ToUtf16LeAlloc(allocator, s);
        defer allocator.free(utf16);
        return alloc(utf16);
    }

    /// Number of UTF-16 code units in the string, excluding the NUL.
    pub fn len(self: Bstr) u32 {
        if (self.raw == null) return 0;
        return oleaut32.SysStringLen(self.raw);
    }

    /// View the string as a slice. Returns an empty slice for null.
    pub fn slice(self: Bstr) []const u16 {
        const p = self.raw orelse return &[_]u16{};
        return p[0..oleaut32.SysStringLen(self.raw)];
    }

    /// Release the OS-owned storage. Idempotent; leaves `raw` null.
    pub fn deinit(self: *Bstr) void {
        oleaut32.SysFreeString(self.raw);
        self.raw = null;
    }
};

// ---- HSTRING --------------------------------------------------------------

/// Opaque WinRT string handle, allocated and freed exclusively by
/// `combase.dll`. Null is a valid empty value (per MSDN).
pub const HSTRING = ?*opaque {};

/// Externs from the WinRT string API set. At runtime these resolve to
/// `combase.dll`, but we link against the API-set import library that
/// ships with Zig's MinGW distribution (`combase` itself is not shipped).
pub const combase = struct {
    pub extern "api-ms-win-core-winrt-string-l1-1-0" fn WindowsCreateString(
        source: ?[*]const u16,
        length: u32,
        string: *HSTRING,
    ) callconv(.winapi) HRESULT;

    pub extern "api-ms-win-core-winrt-string-l1-1-0" fn WindowsDeleteString(
        string: HSTRING,
    ) callconv(.winapi) HRESULT;

    pub extern "api-ms-win-core-winrt-string-l1-1-0" fn WindowsGetStringRawBuffer(
        string: HSTRING,
        length: ?*u32,
    ) callconv(.winapi) ?[*]const u16;

    pub extern "api-ms-win-core-winrt-string-l1-1-0" fn WindowsGetStringLen(
        string: HSTRING,
    ) callconv(.winapi) u32;
};

/// Owning `HSTRING` wrapper. Free-at-drop via `WindowsDeleteString`.
/// Null is a valid empty value and `deinit` is idempotent.
pub const Hstring = struct {
    raw: HSTRING = null,

    /// Wrap a raw `HSTRING` already owned by the caller.
    pub fn fromRaw(raw: HSTRING) Hstring {
        return .{ .raw = raw };
    }

    /// Allocate an `HSTRING` from a UTF-16 slice via `WindowsCreateString`.
    pub fn create(text: []const u16) !Hstring {
        var out: HSTRING = null;
        const source: ?[*]const u16 = if (text.len == 0) null else text.ptr;
        const hr = combase.WindowsCreateString(source, @intCast(text.len), &out);
        try hresult.ok(hr);
        return .{ .raw = out };
    }

    /// Allocate an `HSTRING` from a UTF-8 slice. Caller-owned scratch
    /// buffer is used transiently via `allocator`.
    pub fn createUtf8(allocator: std.mem.Allocator, text: []const u8) !Hstring {
        const wide = try std.unicode.utf8ToUtf16LeAlloc(allocator, text);
        defer allocator.free(wide);
        return create(wide);
    }

    /// Number of UTF-16 code units. Null maps to 0.
    pub fn len(self: Hstring) u32 {
        return combase.WindowsGetStringLen(self.raw);
    }

    /// Borrowed view of the UTF-16 code units. Empty for null.
    /// The returned slice is valid until the next mutation of `self`.
    pub fn slice(self: Hstring) []const u16 {
        const n = self.len();
        if (n == 0) return &[_]u16{};
        const p = combase.WindowsGetStringRawBuffer(self.raw, null) orelse
            return &[_]u16{};
        return p[0..n];
    }

    /// Release the OS-owned storage. Idempotent; leaves `raw` null.
    pub fn deinit(self: *Hstring) void {
        _ = combase.WindowsDeleteString(self.raw);
        self.raw = null;
    }
};

// ---- IInspectable (WinRT base) --------------------------------------------

/// IID of `IInspectable`: `{AF86E2E0-B12D-4C6A-9C5A-D7AA65101E90}`.
pub const IID_IInspectable: GUID = .{
    .data1 = 0xAF86E2E0,
    .data2 = 0xB12D,
    .data3 = 0x4C6A,
    .data4 = .{ 0x9C, 0x5A, 0xD7, 0xAA, 0x65, 0x10, 0x1E, 0x90 },
};

/// WinRT `IInspectable` vtable. All WinRT runtime interfaces inherit this.
pub const IInspectable_Vtbl = extern struct {
    base: IUnknown_Vtbl,

    GetIids: *const fn (
        this: *anyopaque,
        count: *u32,
        values: *?[*]GUID,
    ) callconv(.winapi) HRESULT,

    GetRuntimeClassName: *const fn (
        this: *anyopaque,
        value: *HSTRING,
    ) callconv(.winapi) HRESULT,

    GetTrustLevel: *const fn (
        this: *anyopaque,
        value: *i32,
    ) callconv(.winapi) HRESULT,

    pub const IID = IID_IInspectable;
};

/// Shorthand for a `Com(IInspectable_Vtbl)` — any WinRT object, viewed
/// through its `IInspectable` face.
pub const IInspectable = Com(IInspectable_Vtbl);

// ---- IStringable (Windows.Foundation) -------------------------------------

/// IID of `IStringable`: `{96369F54-8EB6-48F0-ABCE-C1B211E627C3}`.
pub const IID_IStringable: GUID = .{
    .data1 = 0x96369F54,
    .data2 = 0x8EB6,
    .data3 = 0x48F0,
    .data4 = .{ 0xAB, 0xCE, 0xC1, 0xB2, 0x11, 0xE6, 0x27, 0xC3 },
};

/// `Windows.Foundation.IStringable` — the WinRT analogue of `ToString`.
pub const IStringable_Vtbl = extern struct {
    base: IInspectable_Vtbl,

    ToString: *const fn (
        this: *anyopaque,
        value: *HSTRING,
    ) callconv(.winapi) HRESULT,

    pub const IID = IID_IStringable;
};

pub const IStringable = Com(IStringable_Vtbl);

// ---- IUriRuntimeClassFactory (Windows.Foundation) -------------------------

/// IID of `IUriRuntimeClassFactory`: `{44A9796F-723E-4FDF-A218-033E75B0C084}`.
pub const IID_IUriRuntimeClassFactory: GUID = .{
    .data1 = 0x44A9796F,
    .data2 = 0x723E,
    .data3 = 0x4FDF,
    .data4 = .{ 0xA2, 0x18, 0x03, 0x3E, 0x75, 0xB0, 0xC0, 0x84 },
};

/// Activation factory for `Windows.Foundation.Uri`. Two `CreateUri`
/// overloads in the IDL — we only declare the single-argument form here.
pub const IUriRuntimeClassFactory_Vtbl = extern struct {
    base: IInspectable_Vtbl,

    CreateUri: *const fn (
        this: *anyopaque,
        uri: HSTRING,
        instance: *?*anyopaque,
    ) callconv(.winapi) HRESULT,

    CreateWithRelativeUri: *const fn (
        this: *anyopaque,
        base_uri: HSTRING,
        relative_uri: HSTRING,
        instance: *?*anyopaque,
    ) callconv(.winapi) HRESULT,

    pub const IID = IID_IUriRuntimeClassFactory;
};

pub const IUriRuntimeClassFactory = Com(IUriRuntimeClassFactory_Vtbl);

// ---- WinRT activation -----------------------------------------------------

/// Apartment model passed to `RoInitialize`.
pub const RO_INIT_TYPE = enum(i32) {
    single_threaded = 0,
    multi_threaded = 1,
};

/// Trust level returned from `IInspectable.GetTrustLevel`.
pub const TrustLevel = enum(i32) {
    base_trust = 0,
    partial_trust = 1,
    full_trust = 2,
};

/// Externs from the WinRT runtime (`combase.dll` at runtime, linked via
/// the `api-ms-win-core-winrt-l1-1-0` API set).
pub const winrt = struct {
    pub extern "api-ms-win-core-winrt-l1-1-0" fn RoInitialize(
        init_type: RO_INIT_TYPE,
    ) callconv(.winapi) HRESULT;

    pub extern "api-ms-win-core-winrt-l1-1-0" fn RoUninitialize() callconv(.winapi) void;

    pub extern "api-ms-win-core-winrt-l1-1-0" fn RoGetActivationFactory(
        class_name: HSTRING,
        iid: *const GUID,
        factory: *?*anyopaque,
    ) callconv(.winapi) HRESULT;
};

/// `RPC_E_CHANGED_MODE` — raised by `RoInitialize` if the thread has
/// already been initialized under a different apartment. Benign.
pub const RPC_E_CHANGED_MODE: HRESULT = @bitCast(@as(u32, 0x80010106));

/// Initialize the WinRT runtime on the current thread. Treats
/// `RPC_E_CHANGED_MODE` as success so the caller can be robust against
/// the thread already having been initialized by something else.
pub fn roInitialize(init_type: RO_INIT_TYPE) !void {
    const hr = winrt.RoInitialize(init_type);
    if (hr == RPC_E_CHANGED_MODE) return;
    try hresult.ok(hr);
}

/// Look up the activation factory for a WinRT runtime class by name,
/// returning it as a `Com(V)`. The vtable type `V` must have a
/// `pub const IID: GUID` constant (see `IUnknown_Vtbl` / `IInspectable_Vtbl`
/// for the convention used elsewhere in this module; callers pass the IID
/// explicitly here to keep the helper vtable-agnostic).
pub fn activationFactory(
    comptime V: type,
    iid: *const GUID,
    class_name: []const u16,
) !Com(V) {
    var name = try Hstring.create(class_name);
    defer name.deinit();
    var raw: ?*anyopaque = null;
    try hresult.ok(winrt.RoGetActivationFactory(name.raw, iid, &raw));
    // The factory must be non-null on success per WinRT contract.
    return .{ .ptr = @ptrCast(@alignCast(raw.?)) };
}

// ---- IActivationFactory ---------------------------------------------------

/// IID of `IActivationFactory`: `{00000035-0000-0000-C000-000000000046}`.
///
/// The universal factory interface every WinRT runtime class that
/// exposes parameterless activation (`[Activatable(version)]` with no
/// typed factory argument) is queryable for. Calling its sole
/// `ActivateInstance` method produces a default-constructed instance
/// returned as `IInspectable`, which callers then `QueryInterface` to
/// the runtime class's default interface.
pub const IID_IActivationFactory: GUID = .{
    .data1 = 0x00000035,
    .data2 = 0x0000,
    .data3 = 0x0000,
    .data4 = .{ 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 },
};

/// `IActivationFactory` — the parameterless WinRT activation path.
/// `ActivateInstance` takes no arguments and returns a freshly
/// constructed instance as `IInspectable` (the caller owns one
/// reference and must QI to the class's default interface).
pub const IActivationFactory_Vtbl = extern struct {
    base: IInspectable_Vtbl,

    ActivateInstance: *const fn (
        this: *anyopaque,
        instance: *?*anyopaque,
    ) callconv(.winapi) HRESULT,

    pub const IID = IID_IActivationFactory;
};

pub const IActivationFactory = Com(IActivationFactory_Vtbl);

/// Default-construct a WinRT runtime class by name and return its
/// default interface as a raw pointer to `Iface` — a handle-like
/// `extern struct { vtable: *const Iface_Vtbl, ... }`. The returned
/// pointer owns one reference; the caller must eventually call
/// `Release` through the vtable (or `@ptrCast` to the runtime-class
/// struct, which shares the same layout, and call `Release` there).
///
/// `Iface` must expose `pub const IID: GUID` — every generated
/// interface handle in `winbindgen` output satisfies this by
/// convention. `class_name` is the UTF-16 runtime-class name (e.g.
/// `&Windows.Data.Json.JsonObject.NAME_W`).
///
/// This helper chains the two canonical calls — `RoGetActivationFactory`
/// for `IActivationFactory`, then `IActivationFactory.ActivateInstance`,
/// then a `QueryInterface` to `Iface` — and releases the factory and
/// the intermediate `IInspectable` on exit.
pub fn activateInstance(
    comptime Iface: type,
    class_name: []const u16,
) !*Iface {
    const factory = try activationFactory(
        IActivationFactory_Vtbl,
        &IID_IActivationFactory,
        class_name,
    );
    defer factory.deinit();

    var inspectable_raw: ?*anyopaque = null;
    try hresult.ok(factory.vtbl().ActivateInstance(factory.ptr, &inspectable_raw));
    // ActivateInstance must hand back a non-null IInspectable on success.
    const inspectable: IInspectable = .{ .ptr = @ptrCast(@alignCast(inspectable_raw.?)) };
    defer inspectable.deinit();

    var iface_raw: ?*anyopaque = null;
    try hresult.ok(inspectable.queryInterface(&Iface.IID, &iface_raw));
    return @ptrCast(@alignCast(iface_raw.?));
}

// ---- Tests ----------------------------------------------------------------

test "GUID parse roundtrip" {
    // IID_IUnknown
    const g = GUID.parse("00000000-0000-0000-C000-000000000046");
    try std.testing.expectEqual(@as(u32, 0x00000000), g.data1);
    try std.testing.expectEqual(@as(u16, 0x0000), g.data2);
    try std.testing.expectEqual(@as(u16, 0x0000), g.data3);
    try std.testing.expectEqual(@as(u8, 0xC0), g.data4[0]);
    try std.testing.expectEqual(@as(u8, 0x46), g.data4[7]);
}

test "HRESULT helpers and field decomposition" {
    try std.testing.expect(hresult.succeeded(hresult.S_OK));
    try std.testing.expect(hresult.succeeded(hresult.S_FALSE));
    try std.testing.expect(!hresult.isOk(hresult.S_FALSE));
    try std.testing.expect(hresult.failed(hresult.E_FAIL));
    try std.testing.expect(!hresult.succeeded(hresult.E_INVALIDARG));

    // E_INVALIDARG = 0x80070057
    //   severity = 0b10 (failure)
    //   facility = 0x007 (FACILITY_WIN32)
    //   code     = 0x0057
    try std.testing.expectEqual(@as(u2, 0b10), hresult.severity(hresult.E_INVALIDARG));
    try std.testing.expectEqual(@as(u11, 0x007), hresult.facility(hresult.E_INVALIDARG));
    try std.testing.expectEqual(@as(u16, 0x0057), hresult.code(hresult.E_INVALIDARG));
}

test "NTSTATUS helpers" {
    try std.testing.expect(ntstatus.isSuccess(ntstatus.STATUS_SUCCESS));
    const status_invalid_parameter: NTSTATUS = @bitCast(@as(u32, 0xC000_000D));
    try std.testing.expect(!ntstatus.isSuccess(status_invalid_parameter));
    try std.testing.expectEqual(@as(u2, 0b11), ntstatus.severity(status_invalid_parameter));
    try std.testing.expectEqual(@as(u16, 0x000D), ntstatus.code(status_invalid_parameter));
}

test "BOOL conversions" {
    try std.testing.expectEqual(@as(BOOL, 1), boolToWin32(true));
    try std.testing.expectEqual(@as(BOOL, 0), boolToWin32(false));
    try std.testing.expect(boolFromWin32(1));
    try std.testing.expect(!boolFromWin32(0));
    // Non-1 truthy values — Win32 documents any non-zero as TRUE.
    try std.testing.expect(boolFromWin32(-1));
    try std.testing.expect(boolFromWin32(0x1234));
}

test "utf16Lit and pcwstr.len/slice" {
    const hi = utf16Lit("Hi");
    try std.testing.expectEqual(@as(usize, 2), hi.len);
    try std.testing.expectEqual(@as(u16, 'H'), hi[0]);
    try std.testing.expectEqual(@as(u16, 'i'), hi[1]);
    try std.testing.expectEqual(@as(u16, 0), hi[hi.len]);

    // Promote to PCWSTR (nullable pointer-to-NUL-terminated).
    const p: PCWSTR = hi.ptr;
    try std.testing.expectEqual(@as(usize, 2), pcwstr.len(p));
    try std.testing.expectEqualSlices(u16, hi[0..2], pcwstr.slice(p));

    // Null PCWSTR is handled.
    try std.testing.expectEqual(@as(usize, 0), pcwstr.len(null));
    try std.testing.expectEqual(@as(usize, 0), pcwstr.slice(null).len);
}

test "pcstr.len/slice" {
    const s: PCSTR = "hello";
    try std.testing.expectEqual(@as(usize, 5), pcstr.len(s));
    try std.testing.expectEqualStrings("hello", pcstr.slice(s));
    try std.testing.expectEqual(@as(usize, 0), pcstr.len(null));
}

test "hresult.ok maps success to void and known codes to named errors" {
    try hresult.ok(hresult.S_OK);
    try hresult.ok(hresult.S_FALSE);
    try std.testing.expectEqual(hresult.S_FALSE, hresult.last_hresult);

    try std.testing.expectError(hresult.Error.InvalidArg, hresult.ok(hresult.E_INVALIDARG));
    try std.testing.expectEqual(hresult.E_INVALIDARG, hresult.last_hresult);

    try std.testing.expectError(hresult.Error.NoInterface, hresult.ok(hresult.E_NOINTERFACE));
    try std.testing.expectError(hresult.Error.OutOfMemory, hresult.ok(hresult.E_OUTOFMEMORY));
    try std.testing.expectError(hresult.Error.AccessDenied, hresult.ok(hresult.E_ACCESSDENIED));
    try std.testing.expectError(hresult.Error.Aborted, hresult.ok(hresult.E_ABORT));
    try std.testing.expectError(hresult.Error.Fail, hresult.ok(hresult.E_FAIL));
    try std.testing.expectError(hresult.Error.NotImplemented, hresult.ok(hresult.E_NOTIMPL));
    try std.testing.expectError(hresult.Error.Pointer, hresult.ok(hresult.E_POINTER));
}

test "hresult.ok preserves the raw code through Unknown" {
    // ERROR_FILE_NOT_FOUND (0x8007_0002) — not in the curated set.
    const hr: HRESULT = @bitCast(@as(u32, 0x8007_0002));
    try std.testing.expectError(hresult.Error.Unknown, hresult.ok(hr));
    try std.testing.expectEqual(hr, hresult.last_hresult);
}

test "Com smart pointer drives a fake IUnknown vtable" {
    // In-process fake COM object: object layout is { vtbl_ptr, refcount }.
    const Fake = extern struct {
        vtbl: *const IUnknown_Vtbl,
        refcount: u32,

        fn qi(this: *anyopaque, iid: *const GUID, out: *?*anyopaque) callconv(.winapi) HRESULT {
            const self: *@This() = @ptrCast(@alignCast(this));
            if (std.meta.eql(iid.*, IID_IUnknown)) {
                self.refcount += 1;
                out.* = this;
                return hresult.S_OK;
            }
            out.* = null;
            return hresult.E_NOINTERFACE;
        }
        fn addRef(this: *anyopaque) callconv(.winapi) u32 {
            const self: *@This() = @ptrCast(@alignCast(this));
            self.refcount += 1;
            return self.refcount;
        }
        fn release(this: *anyopaque) callconv(.winapi) u32 {
            const self: *@This() = @ptrCast(@alignCast(this));
            self.refcount -= 1;
            return self.refcount;
        }
    };
    const vtbl: IUnknown_Vtbl = .{
        .QueryInterface = Fake.qi,
        .AddRef = Fake.addRef,
        .Release = Fake.release,
    };
    var obj: Fake = .{ .vtbl = &vtbl, .refcount = 1 };

    const p = IUnknown.from(&obj);
    try std.testing.expectEqual(@as(u32, 2), p.addRef());
    try std.testing.expectEqual(@as(u32, 1), p.release());

    // QI for IID_IUnknown succeeds and bumps the count.
    var out: ?*anyopaque = null;
    const hr = p.queryInterface(&IID_IUnknown, &out);
    try std.testing.expect(hresult.isOk(hr));
    try std.testing.expectEqual(@as(u32, 2), obj.refcount);
    try std.testing.expectEqual(@as(?*anyopaque, &obj), out);

    // QI for a random IID fails cleanly.
    const other = GUID.parse("11111111-2222-3333-4444-555566667777");
    out = &obj;
    try std.testing.expectEqual(hresult.E_NOINTERFACE, p.queryInterface(&other, &out));
    try std.testing.expectEqual(@as(?*anyopaque, null), out);

    // clone/deinit balance out.
    const q = p.clone();
    try std.testing.expectEqual(@as(u32, 3), obj.refcount);
    q.deinit();
    try std.testing.expectEqual(@as(u32, 2), obj.refcount);
    _ = p.release();
    _ = p.release();
    try std.testing.expectEqual(@as(u32, 0), obj.refcount);
}

test "Bstr round-trips through OleAut32" {
    if (@import("builtin").target.os.tag != .windows) return error.SkipZigTest;

    // Empty
    var empty: Bstr = .{};
    try std.testing.expectEqual(@as(u32, 0), empty.len());
    try std.testing.expectEqual(@as(usize, 0), empty.slice().len);
    empty.deinit();

    // Allocate from UTF-16 and read it back.
    const msg = [_]u16{ 'H', 'e', 'l', 'l', 'o' };
    var b = try Bstr.alloc(&msg);
    defer b.deinit();
    try std.testing.expectEqual(@as(u32, 5), b.len());
    try std.testing.expectEqualSlices(u16, &msg, b.slice());

    // Allocate from UTF-8 via an allocator.
    var u8b = try Bstr.allocUtf8(std.testing.allocator, "Hi \xe2\x98\x83");
    defer u8b.deinit();
    // 'H','i',' ','\u2603' -> 4 UTF-16 code units.
    try std.testing.expectEqual(@as(u32, 4), u8b.len());
    try std.testing.expectEqual(@as(u16, 0x2603), u8b.slice()[3]);
}

test "Hstring round-trips through combase" {
    if (@import("builtin").target.os.tag != .windows) return error.SkipZigTest;

    // Empty / null round-trip.
    var empty: Hstring = .{};
    try std.testing.expectEqual(@as(u32, 0), empty.len());
    try std.testing.expectEqual(@as(usize, 0), empty.slice().len);
    empty.deinit();

    // Create from UTF-16 and read back.
    const msg = [_]u16{ 'H', 'e', 'l', 'l', 'o' };
    var h = try Hstring.create(&msg);
    defer h.deinit();
    try std.testing.expectEqual(@as(u32, 5), h.len());
    try std.testing.expectEqualSlices(u16, &msg, h.slice());

    // Create from UTF-8; a snowman maps to a single BMP code unit.
    var h8 = try Hstring.createUtf8(std.testing.allocator, "Hi \xe2\x98\x83");
    defer h8.deinit();
    try std.testing.expectEqual(@as(u32, 4), h8.len());
    try std.testing.expectEqual(@as(u16, 0x2603), h8.slice()[3]);
}

test "IInspectable_Vtbl layout extends IUnknown" {
    // IInspectable adds exactly three methods on top of IUnknown's three.
    try std.testing.expectEqual(
        @sizeOf(IUnknown_Vtbl) + 3 * @sizeOf(usize),
        @sizeOf(IInspectable_Vtbl),
    );
    // `base` must be the first field so IInspectable* is ABI-compatible
    // with IUnknown*.
    try std.testing.expectEqual(@as(usize, 0), @offsetOf(IInspectable_Vtbl, "base"));
}

test "RoGetActivationFactory returns a working IInspectable" {
    if (@import("builtin").target.os.tag != .windows) return error.SkipZigTest;

    try roInitialize(.multi_threaded);
    defer winrt.RoUninitialize();

    // "Windows.Foundation.Uri" — a pure runtime class with a well-known
    // activation factory. We ask for the IInspectable face; the factory
    // must be addressable through it.
    const class = utf16Lit("Windows.Foundation.Uri");
    const factory = try activationFactory(IInspectable_Vtbl, &IID_IInspectable, class);
    defer factory.deinit();

    var trust: i32 = -1;
    const hr = factory.vtbl().GetTrustLevel(factory.ptr, &trust);
    try hresult.ok(hr);
    // Any of the three defined trust levels is acceptable. Shipping Windows
    // returns `full_trust` in practice, but the contract only guarantees
    // "one of the defined values".
    try std.testing.expect(trust >= @intFromEnum(TrustLevel.base_trust) and
        trust <= @intFromEnum(TrustLevel.full_trust));
}

test "Windows.Foundation.Uri round-trips a URL through IStringable" {
    if (@import("builtin").target.os.tag != .windows) return error.SkipZigTest;

    try roInitialize(.multi_threaded);
    defer winrt.RoUninitialize();

    // Get the activation factory typed as IUriRuntimeClassFactory directly,
    // so we can call CreateUri without a separate QueryInterface.
    const class = utf16Lit("Windows.Foundation.Uri");
    const factory = try activationFactory(
        IUriRuntimeClassFactory_Vtbl,
        &IID_IUriRuntimeClassFactory,
        class,
    );
    defer factory.deinit();

    // Construct a Uri instance.
    const url = utf16Lit("https://learn.microsoft.com/windows/");
    var url_h = try Hstring.create(url);
    defer url_h.deinit();

    var raw: ?*anyopaque = null;
    try hresult.ok(factory.vtbl().CreateUri(factory.ptr, url_h.raw, &raw));
    const uri = IInspectable{ .ptr = @ptrCast(@alignCast(raw.?)) };
    defer uri.deinit();

    // QI to IStringable and read it back.
    const stringable = try uri.cast(IStringable_Vtbl, &IID_IStringable);
    defer stringable.deinit();

    var out: HSTRING = null;
    try hresult.ok(stringable.vtbl().ToString(stringable.ptr, &out));
    var got = Hstring.fromRaw(out);
    defer got.deinit();

    // The Uri normalizes its input but should preserve the host + path.
    var buf: [256]u8 = undefined;
    const n = try std.unicode.utf16LeToUtf8(&buf, got.slice());
    try std.testing.expect(std.mem.indexOf(u8, buf[0..n], "learn.microsoft.com") != null);
    try std.testing.expect(std.mem.indexOf(u8, buf[0..n], "/windows") != null);
}

test "activateInstance constructs a parameterless WinRT class" {
    if (@import("builtin").target.os.tag != .windows) return error.SkipZigTest;

    try roInitialize(.multi_threaded);
    defer winrt.RoUninitialize();

    // `Windows.Foundation.Collections.PropertySet` activates through
    // the plain `IActivationFactory` path — its metadata carries a
    // parameterless `[Activatable(version)]` — making it the canonical
    // target for exercising `activateInstance` end to end. The returned
    // instance must be queryable for `IInspectable` (every WinRT object
    // is) so we use that as the target interface; `IInspectable_Vtbl`
    // already carries `pub const IID` in this module.
    const inspectable = try activateInstance(IInspectable_Vtbl, utf16Lit("Windows.Foundation.Collections.PropertySet"));
    // `activateInstance` returns the underlying handle pointer (an
    // `extern struct { vtable: *const IInspectable_Vtbl, ... }` as seen
    // from winbindgen output); we hand-build a `Com` around it so the
    // test owns the lifetime cleanly and can release.
    const inst: IInspectable = .{ .ptr = inspectable };
    defer inst.deinit();

    // Non-null trust level proves the vtable is wired correctly.
    var trust: i32 = -1;
    try hresult.ok(inst.vtbl().GetTrustLevel(inst.ptr, &trust));
    try std.testing.expect(trust >= @intFromEnum(TrustLevel.base_trust) and
        trust <= @intFromEnum(TrustLevel.full_trust));
}
