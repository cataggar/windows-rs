//! Retrieve the user's TEMP directory path via GetTempPathW — the
//! canonical "caller-provides-a-buffer, API-fills-it" shape.
//!
//! Signature:
//!     DWORD GetTempPathW(DWORD nBufferLength, LPWSTR lpBuffer);
//!
//! winmd: `\x00\x02\x09\x09\x11\x05` → return u32, params (u32, PWSTR).
//! The PWSTR projects as `?[*:0]u16` — mutable, which is exactly
//! the shape we need for an out-buffer. No `@constCast` here; the
//! pointer comes from a locally-declared `[261:0]u16` (which
//! Zig lays out with an explicit sentinel slot, matching LPWSTR's
//! null-terminator contract).
//!
//! Complements the Phase 6/L probe (`file_attributes`), which
//! exercises the PWSTR-in shape. Same namespace, same alias, two
//! different lifecycles.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.Storage.FileSystem" = .{"GetTempPathW"},
    });

    // MAX_PATH=260 is the traditional Win32 bound; sentinel-typed
    // array reserves the trailing NUL slot.
    var buf: [261:0]u16 = undefined;
    buf[0] = 0;

    const written = win.GetTempPathW(buf.len, &buf);
    if (written == 0) {
        std.debug.print("GetTempPathW failed\n", .{});
        return;
    }
    if (written > buf.len) {
        std.debug.print("GetTempPathW wants {d} wchars, buffer is {d}\n", .{ written, buf.len });
        return;
    }

    var utf8: [1024]u8 = undefined;
    const utf8_len = try std.unicode.utf16LeToUtf8(&utf8, buf[0..written]);

    std.debug.print("TEMP path: \"{s}\" ({d} wchars)\n", .{ utf8[0..utf8_len], written });
}
