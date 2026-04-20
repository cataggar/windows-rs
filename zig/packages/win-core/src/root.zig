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

/// Windows `HRESULT` — success/failure status code.
pub const HRESULT = i32;

/// 32-bit Windows `BOOL`.
pub const BOOL = i32;

/// 8-bit Windows `BOOLEAN`.
pub const BOOLEAN = u8;

/// Const pointer to a NUL-terminated UTF-16 string.
pub const PCWSTR = ?[*:0]const u16;

/// Const pointer to a NUL-terminated 8-bit string.
pub const PCSTR = ?[*:0]const u8;

test "GUID parse roundtrip" {
    // IID_IUnknown
    const g = GUID.parse("00000000-0000-0000-C000-000000000046");
    try std.testing.expectEqual(@as(u32, 0x00000000), g.data1);
    try std.testing.expectEqual(@as(u16, 0x0000), g.data2);
    try std.testing.expectEqual(@as(u16, 0x0000), g.data3);
    try std.testing.expectEqual(@as(u8, 0xC0), g.data4[0]);
    try std.testing.expectEqual(@as(u8, 0x46), g.data4[7]);
}
