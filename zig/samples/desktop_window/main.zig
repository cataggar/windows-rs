//! Phase 6/C sample — first live call into the `UI.WindowsAndMessaging`
//! namespace. Exercises the `HWND -> isize` alias end-to-end:
//!
//!   1. GetDesktopWindow()         -> HWND (non-null on every Windows session)
//!   2. IsWindow(hwnd)             -> BOOL (expected nonzero)
//!   3. IsWindow(0 /* null HWND */) -> BOOL (expected zero)
//!
//! Kept headless (no `MessageBoxW` / window creation) so the CI harness
//! can run it unattended on `windows-2025` the same way every other
//! sample runs today.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.UI.WindowsAndMessaging" = .{ "GetDesktopWindow", "IsWindow" },
    });

    const desktop = win.GetDesktopWindow();
    if (desktop == 0) {
        std.debug.print("GetDesktopWindow returned null\n", .{});
        return error.NoDesktopWindow;
    }

    const real = win.IsWindow(desktop);
    std.debug.assert(real != 0);

    const fake = win.IsWindow(0);
    std.debug.assert(fake == 0);

    std.debug.print(
        "GetDesktopWindow = 0x{x} | IsWindow(desktop) = {d} | IsWindow(null) = {d}\n",
        .{ @as(usize, @bitCast(desktop)), real, fake },
    );
}
