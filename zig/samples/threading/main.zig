//! Phase 6/B sample — smoke test for the `Windows.Win32.System.Threading`
//! projection wiring. Primitive-only: no handles, no wait semantics.
//! For a real handle round-trip see `samples/event_roundtrip`.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Threading" = .{
            "GetCurrentThreadId",
            "Sleep",
        },
    });

    const tid = win.GetCurrentThreadId();
    win.Sleep(1);
    std.debug.print("ThreadId = {d}\n", .{tid});
}
