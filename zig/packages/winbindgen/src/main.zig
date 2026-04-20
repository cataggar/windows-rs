//! `winbindgen` CLI — prints the generated Zig source for one namespace
//! to stdout, picking the right vendored `.winmd` by namespace prefix:
//!
//!   * `Windows.Win32.*`  → `Windows.Win32.winmd`
//!   * `Windows.Wdk.*`    → `Windows.Wdk.winmd`
//!   * everything else    → `Windows.winmd` (WinRT)
//!
//! Usage:
//!     winbindgen <namespace>
//!     winbindgen --list
//!
//! `--list` prints every distinct namespace across all three metadata
//! files, one per line. Otherwise the single positional argument is
//! the namespace to emit via `winbindgen.emitNamespace`, and its
//! output is written to stdout.
//!
//! The metadata files are baked in via `@embedFile` — this is still a
//! driver over `emitNamespace` rather than a full bindgen pipeline.
//! Accepting `--winmd` / `--out` paths and a filter manifest will land
//! in later slices as they start to matter.

const std = @import("std");
const winbindgen = @import("winbindgen");
const winmd = @import("winmd");

const winrt_bytes = @embedFile("Windows.winmd");
const win32_bytes = @embedFile("Windows.Win32.winmd");
const wdk_bytes = @embedFile("Windows.Wdk.winmd");

fn selectBytes(namespace: []const u8) []const u8 {
    if (std.mem.startsWith(u8, namespace, "Windows.Win32.") or
        std.mem.eql(u8, namespace, "Windows.Win32"))
        return win32_bytes;
    if (std.mem.startsWith(u8, namespace, "Windows.Wdk.") or
        std.mem.eql(u8, namespace, "Windows.Wdk"))
        return wdk_bytes;
    return winrt_bytes;
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const gpa = init.gpa;

    const args = try init.minimal.args.toSlice(init.arena.allocator());

    var stdout_buffer: [4096]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stderr_buffer: [1024]u8 = undefined;
    var stderr_writer = std.Io.File.stderr().writer(io, &stderr_buffer);
    const stderr = &stderr_writer.interface;

    if (args.len == 2 and std.mem.eql(u8, args[1], "--list")) {
        const arena = init.arena.allocator();
        inline for (.{ winrt_bytes, win32_bytes, wdk_bytes }) |bytes_src| {
            var file = try winmd.parse(bytes_src);
            const names = try winmd.listNamespaces(arena, &file);
            for (names) |n| try stdout.print("{s}\n", .{n});
        }
        try stdout.flush();
        return;
    }

    if (args.len != 2) {
        try stderr.writeAll(
            \\usage: winbindgen <namespace>
            \\       winbindgen --list
            \\
        );
        try stderr.flush();
        std.process.exit(2);
    }

    // Keep the full emitted source in memory first so an error mid-emit
    // doesn't leave partial output on stdout.
    var buf: std.Io.Writer.Allocating = .init(gpa);
    defer buf.deinit();

    const bytes = selectBytes(args[1]);
    var file = try winmd.parse(bytes);
    try winbindgen.emitNamespace(&buf.writer, init.arena.allocator(), &file, args[1]);

    try stdout.writeAll(buf.written());
    try stdout.flush();
}
