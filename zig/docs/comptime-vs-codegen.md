# Codegen vs comptime projection

`windows-zig` offers two paths from `.winmd` metadata to callable Win32 APIs.
They coexist: the same metadata feeds both. Pick per use-site, not per
project.

## The two modes

### Codegen mode (default)

`zig build bindings` reads the vendored `.winmd` files and writes
per-namespace `.zig` sources into
`packages/win-sys/src/generated/`. Consumers `@import("win-sys")` and
pay nothing at compile time beyond `std.StringArrayHashMap`-style
lookup of whatever they actually reference.

- Diffable, greppable, cacheable under `.zig-cache`.
- Every supported Win32 function / struct / COM interface is available.
- CI diff-checks the generated files don't go stale.

This is what 16 of 16 current samples use. If you don't have a reason
to do otherwise, use codegen.

### Comptime projection mode

```zig
const win_sys = @import("win-sys");

pub const win = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{ "CreateFileW", "CloseHandle" },
    .@"Windows.Win32.System.Threading" = .{ "GetCurrentProcessId" },
});

pub fn main() !void {
    const pid = win.GetCurrentProcessId();
    _ = pid;
}
```

`project()` is a `comptime` function. It receives a struct whose field
names are fully-qualified namespaces and whose values are tuples of
method names. It synthesizes an `@Struct` type with one
`*const FnType` field per requested method and populates it with
`@extern` function pointers. There is no generated source -- the API
surface comes into being inside the compiler.

## When to pick which

| Criterion                             | Codegen          | Comptime         |
| ------------------------------------- | ---------------- | ---------------- |
| You want every available function     | ✓                | no               |
| Surface is ≤ ~100 functions, curated  | ✓                | ✓                |
| You need COM interfaces               | ✓                | not yet          |
| You need function-pointer typedefs    | ✓                | not yet          |
| You want zero source checked in       | no               | ✓                |
| Filter changes should recompile fast  | ~1s (incr)       | ~1s (incr)       |
| You are on a `comptime`-hostile host  | ✓                | no               |

Comptime is the differentiator but not the default. Treat it as an
opt-in power tool for:

- CLI-shaped programs with a tightly scoped API surface.
- Teaching / demo code where "look, the bindings are in the call" is
  the point.
- Internal tools where you want the filter to live next to the call
  site.

## Benchmark

`benches/project_bench/main.zig` projects 10, 50, and 100 methods from
`Windows.Win32.Storage.FileSystem` (the largest single-namespace
surface at 424 methods) in a single binary, then prints each
projection's synthesized type name so nothing gets dead-code
eliminated. Run it with:

```powershell
Measure-Command { zig build bench }
# or
zig build bench --time-report
```

Measured on Windows 11, Zig 0.16.0-dev, `Debug` optimization, fresh
`.zig-cache`:

| Variant                               | Clean build |
| ------------------------------------- | ----------- |
| Size 10 only                          | ~10.0 s     |
| Size 50 only                          | ~9.9 s      |
| Size 100 only                         | ~9.9 s     |
| All three (10 + 50 + 100)             | ~9.9 s     |
| Incremental (warm cache, no edits)    | ~0.8 s      |

The numbers are nearly flat because most of the wall-clock goes to
Zig compiler startup, `win-sys` index compilation, and `lld-link` --
not to the comptime work inside `project()` itself. The comptime
portion is negligible at these filter sizes.

## Recommended cap

`project()` enforces `MAX_PROJECT_METHODS = 256` per call. Exceeding it
produces a `@compileError` telling you to split the filter across two
`project()` calls.

Guidance:

- **≤ 100 methods per `project()` call**: sweet spot. Comptime cost is
  in the compile-startup noise.
- **100 – 256 methods per `project()` call**: still fine, but the error
  surface of invalid method names grows and `@setEvalBranchQuota` was
  chosen with this ceiling in mind.
- **> 256 methods in one namespace**: switch to codegen. The metadata is
  not the bottleneck -- checkin friction and link-step behavior
  are. Codegen gives you a diffable surface and per-function debug
  info the IDE can index.

## Limitations (as of Phase 4)

- Function-pointer typedefs referenced from a projected method (e.g.
  `LPOVERLAPPED_COMPLETION_ROUTINE` for `ReadFileEx`) currently trigger
  `project: no alias for TypeRef ...`. Use codegen for those methods
  until a comptime alias-resolver lands.
- Struct types outside `win-sys`'s reachable set (e.g. `WIN32_FIND_DATA`
  variants) are resolved but not every nested-pointer case has been
  exercised. File bugs with the shortest repro filter.
- COM interfaces (`IUnknown`, `IFileDialog`, etc.) are codegen-only.
  Wiring them through comptime projection is a Phase 7+ item.

## Re-measuring

If you change `project()` or bump the Zig toolchain, re-record the
table above by:

1. `Remove-Item -Recurse -Force zig\.zig-cache`
2. `Measure-Command { zig build bench }` -- report `TotalSeconds`.
3. Repeat without the `Remove-Item` for the warm number.

Regenerate the bench's method list from the latest SDK with:

```powershell
$f = 'packages\win-sys\src\generated\Windows.Win32.Storage.FileSystem.index.zig'
[regex]::Matches((Get-Content $f -Raw), '\{ "([A-Za-z_][A-Za-z0-9_]*)", MethodRecord') |
    ForEach-Object { '"' + $_.Groups[1].Value + '"' } |
    Set-Content benches\bench_names.txt
```

then splice slices into `benches/project_bench/main.zig`.
