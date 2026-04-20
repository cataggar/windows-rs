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
