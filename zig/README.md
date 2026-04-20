# windows-zig

A Zig 0.16 port of the [windows-rs](https://github.com/microsoft/windows-rs) stack,
reusing the same ECMA-335 `.winmd` metadata to project the Windows API into Zig.

> **Status:** early bring-up. See
> [`plan.md`](../../.copilot/session-state/) in the active session for the roadmap,
> or the top-level design write-up once Phase 6 lands.

## Layout

```
zig/
  build.zig              # top-level build graph
  build.zig.zon          # dependency manifest
  packages/
    winmd/               # ECMA-335 metadata reader
    win-core/            # GUID, HRESULT, BOOL, PCWSTR, COM vtable helpers
    winbindgen/          # .winmd -> .zig codegen + comptime projection
    win-sys/             # C-style Win32 (analogue of windows-sys)
    win/                 # safer wrappers + COM/WinRT (analogue of windows)
    win-targets/         # .def -> import lib build step
  tools/
    bindings/src/*.txt   # filter manifests (kept in sync with crates/tools/bindings/src)
  tests/                 # package-level tests
  samples/               # end-to-end examples
```

The `.winmd` files are **not** duplicated. The build references them in place
at `../crates/libs/bindgen/default/*.winmd`.

## Requirements

- Zig **0.16.0** or later. The code uses per-kind type-creating builtins
  (`@Struct`, `@Enum`, `@Union`), `std.fs.File.MemoryMap`, and
  `.def`-to-import-lib without LLVM, all introduced in 0.16.
- Windows 10 or later to run; the generator itself builds on any host.

## Build

```
cd zig
zig build            # build all packages
zig build test       # run tests
zig build bindings   # regenerate win-sys / win sources
```

## Two projection modes

1. **Codegen** — `zig build bindings` writes `.zig` sources under
   `packages/win-sys/src/` and `packages/win/src/`. Diffable, cacheable,
   CI-enforced.
2. **Comptime** — consumers call `win.project(.{ .filter = &.{ ... } })`;
   the compiler reads metadata and synthesizes types directly. No generated
   files. Opt-in; best for small, focused API surfaces.
