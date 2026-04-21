//! Phase 6 sample: Win32 `SetLastError` / `GetLastError` roundtrip
//! driven by the comptime `win_sys.project()` helper.
//!
//! Exercises the full Phase 4 pipeline:
//!   filter → method_def_by_name → sig.decode → @Fn reification
//!          → @extern(FnPtr, .{ .name, .library_name }).
//!
//! Runs on Windows hosts (extern symbols in KERNEL32.DLL). On other
//! hosts the sample still compiles — only linking + execution are
//! gated in `build.zig`.

const std = @import("std");
const win_sys = @import("win-sys");

// Two-line filter = two live kernel32 imports. Adding more is just
// another name in the tuple.
const win = win_sys.project(.{
    .@"Windows.Win32.Foundation" = .{ "SetLastError", "GetLastError" },
});

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var stdout_buffer: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    const before = win.GetLastError();
    try stdout.print("GetLastError (initial) = {d}\n", .{before});

    // Set an arbitrary sentinel and read it back. This proves both
    // directions of the projected ABI work.
    const sentinel: u32 = 0x1234_5678;
    win.SetLastError(sentinel);

    const after = win.GetLastError();
    try stdout.print("GetLastError (after Set) = 0x{x:0>8}\n", .{after});
    try stdout.flush();

    if (after != sentinel) return error.LastErrorRoundtripFailed;
}
