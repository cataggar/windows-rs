//! windows-zig top-level build script.
//!
//! Wires up the six in-tree packages (`winmd`, `win-core`, `winbindgen`,
//! `win-sys`, `win`, `win-targets`), their unit tests, and the `bindings`
//! step that regenerates `win-sys` / `win` sources from the vendored
//! `.winmd` metadata.
//!
//! Requires Zig 0.16.0 or newer.

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // ------------------------------------------------------------------
    // Modules (one per package). These are kept minimal until the package
    // source files actually exist; `zig build` will happily expose the
    // modules as long as `root_source_file` resolves.
    // ------------------------------------------------------------------

    const winmd_mod = b.addModule("winmd", .{
        .root_source_file = b.path("packages/winmd/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    // Expose the vendored WinRT metadata file to the winmd module so tests
    // (and any comptime consumer) can @embedFile it by a stable name.
    winmd_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winmd_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winmd_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const win_core_mod = b.addModule("win-core", .{
        .root_source_file = b.path("packages/win-core/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    // `win-core` calls into `OleAut32.dll` for `BSTR` helpers and into
    // `combase.dll` (via WinRT API sets shipped by Zig's MinGW) for
    // `HSTRING` helpers and WinRT activation. Link the corresponding
    // import libs on Windows targets.
    if (target.result.os.tag == .windows) {
        win_core_mod.linkSystemLibrary("oleaut32", .{});
        win_core_mod.linkSystemLibrary("api-ms-win-core-winrt-string-l1-1-0", .{});
        win_core_mod.linkSystemLibrary("api-ms-win-core-winrt-l1-1-0", .{});
    }

    const winbindgen_mod = b.addModule("winbindgen", .{
        .root_source_file = b.path("packages/winbindgen/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    winbindgen_mod.addImport("winmd", winmd_mod);
    // Same vendored metadata as `winmd` — exposed here so winbindgen's own
    // tests (which drive the code generator end-to-end) can `@embedFile` them.
    winbindgen_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winbindgen_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winbindgen_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const win_sys_mod = b.addModule("win-sys", .{
        .root_source_file = b.path("packages/win-sys/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    win_sys_mod.addImport("win-core", win_core_mod);

    const win_mod = b.addModule("win", .{
        .root_source_file = b.path("packages/win/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    win_mod.addImport("win-core", win_core_mod);
    win_mod.addImport("win-sys", win_sys_mod);

    const win_targets_mod = b.addModule("win-targets", .{
        .root_source_file = b.path("packages/win-targets/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    _ = win_targets_mod;

    // ------------------------------------------------------------------
    // Unit tests
    // ------------------------------------------------------------------

    const test_step = b.step("test", "Run all package unit tests");

    const TestPkg = struct {
        name: []const u8,
        mod: *std.Build.Module,
    };
    const test_pkgs = [_]TestPkg{
        .{ .name = "winmd", .mod = winmd_mod },
        .{ .name = "win-core", .mod = win_core_mod },
        .{ .name = "winbindgen", .mod = winbindgen_mod },
    };

    for (test_pkgs) |p| {
        const t = b.addTest(.{
            .name = b.fmt("test-{s}", .{p.name}),
            .root_module = p.mod,
        });
        const run_t = b.addRunArtifact(t);
        test_step.dependOn(&run_t.step);
    }

    // ------------------------------------------------------------------
    // `bindings` step — placeholder until winbindgen exposes a CLI.
    // ------------------------------------------------------------------

    const bindings_step = b.step(
        "bindings",
        "Regenerate win-sys and win sources from the vendored .winmd files",
    );
    _ = bindings_step; // will depend on winbindgen artifact once Phase 3 lands

    // ------------------------------------------------------------------
    // `winbindgen` CLI executable — drives `emitNamespace` against the
    // bundled `Windows.winmd`. Handy for eyeballing generated output
    // with `zig build run -- Windows.Foundation` while Phase 3 lands
    // the full bindings pipeline.
    // ------------------------------------------------------------------

    const winbindgen_main_mod = b.createModule(.{
        .root_source_file = b.path("packages/winbindgen/src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    winbindgen_main_mod.addImport("winbindgen", winbindgen_mod);
    winbindgen_main_mod.addImport("winmd", winmd_mod);
    winbindgen_main_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });

    const winbindgen_exe = b.addExecutable(.{
        .name = "winbindgen",
        .root_module = winbindgen_main_mod,
    });
    b.installArtifact(winbindgen_exe);

    const run_winbindgen = b.addRunArtifact(winbindgen_exe);
    if (b.args) |user_args| run_winbindgen.addArgs(user_args);
    const run_step = b.step("run", "Run the winbindgen CLI (pass args with `--`)");
    run_step.dependOn(&run_winbindgen.step);

    // ------------------------------------------------------------------
    // Compile-check: run `winbindgen Windows.Foundation`, capture the
    // generated Zig source, and compile it as an object against
    // `win-core`. This turns the output of Phase 3's codegen into a
    // continuously validated artifact — if a later slice regresses and
    // emits something that won't type-check, `zig build test` catches
    // it. Hooked into the `test` step.
    // ------------------------------------------------------------------

    // Namespaces we compile-check every build. Expand this list to
    // exercise more of the emitted surface; each entry regenerates
    // on demand and type-checks against `win-core`.
    const compile_check_namespaces = [_][]const u8{
        "Windows.Foundation",
        "Windows.Globalization",
        "Windows.Data.Json",
        "Windows.Storage.Streams",
    };

    for (compile_check_namespaces) |ns| {
        const gen_run = b.addRunArtifact(winbindgen_exe);
        gen_run.addArg(ns);
        const gen_source = gen_run.captureStdOut(.{});

        const gen_mod = b.createModule(.{
            .root_source_file = gen_source,
            .target = target,
            .optimize = optimize,
        });
        gen_mod.addImport("win-core", win_core_mod);

        const gen_obj = b.addTest(.{
            .name = b.fmt("compile-check-{s}", .{ns}),
            .root_module = gen_mod,
        });
        const run_gen_obj = b.addRunArtifact(gen_obj);
        test_step.dependOn(&run_gen_obj.step);
    }
}
