//! Phase 6 sample — port of `crates/samples/windows-sys/create_window`.
//!
//! This is the canary for the delegate-typed struct field emitter fix:
//! `WNDCLASSA.lpfnWndProc` is typed by the `WNDPROC` TypeDef (a
//! `System.MulticastDelegate` extender). Before the fix the whole
//! `WNDCLASSA` record was skipped; the sample proves the field is now
//! reachable as `?*const anyopaque` and that `@ptrCast(&wndproc)` yields
//! a pointer the window manager will invoke.
//!
//! Also exercises the two-world bridge:
//! method signatures from `project()` use the `aliases` form
//! (e.g. `HMODULE = ?*anyopaque`), but the struct fields in the
//! `.structs.zig` sidecars use the extern-struct form
//! (`HINSTANCE = extern struct { Value: *anyopaque }`). The sample
//! shows the idiomatic `.{ .Value = ... }` bridge at every assignment.
//!
//! CI shape: headless, no `WS_VISIBLE`. `PostQuitMessage(0)` is called
//! from `WM_DESTROY`, and we `DestroyWindow` ourselves right after
//! creation so the first `GetMessageA` returns 0 and `main` exits.

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.UI.WindowsAndMessaging" = .{
        "RegisterClassA",
        "CreateWindowExA",
        "DestroyWindow",
        "GetMessageA",
        "TranslateMessage",
        "DispatchMessageA",
        "DefWindowProcA",
        "PostQuitMessage",
        "LoadCursorW",
    },
    .@"Windows.Win32.System.LibraryLoader" = .{"GetModuleHandleA"},
});

// `extern "system"` is `callconv(.winapi)` under the hood in Zig 0.16.
// Matches `WNDPROC = LRESULT (CALLBACK*)(HWND, UINT, WPARAM, LPARAM)`.
// The alias form is used here because `project()` returns alias-typed
// handles; the pointer is cast to `?*const anyopaque` when assigned
// to `WNDCLASSA.lpfnWndProc`.
fn wndproc(
    hwnd: ?*anyopaque,
    message: u32,
    wparam: usize,
    lparam: isize,
) callconv(.winapi) isize {
    const WM_DESTROY: u32 = 0x0002;
    switch (message) {
        WM_DESTROY => {
            win.PostQuitMessage(0);
            return 0;
        },
        else => return win.DefWindowProcA(hwnd, message, wparam, lparam),
    }
}

pub fn main() !void {
    const instance = win.GetModuleHandleA(null);
    if (instance == null) return error.GetModuleHandleFailed;

    // PSTR (alias) is `?[*:0]u8`; the struct-sidecar PSTR is
    // `extern struct { Value: *u8 }` (non-nullable single-item
    // pointer). Keep a mutable sentinel-terminated buffer so both
    // forms can be produced from it.
    var class_name = "window".*; // [6:0]u8
    const class_name_alias: ?[*:0]u8 = &class_name;

    // WNDCLASSA has non-nullable extern-struct handle fields
    // (HINSTANCE, HICON, HCURSOR, HBRUSH, PSTR). Bit-zero the whole
    // record so we only have to name the fields we actually set.
    var wc: win_sys.structs.WNDCLASSA = undefined;
    @memset(std.mem.asBytes(&wc), 0);
    wc.style = WAM.CS_HREDRAW | WAM.CS_VREDRAW;
    wc.lpfnWndProc = @ptrCast(&wndproc);
    wc.hInstance = .{ .Value = instance.? };
    // LoadCursorW's second arg is a PCWSTR resource id. MAKEINTRESOURCE
    // stuffs a small integer into the low bits of a pointer.
    const idc_arrow: ?[*:0]u16 = @ptrFromInt(@as(usize, WAM.IDC_ARROW));
    const cursor = win.LoadCursorW(null, idc_arrow);
    if (cursor != null) wc.hCursor = .{ .Value = cursor.? };
    wc.lpszClassName = .{ .Value = @ptrCast(&class_name) };

    const atom = win.RegisterClassA(&wc);
    if (atom == 0) return error.RegisterClassFailed;

    var title = "This is a sample window".*;
    const title_alias: ?[*:0]u8 = &title;

    const hwnd = win.CreateWindowExA(
        0,
        class_name_alias,
        title_alias,
        WAM.WS_OVERLAPPEDWINDOW, // no WS_VISIBLE — keep CI headless
        WAM.CW_USEDEFAULT,
        WAM.CW_USEDEFAULT,
        WAM.CW_USEDEFAULT,
        WAM.CW_USEDEFAULT,
        null,
        null,
        instance,
        null,
    );
    if (hwnd == null) return error.CreateWindowFailed;

    // Tear the window down synchronously so the message loop exits
    // after draining the WM_DESTROY → PostQuitMessage sequence.
    _ = win.DestroyWindow(hwnd);

    var message: win_sys.structs.MSG = undefined;
    @memset(std.mem.asBytes(&message), 0);
    while (win.GetMessageA(&message, null, 0, 0) != 0) {
        _ = win.TranslateMessage(&message);
        _ = win.DispatchMessageA(&message);
    }

    std.debug.print(
        "RegisterClassA atom = {d} | CreateWindowExA hwnd = 0x{x}\n",
        .{ atom, @intFromPtr(hwnd) },
    );
}

/// Manifest constants duplicated inline to keep the `project()` filter
/// focused on functions. Values mirror `winuser.h`.
const WAM = struct {
    const CS_VREDRAW: u32 = 1;
    const CS_HREDRAW: u32 = 2;
    const WS_OVERLAPPEDWINDOW: u32 = 13565952;
    const CW_USEDEFAULT: i32 = @bitCast(@as(u32, 0x80000000));
    const IDC_ARROW: usize = 32512;
};
