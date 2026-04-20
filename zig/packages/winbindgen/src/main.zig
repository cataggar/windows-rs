//! `winbindgen` CLI — prints the generated Zig source for one namespace
//! from the vendored `Windows.winmd` to stdout.
//!
//! Usage:
//!     winbindgen <namespace>
//!     winbindgen --list
//!
//! `--list` prints every distinct namespace present in the bundled
//! metadata, one per line. Otherwise the single positional argument
//! is the namespace to emit via `winbindgen.emitNamespace`, and its
//! output is written to stdout.
//!
//! The metadata file is baked in via `@embedFile` — this first cut is
//! a driver over `emitNamespace` rather than a full bindgen pipeline.
//! Accepting `--winmd` / `--out` paths and a filter manifest will land
//! in later slices as they start to matter.

const std = @import("std");
const winbindgen = @import("winbindgen");
const winmd = @import("winmd");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const gpa = init.gpa;

    const args = try init.minimal.args.toSlice(init.arena.allocator());

    const bytes = @embedFile("Windows.winmd");
    var file = try winmd.parse(bytes);

    var stdout_buffer: [4096]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stderr_buffer: [1024]u8 = undefined;
    var stderr_writer = std.Io.File.stderr().writer(io, &stderr_buffer);
    const stderr = &stderr_writer.interface;

    if (args.len == 2 and std.mem.eql(u8, args[1], "--list")) {
        const names = try winmd.listNamespaces(init.arena.allocator(), &file);
        for (names) |n| try stdout.print("{s}\n", .{n});
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

    try winbindgen.emitNamespace(&buf.writer, init.arena.allocator(), &file, args[1]);

    try stdout.writeAll(buf.written());
    try stdout.flush();
}
