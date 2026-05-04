//! `winbindgen` CLI — prints the generated Zig source for one namespace
//! to stdout, picking the right vendored `.winmd` by namespace prefix:
//!
//!   * `Windows.Win32.*`  → `Windows.Win32.winmd`
//!   * `Windows.Wdk.*`    → `Windows.Wdk.winmd`
//!   * everything else    → `Windows.winmd` (WinRT)
//!
//! Usage:
//!     winbindgen [--arch=x86|x64|arm64] <namespace>
//!     winbindgen bundle --outdir <dir> [--arch=x86|x64|arm64] [--imports=relative|module] <namespace>...
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

    // `bundle --outdir <dir> [--arch=...] [--imports=relative|module] ns1 ns2 ...`
    // emits a batch of namespaces as a coordinated bundle, auto-routing
    // cross-namespace closed-generic instantiations to their home
    // namespace. Writes `<outdir>/<ns>.zig` for each input plus a
    // generated `win_bundle.zig` facade root and dependency manifest.
    //
    // Inputs are grouped by metadata file before emission; closed-generic
    // routing happens within each metadata group.
    if (args.len >= 2 and std.mem.eql(u8, args[1], "bundle")) {
        try runBundle(
            init.arena.allocator(),
            gpa,
            io,
            args[2..],
            stderr,
        );
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
    var ns_closure_only = false;
    var namespace_arg: ?[]const u8 = null;
    var seed_args = try std.ArrayList([]const u8).initCapacity(init.arena.allocator(), 0);
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
            } else if (std.mem.startsWith(u8, a, "--seed=")) {
                try seed_args.append(init.arena.allocator(), a["--seed=".len..]);
            } else if (std.mem.eql(u8, a, "--index")) {
                index_only = true;
            } else if (std.mem.eql(u8, a, "--structs")) {
                structs_only = true;
            } else if (std.mem.eql(u8, a, "--namespace-closure")) {
                ns_closure_only = true;
            } else if (std.mem.eql(u8, a, "--structs-closure")) {
                closure_only = true;
            } else if (namespace_arg == null) {
                namespace_arg = a;
            } else {
                try stderr.writeAll(
                    \\usage: winbindgen [--arch=x86|x64|arm64] [--seed=<open_name>,<arg>,...] <namespace>
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
    } else if (ns_closure_only) {
        // `--namespace-closure` prints (one per line, sorted) every
        // namespace transitively needed for `<namespace>.zig` to
        // compile — walks the full emitter path and follows cross-ns
        // `@import` references. Includes the root namespace itself.
        const closure = try winbindgen.collectNamespaceClosure(
            init.arena.allocator(),
            &file,
            &.{namespace},
            arch,
        );
        for (closure) |ns| try buf.writer.print("{s}\n", .{ns});
    } else {
        // Parse --seed args into a GenericInstSet for emitNamespaceEx.
        // Format: --seed=<open_name>,<arg>,... where <open_name> includes
        // backtick arity (e.g. IVectorView`1) and <arg> is a primitive
        // name (string, i32, object, etc.).
        var seeds: winbindgen.GenericInstSet = .empty;
        const al = init.arena.allocator();
        for (seed_args.items) |seed_str| {
            const seed = winbindgen.parseSeed(al, namespace, seed_str) catch |err| {
                try stderr.print("bad --seed value '{s}': {}\n", .{ seed_str, err });
                try stderr.flush();
                std.process.exit(2);
            };
            try seeds.put(al, seed.key, seed.tn);
        }
        const extra: ?*const winbindgen.GenericInstSet = if (seeds.count() > 0) &seeds else null;
        try winbindgen.emitNamespaceEx(&buf.writer, init.arena.allocator(), &file, namespace, arch, extra);
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

/// Handle the `bundle --outdir <dir> [--arch=...] [--imports=relative|module] ns1 ns2 ...` subcommand.
/// Calls `winbindgen.emitBundle` to emit every input namespace in a single
/// coordinated pass (cross-namespace closed generics auto-route to their
/// home namespace), then writes `<outdir>/<ns>.zig` for each result plus
/// the generated `win_bundle.zig` facade root and dependency manifest.
fn runBundle(
    arena: std.mem.Allocator,
    gpa: std.mem.Allocator,
    io: std.Io,
    args: []const []const u8,
    stderr: *std.Io.Writer,
) !void {
    var arch: winbindgen.Arch = .x64;
    var import_style: winbindgen.ImportStyle = .relative;
    var outdir: ?[]const u8 = null;
    var namespaces = try std.ArrayList([]const u8).initCapacity(arena, 0);

    var i: usize = 0;
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
        } else if (std.mem.startsWith(u8, a, "--imports=")) {
            const v = a["--imports=".len..];
            if (std.mem.eql(u8, v, "relative")) {
                import_style = .relative;
            } else if (std.mem.eql(u8, v, "module")) {
                import_style = .module;
            } else {
                try stderr.print("unknown --imports value: {s}\n", .{v});
                try stderr.flush();
                std.process.exit(2);
            }
        } else if (std.mem.startsWith(u8, a, "--outdir=")) {
            outdir = a["--outdir=".len..];
        } else if (std.mem.eql(u8, a, "--outdir")) {
            i += 1;
            if (i >= args.len) {
                try stderr.writeAll("--outdir requires a path argument\n");
                try stderr.flush();
                std.process.exit(2);
            }
            outdir = args[i];
        } else {
            try namespaces.append(arena, a);
        }
    }

    const dir_path = outdir orelse {
        try stderr.writeAll(
            \\usage: winbindgen bundle --outdir <dir> [--arch=x86|x64|arm64] [--imports=relative|module] ns1 ns2 ...
            \\
        );
        try stderr.flush();
        std.process.exit(2);
    };

    if (namespaces.items.len == 0) {
        try stderr.writeAll("bundle: need at least one namespace\n");
        try stderr.flush();
        std.process.exit(2);
    }

    // Group namespaces by which winmd file they resolve to; cross-ns
    // generic routing happens only within the same winmd. Phase 4b's
    // WinRT-only routing is a natural fit for this grouping because the
    // Windows.winmd group is where all closed generics live.
    var groups: std.AutoArrayHashMapUnmanaged([*]const u8, std.ArrayListUnmanaged([]const u8)) = .empty;
    for (namespaces.items) |ns| {
        const bytes = selectBytes(ns);
        const gop = try groups.getOrPut(arena, bytes.ptr);
        if (!gop.found_existing) gop.value_ptr.* = .empty;
        try gop.value_ptr.append(arena, ns);
    }

    var dir = try std.Io.Dir.cwd().createDirPathOpen(io, dir_path, .{});
    defer dir.close(io);

    var all_emission = winbindgen.BundleEmission{
        .namespaces = .empty,
        .dependencies = .empty,
        .facade = "",
    };

    var git = groups.iterator();
    while (git.next()) |entry| {
        const group_ns = entry.value_ptr.items;
        const group_bytes = selectBytes(group_ns[0]);

        var file = try winmd.parse(group_bytes);
        const emission = try winbindgen.emitBundleWithImports(arena, &file, group_ns, arch, import_style);

        for (group_ns) |ns| {
            const bytes = emission.get(ns) orelse continue;
            const file_name = try std.fmt.allocPrint(arena, "{s}.zig", .{ns});
            {
                var out_file = try dir.createFile(io, file_name, .{});
                defer out_file.close(io);

                var out_buf: [4096]u8 = undefined;
                var out_writer = out_file.writer(io, &out_buf);
                try out_writer.interface.writeAll(bytes);
                try out_writer.interface.flush();
            }

            try all_emission.namespaces.put(arena, ns, bytes);
            try all_emission.dependencies.put(arena, ns, emission.getDependencies(ns) orelse &.{});
        }
    }

    {
        var out_file = try dir.createFile(io, winbindgen.BundleFacadeFileName, .{});
        defer out_file.close(io);

        var out_buf: [4096]u8 = undefined;
        var out_writer = out_file.writer(io, &out_buf);
        try winbindgen.emitBundleFacadeWithImports(&out_writer.interface, import_style);
        try out_writer.interface.flush();
    }

    {
        var out_file = try dir.createFile(io, winbindgen.BundleDependenciesFileName, .{});
        defer out_file.close(io);

        var out_buf: [4096]u8 = undefined;
        var out_writer = out_file.writer(io, &out_buf);
        try winbindgen.emitBundleDependencyManifest(&out_writer.interface, arena, all_emission);
        try out_writer.interface.flush();
    }

    // Suppress-unused-warning; gpa currently only needed for future
    // large-file buffers.
    _ = gpa;
}
