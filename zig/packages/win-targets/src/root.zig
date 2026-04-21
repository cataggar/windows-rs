//! `win-targets` — produce Windows import libraries from `.def` files
//! at build time, without needing LLVM, MinGW, or MSVC.
//!
//! Zig 0.16 ships a native `dlltool` drop-in (`zig dlltool`) that
//! converts a Microsoft module-definition file into a COFF import
//! library. This package wraps that into a reusable `std.Build` step
//! so downstream `build.zig` files can just declare which APIs they
//! need and get a `LazyPath` to a real `.lib` back.
//!
//! Phase 5 replaces the checked-in per-triple `.lib` blobs under
//! `crates/targets/` with on-demand generation driven by winmd
//! metadata (`winbindgen.collectImports` / `emitDef`).

const std = @import("std");

/// Options for `addImportLib`.
pub const ImportLibOptions = struct {
    /// DLL basename without extension — e.g. `"kernel32"`. Used both
    /// as the output filename (`<name>.lib`) and, after appending
    /// `.dll`, as the DLL name dlltool records in each import entry.
    name: []const u8,
    /// `.def` source that declares the EXPORTS. Typically the output
    /// of another `std.Build` step (e.g. a `WriteFile` fed by
    /// `winbindgen.emitDef`).
    def: std.Build.LazyPath,
    /// Controls the COFF machine type of the resulting import lib —
    /// we read `target.result.cpu.arch` and pass the matching
    /// `-m <machine>` flag to `zig dlltool`.
    target: std.Build.ResolvedTarget,
};

/// Translate a Zig `std.Target.Cpu.Arch` into dlltool's `-m` machine
/// string. Returns `null` for architectures dlltool doesn't support
/// (dlltool only understands `i386`, `i386:x86-64`, `arm`, `arm64`,
/// `arm64ec`, `r4000`).
fn dlltoolMachine(arch: std.Target.Cpu.Arch) ?[]const u8 {
    return switch (arch) {
        .x86 => "i386",
        .x86_64 => "i386:x86-64",
        .arm, .armeb, .thumb, .thumbeb => "arm",
        .aarch64, .aarch64_be => "arm64",
        else => null,
    };
}

/// Create a build step that runs `zig dlltool` to turn `opts.def`
/// into `<opts.name>.lib`, and return a `LazyPath` pointing at the
/// generated archive.
///
/// The returned path can be fed straight into `Compile.addObjectFile`
/// or `Module.addObjectFile`, or installed via `b.addInstallFile`.
///
/// Panics if `opts.target` targets a CPU architecture dlltool can't
/// produce an import library for (Itanium, RISC-V, etc.).
pub fn addImportLib(b: *std.Build, opts: ImportLibOptions) std.Build.LazyPath {
    const arch = opts.target.result.cpu.arch;
    const machine = dlltoolMachine(arch) orelse
        std.debug.panic("win-targets: no dlltool -m value for arch {s}", .{@tagName(arch)});

    const lib_filename = b.fmt("{s}.lib", .{opts.name});
    const dll_filename = b.fmt("{s}.dll", .{opts.name});

    // `zig dlltool -m <machine> -D <dll> -d <def> -l <out.lib>`
    const run = std.Build.Step.Run.create(b, b.fmt("dlltool {s}", .{opts.name}));
    run.addArgs(&.{ b.graph.zig_exe, "dlltool" });
    run.addArgs(&.{ "-m", machine });
    run.addArgs(&.{ "-D", dll_filename });
    run.addArg("-d");
    run.addFileArg(opts.def);
    run.addArg("-l");
    return run.addOutputFileArg(lib_filename);
}

test "dlltoolMachine covers common Windows targets" {
    try std.testing.expectEqualStrings("i386", dlltoolMachine(.x86).?);
    try std.testing.expectEqualStrings("i386:x86-64", dlltoolMachine(.x86_64).?);
    try std.testing.expectEqualStrings("arm64", dlltoolMachine(.aarch64).?);
    try std.testing.expectEqualStrings("arm", dlltoolMachine(.thumb).?);
    try std.testing.expect(dlltoolMachine(.riscv64) == null);
}

/// IMAGE_FILE_MACHINE_* constants — see PECOFF §3.3.
const IMAGE_FILE_MACHINE = struct {
    const I386: u16 = 0x014C;
    const AMD64: u16 = 0x8664;
    const ARMNT: u16 = 0x01C4;
    const ARM64: u16 = 0xAA64;
};

/// Scan a COFF archive for the first "short import" object and
/// return its machine field. Short imports start with the magic
/// bytes `00 00 FF FF 00 00` followed by a little-endian u16
/// machine code (PECOFF §7 "Import Library Format"). Returns
/// `null` if no short import is found.
fn findShortImportMachine(lib_bytes: []const u8) ?u16 {
    const magic = [_]u8{ 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00 };
    var i: usize = 0;
    while (i + magic.len + 2 <= lib_bytes.len) : (i += 1) {
        if (std.mem.eql(u8, lib_bytes[i .. i + magic.len], &magic)) {
            return std.mem.readInt(u16, lib_bytes[i + magic.len ..][0..2], .little);
        }
    }
    return null;
}

/// Drive `zig dlltool` out-of-process for `(def, machine)` and
/// return the resulting import-lib bytes. Used by the end-to-end
/// test below; kept as a helper so the body stays readable.
fn runDlltool(
    arena: std.mem.Allocator,
    io: std.Io,
    cwd: []const u8,
    def_name: []const u8,
    machine: []const u8,
    dll_name: []const u8,
    out_name: []const u8,
) !void {
    const res = try std.process.run(arena, io, .{
        .cwd = .{ .path = cwd },
        .argv = &.{
            "zig", "dlltool",
            "-m",  machine,
            "-D",  dll_name,
            "-d",  def_name,
            "-l",  out_name,
        },
    });
    switch (res.term) {
        .exited => |c| if (c != 0) {
            std.debug.print("dlltool stderr: {s}\n", .{res.stderr});
            return error.DlltoolFailed;
        },
        else => return error.DlltoolCrashed,
    }
}

test "end-to-end: .def -> .lib via zig dlltool produces correct machine type" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const gpa = arena.allocator();

    // Tiny, representative .def — two named imports plus one
    // ordinal-only to exercise both emit paths.
    const def_body =
        \\LIBRARY kernel32.dll
        \\EXPORTS
        \\    CloseHandle
        \\    CreateFileW
        \\    @42
        \\
    ;

    const io = std.testing.io;

    var tmp = std.testing.tmpDir(.{});
    defer tmp.cleanup();

    try tmp.dir.writeFile(io, .{ .sub_path = "kernel32.def", .data = def_body });

    // The tmp dir lives at `.zig-cache/tmp/<sub_path>` relative to cwd.
    // Pass that as the child's cwd so dlltool uses simple relative names.
    const tmp_rel = try std.fs.path.join(gpa, &.{ ".zig-cache", "tmp", &tmp.sub_path });

    const cases = [_]struct {
        machine_arg: []const u8,
        expected: u16,
        lib_name: []const u8,
    }{
        .{ .machine_arg = "i386", .expected = IMAGE_FILE_MACHINE.I386, .lib_name = "x86.lib" },
        .{ .machine_arg = "i386:x86-64", .expected = IMAGE_FILE_MACHINE.AMD64, .lib_name = "x64.lib" },
        .{ .machine_arg = "arm64", .expected = IMAGE_FILE_MACHINE.ARM64, .lib_name = "aarch64.lib" },
    };

    for (cases) |c| {
        try runDlltool(gpa, io, tmp_rel, "kernel32.def", c.machine_arg, "kernel32.dll", c.lib_name);

        const lib_bytes = try tmp.dir.readFileAlloc(io, c.lib_name, gpa, .limited(16 * 1024 * 1024));

        // Every COFF archive starts with `!<arch>\n`.
        try std.testing.expect(lib_bytes.len > 8);
        try std.testing.expectEqualStrings("!<arch>\n", lib_bytes[0..8]);

        const actual = findShortImportMachine(lib_bytes) orelse {
            std.debug.print("no short import found in {s}\n", .{c.lib_name});
            return error.MissingShortImport;
        };
        try std.testing.expectEqual(c.expected, actual);
    }
}
