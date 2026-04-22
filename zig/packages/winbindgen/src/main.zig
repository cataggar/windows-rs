//! `winbindgen` CLI — prints the generated Zig source for one namespace
//! to stdout, picking the right vendored `.winmd` by namespace prefix:
//!
//!   * `Windows.Win32.*`  → `Windows.Win32.winmd`
//!   * `Windows.Wdk.*`    → `Windows.Wdk.winmd`
//!   * everything else    → `Windows.winmd` (WinRT)
//!
//! Usage:
//!     winbindgen [--arch=x86|x64|arm64] <namespace>
//!     winbindgen --list
//!
//! `--list` prints every distinct namespace across all three metadata
//! files, one per line. Otherwise the single positional argument is
//! the namespace to emit via `winbindgen.emitNamespace`, and its
//! output is written to stdout. `--arch` picks which
//! `SupportedArchitectureAttribute`-gated overloads to emit; default
//! is `x64`.
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

    // `--emit-mod <dir>` scans <dir> for sibling `*.structs.zig` and
    // `*.index.zig` generated files and prints a `mod.zig` to stdout
    // that re-exports them by namespace. This retires the hand-edited
    // `generated_structs` block in `win-sys/src/project.zig` — the
    // aggregate file is the single thing `project.zig` imports.
    if (args.len == 3 and std.mem.eql(u8, args[1], "--emit-mod")) {
        var buf: std.Io.Writer.Allocating = .init(gpa);
        defer buf.deinit();
        try emitMod(&buf.writer, init.arena.allocator(), io, args[2]);
        try stdout.writeAll(buf.written());
        try stdout.flush();
        return;
    }

    // Parse `--arch=...` optional flag; the remaining positional must
    // be the namespace. Default to x64 so existing callers don't have
    // to change.
    var arch: winbindgen.Arch = .x64;
    var index_only = false;
    var structs_only = false;
    var closure_only = false;
    var namespace_arg: ?[]const u8 = null;
    {
        var i: usize = 1;
        while (i < args.len) : (i += 1) {
            const a = args[i];
            if (std.mem.startsWith(u8, a, "--arch=")) {
                const v = a["--arch=".len..];
                if (std.mem.eql(u8, v, "x86")) {
                    arch = .x86;
                } else if (std.mem.eql(u8, v, "x64")) {
                    arch = .x64;
                } else if (std.mem.eql(u8, v, "arm64")) {
                    arch = .arm64;
                } else {
                    try stderr.print("unknown --arch value: {s}\n", .{v});
                    try stderr.flush();
                    std.process.exit(2);
                }
            } else if (std.mem.eql(u8, a, "--index")) {
                index_only = true;
            } else if (std.mem.eql(u8, a, "--structs")) {
                structs_only = true;
            } else if (std.mem.eql(u8, a, "--structs-closure")) {
                closure_only = true;
            } else if (namespace_arg == null) {
                namespace_arg = a;
            } else {
                try stderr.writeAll(
                    \\usage: winbindgen [--arch=x86|x64|arm64] [--index|--structs|--structs-closure] <namespace>
                    \\       winbindgen --list
                    \\
                );
                try stderr.flush();
                std.process.exit(2);
            }
        }
    }

    const namespace = namespace_arg orelse {
        try stderr.writeAll(
            \\usage: winbindgen [--arch=x86|x64|arm64] [--index|--structs|--structs-closure] <namespace>
            \\       winbindgen --list
            \\
        );
        try stderr.flush();
        std.process.exit(2);
    };

    // Keep the full emitted source in memory first so an error mid-emit
    // doesn't leave partial output on stdout.
    var buf: std.Io.Writer.Allocating = .init(gpa);
    defer buf.deinit();

    const bytes = selectBytes(namespace);
    var file = try winmd.parse(bytes);
    if (index_only) {
        // `--index` emits a standalone `.zig` fragment: a header that
        // pulls in `std` (required for `std.static_string_map`) plus
        // the `pub const method_def_by_name = ...` entry written by
        // `emitMethodIndex`. This is the exact shape Phase 4's
        // `project()` helper `@import`s to perform O(1) method lookups
        // without scanning winmd inside the comptime VM.
        try buf.writer.writeAll("const std = @import(\"std\");\n\n");
        try winbindgen.emitMethodIndex(&buf.writer, init.arena.allocator(), &file, namespace, arch);
    } else if (structs_only) {
        // `--structs` emits a standalone `<ns>.structs.zig` sidecar
        // that can be `@import`ed into a consumer module; header
        // pulls in `win-core` aliases and sibling struct sidecars
        // for any cross-namespace TypeRefs encountered.
        try winbindgen.emitStructsFile(&buf.writer, init.arena.allocator(), &file, namespace, arch);
    } else if (closure_only) {
        // `--structs-closure` prints (one per line, sorted) every
        // namespace whose `.structs.zig` sidecar must also exist for
        // `<namespace>.structs.zig` to compile — i.e. the BFS of the
        // cross-namespace TypeRef graph rooted at `<namespace>`. Lets
        // driver scripts skip the manual "target + transitive" dance.
        const closure = try winbindgen.collectStructsClosure(
            init.arena.allocator(),
            &file,
            namespace,
            arch,
        );
        for (closure) |ns| try buf.writer.print("{s}\n", .{ns});
    } else {
        try winbindgen.emitNamespace(&buf.writer, init.arena.allocator(), &file, namespace, arch);
    }

    try stdout.writeAll(buf.written());
    try stdout.flush();
}

/// Scan `dir` for `*.structs.zig` and `*.index.zig` files and emit a
/// `mod.zig` re-exporting them grouped by flavor. Each file name is
/// expected to be `<namespace>.<flavor>.zig` where `<flavor>` is
/// `structs` or `index`. Output is sorted for determinism.
fn emitMod(
    writer: *std.Io.Writer,
    arena: std.mem.Allocator,
    io: std.Io,
    dir_path: []const u8,
) !void {
    var dir = try std.Io.Dir.cwd().openDir(io, dir_path, .{ .iterate = true });
    defer dir.close(io);

    var structs = try std.ArrayList([]const u8).initCapacity(arena, 0);
    var indexes = try std.ArrayList([]const u8).initCapacity(arena, 0);

    var it = dir.iterate();
    while (try it.next(io)) |entry| {
        if (entry.kind != .file) continue;
        const name = entry.name;
        if (std.mem.endsWith(u8, name, ".structs.zig")) {
            const ns = name[0 .. name.len - ".structs.zig".len];
            if (ns.len == 0) continue;
            try structs.append(arena, try arena.dupe(u8, ns));
        } else if (std.mem.endsWith(u8, name, ".index.zig")) {
            const ns = name[0 .. name.len - ".index.zig".len];
            if (ns.len == 0) continue;
            try indexes.append(arena, try arena.dupe(u8, ns));
        }
    }

    std.mem.sort([]const u8, structs.items, {}, stringLessThan);
    std.mem.sort([]const u8, indexes.items, {}, stringLessThan);

    try writer.writeAll(
        \\//! @generated — do not edit. Regenerate with
        \\//! `zig build bindings` or `winbindgen --emit-mod <dir>`.
        \\//!
        \\//! Aggregate re-export of every sibling `<ns>.structs.zig`
        \\//! and `<ns>.index.zig` file, grouped by flavor. Consumers
        \\//! reach into these via `@field(mod.structs, "<ns>")` so
        \\//! `win-sys/src/project.zig` no longer has to list every
        \\//! namespace by hand.
        \\
        \\pub const structs = struct {
        \\
    );
    for (structs.items) |ns| {
        try writer.print(
            "    pub const @\"{s}\" = @import(\"{s}.structs.zig\");\n",
            .{ ns, ns },
        );
    }
    try writer.writeAll(
        \\};
        \\
        \\pub const index = struct {
        \\
    );
    for (indexes.items) |ns| {
        try writer.print(
            "    pub const @\"{s}\" = @import(\"{s}.index.zig\");\n",
            .{ ns, ns },
        );
    }
    try writer.writeAll("};\n");
}

fn stringLessThan(_: void, a: []const u8, b: []const u8) bool {
    return std.mem.lessThan(u8, a, b);
}
