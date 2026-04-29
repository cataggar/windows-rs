//! Port of `crates/samples/windows/message_box` — the simplest
//! possible Win32 GUI sample. Shows a message box and exits.
//!
//! Build:  `zig build message-box`
//! Run:    `.\zig-out\bin\message-box.exe`

const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.UI.WindowsAndMessaging" = .{"MessageBoxW"},
});

pub fn main() void {
    // MessageBoxW expects PWSTR (mutable) for the Win32 ABI.
    // Use mutable arrays so the pointer types match.
    var text = toUtf16("Hello from Zig!");
    var caption = toUtf16("windows-rs / Zig");
    _ = win.MessageBoxW(null, @ptrCast(&text), @ptrCast(&caption), 0);
}

fn toUtf16(comptime s: []const u8) [s.len:0]u16 {
    var result: [s.len:0]u16 = undefined;
    for (s, 0..) |c, i| result[i] = c;
    result[s.len] = 0;
    return result;
}
