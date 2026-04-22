//! Phase 6/B sample — full CreateEventW / SetEvent / WaitForSingleObject /
//! CloseHandle round-trip across two namespaces.
//!
//! 1. CreateEventW(null, manual_reset=true, initial=false, name=null) -> HANDLE
//! 2. WaitForSingleObject(handle, 0)                                  -> WAIT_TIMEOUT (unsignaled)
//! 3. SetEvent(handle)                                                -> BOOL
//! 4. WaitForSingleObject(handle, 0)                                  -> WAIT_OBJECT_0 (signaled)
//! 5. CloseHandle(handle)                                             -> BOOL
//!
//! Exercises the pointer-to-struct projection path via
//! `SECURITY_ATTRIBUTES` (treated as opaque in win-sys — callers pass
//! null or a real struct via pointer cast from the high-level `win`
//! layer), plus CloseHandle from Foundation.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Threading" = .{
            "CreateEventW",
            "SetEvent",
            "WaitForSingleObject",
        },
        .@"Windows.Win32.Foundation" = .{"CloseHandle"},
    });

    const WAIT_TIMEOUT: u32 = 0x102;
    const WAIT_OBJECT_0: u32 = 0x0;

    // lpEventAttributes=null, bManualReset=TRUE, bInitialState=FALSE, lpName=null.
    const handle = win.CreateEventW(null, 1, 0, null);
    if (handle == null) {
        std.debug.print("CreateEventW failed\n", .{});
        return error.CreateEventFailed;
    }
    defer _ = win.CloseHandle(handle);

    const rc1 = win.WaitForSingleObject(handle, 0);
    std.debug.assert(rc1 == WAIT_TIMEOUT);

    const set_ok = win.SetEvent(handle);
    std.debug.assert(set_ok != 0);

    const rc2 = win.WaitForSingleObject(handle, 0);
    std.debug.assert(rc2 == WAIT_OBJECT_0);

    std.debug.print(
        "CreateEventW = 0x{x} | Wait(pre-set) = {d} (TIMEOUT) | SetEvent ok | Wait(post-set) = {d} (OBJECT_0)\n",
        .{ @intFromPtr(handle), rc1, rc2 },
    );
}
