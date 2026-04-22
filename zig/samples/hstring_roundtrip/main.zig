//! WinRT `HSTRING` round-trip canary.
//!
//! Allocates an `HSTRING` from a UTF-8 string via `WindowsCreateString`,
//! reads the UTF-16 buffer back through `WindowsGetStringRawBuffer`,
//! converts it to UTF-8, and prints it. Exercises the hand-written
//! `win-core` `Hstring` wrapper and the `api-ms-win-core-winrt-string`
//! import-lib linkage — the foundation every WinRT sample will stand on.
//!
//! No emitter output is consumed here: the goal is to validate the
//! combase string API in isolation before M3 (activation factories)
//! adds a dependency on the WinRT vtbl path.

const std = @import("std");
const win = @import("win");

const Hstring = win.core.Hstring;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var gpa: std.heap.DebugAllocator(.{}) = .init;
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var hstr = try Hstring.createUtf8(allocator, "Hello, HSTRING!");
    defer hstr.deinit();

    const wide = hstr.slice();

    var utf8_buf: [128]u8 = undefined;
    const n = try std.unicode.utf16LeToUtf8(&utf8_buf, wide);

    var stdout_buf: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;
    try stdout.print(
        "HSTRING: \"{s}\" (len={d} utf16 units)\n",
        .{ utf8_buf[0..n], hstr.len() },
    );
    try stdout.flush();
}
