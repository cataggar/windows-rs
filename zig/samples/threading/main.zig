//! Phase 6/B sample — exercises the richer `Windows.Win32.System.Threading`
//! projection path (HANDLE alias + WAIT_EVENT alias).
//!
//! Calls `GetCurrentProcess()` (pseudo-handle), polls it with
//! `WaitForSingleObject(handle, 0)` — which must return `WAIT_TIMEOUT`
//! (258) because the current process is, by definition, still running —
//! then prints the current thread id and sleeps briefly.
//!
//! This is the first sample to exercise a VALUETYPE → u32 enum alias
//! (`WAIT_EVENT`) via `fnTypeForAlias`, validating that path beyond the
//! already-covered handle (isize) and BOOL (i32) mappings.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Threading" = .{
            "GetCurrentProcess",
            "GetCurrentThreadId",
            "WaitForSingleObject",
            "Sleep",
        },
    });

    const handle = win.GetCurrentProcess();
    const rc = win.WaitForSingleObject(handle, 0);

    // Documented pseudo-handle value for the current process is -1
    // (0xFFFFFFFF_FFFFFFFF on x64). WAIT_TIMEOUT is 0x102 (258).
    const WAIT_TIMEOUT: u32 = 0x102;
    std.debug.assert(rc == WAIT_TIMEOUT);

    const tid = win.GetCurrentThreadId();
    std.debug.print(
        "GetCurrentProcess() = 0x{x} | WaitForSingleObject(_, 0) = {d} (WAIT_TIMEOUT) | ThreadId = {d}\n",
        .{ @as(usize, @bitCast(handle)), rc, tid },
    );

    win.Sleep(10);
}
