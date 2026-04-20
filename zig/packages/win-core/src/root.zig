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
