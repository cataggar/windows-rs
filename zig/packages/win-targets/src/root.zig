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
