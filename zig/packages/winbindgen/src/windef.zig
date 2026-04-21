//! `windef` CLI — emits Microsoft module-definition (`.def`) files
//! from the vendored Windows metadata, one DLL at a time.
//!
//! Usage:
//!     windef <dll-basename>    # e.g. `windef kernel32` → kernel32.def
//!     windef --list            # one line per distinct DLL
//!
//! Matches the shape and metadata-selection of the `winbindgen` CLI:
//! it scans all three vendored `.winmd` files (WinRT, Win32, WDK) so
//! a DLL imported from any of them is reachable. Output goes to
//! stdout, ready to be piped into `zig dlltool` or fed into
//! `win-targets.addImportLib` via a `std.Build.Step.Run`.

const std = @import("std");
const winbindgen = @import("winbindgen");
const winmd = @import("winmd");

const winrt_bytes = @embedFile("Windows.winmd");
const win32_bytes = @embedFile("Windows.Win32.winmd");
const wdk_bytes = @embedFile("Windows.Wdk.winmd");

const all_winmds = [_][]const u8{ winrt_bytes, win32_bytes, wdk_bytes };

/// Scan every vendored winmd, union the DLL-grouped imports, and
/// return a single sorted list. If the same DLL appears in multiple
/// metadata files (rare but possible — e.g. a Win32 forward into a
/// WDK-declared DLL) the import sets are merged.
fn collectAll(arena: std.mem.Allocator) ![]winbindgen.DllImports {
    var buckets = std.StringArrayHashMapUnmanaged(std.StringArrayHashMapUnmanaged(void)){};

    for (all_winmds) |bytes| {
        var file = try winmd.parse(bytes);
        const groups = try winbindgen.collectImports(arena, &file);
        for (groups) |g| {
            const gop = try buckets.getOrPut(arena, g.dll);
            if (!gop.found_existing) gop.value_ptr.* = .{};
            for (g.imports) |n| _ = try gop.value_ptr.getOrPut(arena, n);
        }
    }

    const out = try arena.alloc(winbindgen.DllImports, buckets.count());
    const dll_keys = buckets.keys();
    for (dll_keys, 0..) |k, i| {
        const names_set = buckets.getPtr(k).?;
        const names = try arena.alloc([]const u8, names_set.count());
        for (names_set.keys(), 0..) |nk, j| names[j] = nk;
        std.mem.sort([]const u8, names, {}, struct {
            fn lt(_: void, a: []const u8, b: []const u8) bool {
                return std.mem.lessThan(u8, a, b);
            }
        }.lt);
        out[i] = .{ .dll = k, .imports = names };
    }
    std.mem.sort(winbindgen.DllImports, out, {}, struct {
        fn lt(_: void, a: winbindgen.DllImports, b: winbindgen.DllImports) bool {
            return std.ascii.lessThanIgnoreCase(a.dll, b.dll);
        }
    }.lt);
    return out;
}

/// Match a user-supplied basename like `kernel32` against metadata
/// DLL names like `KERNEL32.dll` / `kernel32.dll`. Case-insensitive,
/// `.dll` suffix optional on the input.
fn dllMatches(query: []const u8, full: []const u8) bool {
    const base = if (full.len >= 4 and std.ascii.eqlIgnoreCase(full[full.len - 4 ..], ".dll"))
        full[0 .. full.len - 4]
    else
        full;
    const q = if (query.len >= 4 and std.ascii.eqlIgnoreCase(query[query.len - 4 ..], ".dll"))
        query[0 .. query.len - 4]
    else
        query;
    return std.ascii.eqlIgnoreCase(q, base);
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
        const groups = try collectAll(init.arena.allocator());
        for (groups) |g| try stdout.print("{s}\n", .{g.dll});
        try stdout.flush();
        return;
    }

    if (args.len != 2) {
        try stderr.writeAll(
            \\usage: windef <dll-basename>
            \\       windef --list
            \\
        );
        try stderr.flush();
        std.process.exit(2);
    }

    const query = args[1];
    const groups = try collectAll(init.arena.allocator());

    var buf: std.Io.Writer.Allocating = .init(gpa);
    defer buf.deinit();

    for (groups) |g| {
        if (dllMatches(query, g.dll)) {
            try winbindgen.emitDef(&buf.writer, g);
            try stdout.writeAll(buf.written());
            try stdout.flush();
            return;
        }
    }

    try stderr.print("windef: no DLL matching '{s}' in vendored metadata\n", .{query});
    try stderr.flush();
    std.process.exit(1);
}
