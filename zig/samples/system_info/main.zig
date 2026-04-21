//! Phase 6/G sample — first live call into `System.SystemInformation`.
//!
//! Reads a couple of environmental values with simple signatures:
//!
//!   GetTickCount64()                        -> u64
//!   GetSystemDirectoryW(buf, size)          -> u32   (chars copied, excluding NUL)
//!
//! Both are pure reads with no teardown, which makes them the
//! minimum-viable probe for a freshly-wired namespace.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.SystemInformation" = .{
            "GetTickCount64",
            "GetSystemDirectoryW",
        },
    });

    const tick = win.GetTickCount64();
    // GetTickCount64 counts ms since boot; just assert it's non-zero
    // (a brand-new boot under 1 ms is absurd; this catches obvious
    // stub/calling-convention failures).
    std.debug.assert(tick != 0);

    var buf: [260]u16 = undefined;
    // PWSTR projects as ?[*:0]u16; the sentinel is a projection-level
    // hint (the API writes its own NUL). @ptrCast through a many-item
    // pointer satisfies Zig without a runtime-terminated buffer.
    const buf_pwstr: ?[*:0]u16 = @ptrCast(@as([*]u16, &buf));
    const n = win.GetSystemDirectoryW(buf_pwstr, @intCast(buf.len));
    if (n == 0) return error.GetSystemDirectoryFailed;
    if (n >= buf.len) return error.BufferTooSmall;

    // UTF-16 → UTF-8 for printing. 3 bytes per code unit is always safe.
    var utf8_buf: [260 * 3]u8 = undefined;
    const written = try std.unicode.utf16LeToUtf8(&utf8_buf, buf[0..n]);
    const dir = utf8_buf[0..written];

    std.debug.assert(std.mem.indexOfScalar(u8, dir, ':') != null);

    std.debug.print(
        "GetTickCount64 = {d} ms | GetSystemDirectoryW = \"{s}\" ({d} chars)\n",
        .{ tick, dir, n },
    );
}
