//! Phase 5 sample: end-to-end proof that `win-targets` emits a
//! linkable import library.
//!
//! Structurally identical to `samples/last_error`, but this sample
//! links against a `kernel32.lib` generated at build time by
//! `win-targets.addImportLibFromWinmd` (winmd → .def → `zig dlltool`)
//! instead of Zig's bundled MinGW import lib. A successful run is the
//! proof that the whole pipeline — metadata parse, .def emit, dlltool
//! archive, short-import symbol resolution — is correct all the way
//! through to program execution, not just that the COFF machine byte
//! happens to be right.
//!
//! See `build.zig` for the wiring (search for `gen_lib`).

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.Foundation" = .{ "SetLastError", "GetLastError" },
});

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var stdout_buffer: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    const sentinel: u32 = 0xFEED_BEEF;
    win.SetLastError(sentinel);
    const got = win.GetLastError();

    try stdout.print(
        "gen-lib-smoke: GetLastError = 0x{x:0>8} (expected 0x{x:0>8})\n",
        .{ got, sentinel },
    );
    try stdout.flush();

    if (got != sentinel) return error.GenLibSmokeFailed;
}
