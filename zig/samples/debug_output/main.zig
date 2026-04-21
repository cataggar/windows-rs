//! Phase 6/J sample — first live calls into
//! `Windows.Win32.System.Diagnostics.Debug`.
//!
//! Exercises three zero-alias APIs:
//!
//!   IsDebuggerPresent()       -> BOOL   (0 params, value return)
//!   OutputDebugStringW(PWSTR) -> void   (already-aliased PWSTR input)
//!
//! This is the simplest wiring we've done end-to-end: no new
//! `fnTypeForAlias` entries, no out-params, no handles. Confirms
//! that adding a namespace with purely-already-covered TypeRefs
//! remains a pure-data change.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Diagnostics.Debug" = .{
            "IsDebuggerPresent",
            "OutputDebugStringW",
        },
    });

    const under_debugger = win.IsDebuggerPresent() != 0;

    // UTF-16, NUL-terminated — shape matches PWSTR (mutable). The
    // Win32 projection types PWSTR as `?[*:0]u16` (non-const), so we
    // `@constCast` the string-literal pointer since OutputDebugStringW
    // doesn't mutate it.
    const msg = std.unicode.utf8ToUtf16LeStringLiteral(
        "windows-rs zig port: OutputDebugStringW round-trip",
    );
    const msg_ptr: ?[*:0]u16 = @constCast(msg.ptr);
    win.OutputDebugStringW(msg_ptr);

    std.debug.print(
        "IsDebuggerPresent={s} | OutputDebugStringW sent {d} UTF-16 units\n",
        .{ if (under_debugger) "true" else "false", msg.len },
    );
}
