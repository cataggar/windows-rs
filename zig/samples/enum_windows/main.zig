//! Port of `crates/samples/windows/enum_windows` — enumerates
//! top-level windows and prints their titles.
//!
//! Exercises the callback pattern: `EnumWindows` takes a `WNDENUMPROC`
//! (a Win32 callback) that is invoked once per top-level window.
//!
//! Build:  `zig build enum-windows`
//! Run:    `.\zig-out\bin\enum-windows.exe`

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.UI.WindowsAndMessaging" = .{
        "EnumWindows",
        "GetWindowTextW",
        "IsWindowVisible",
    },
});

fn enumWindowCallback(hwnd: ?*anyopaque, _: isize) callconv(.winapi) i32 {
    // Skip invisible windows.
    if (win.IsWindowVisible(hwnd) == 0) return 1;

    // GetWindowTextW expects PWSTR (mutable).
    var text_buf: [512]u16 = undefined;
    const len = win.GetWindowTextW(hwnd, @ptrCast(&text_buf), 512);
    if (len <= 0) return 1;

    // Convert UTF-16 title to UTF-8 for printing.
    var utf8_buf: [1024]u8 = undefined;
    const n = std.unicode.utf16LeToUtf8(&utf8_buf, text_buf[0..@intCast(len)]) catch 0;
    if (n > 0) {
        std.debug.print("{s}\n", .{utf8_buf[0..n]});
    }

    return 1; // continue
}

pub fn main() void {
    _ = win.EnumWindows(@ptrCast(&enumWindowCallback), 0);
}
