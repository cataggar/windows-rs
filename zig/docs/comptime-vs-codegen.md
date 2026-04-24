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

## WinRT cap numbers

WinRT uses a different mechanism: the bundle (`@import("winrt")`) is
emitted wholesale by `zig build bindings` and relies on Zig / LLD
dead-code elimination to strip the unused parts at link time. There is
no WinRT analogue to `project()` — the cap numbers are about bundle
volume and DCE effectiveness, not `@setEvalBranchQuota`.

Current bundle (regenerated from the vendored `.winmd` files as of M6):

| Dimension                                                | Number      |
| -------------------------------------------------------- | ----------- |
| WinRT namespaces                                         | 78          |
| Interface `Vtbl` aliases                                 | ~3,085      |
| Runtime classes with a `factory()` method                | ~155        |
| Emitted `statics*()` methods                             | ~448        |
| Total WinRT bundle source                                | ~9.3 MB     |
| Total WinRT bundle lines of generated Zig                | ~150,000    |

Binary-size footprint of a single-class sample
(`samples/winrt_uri`, calls `Uri.factory()` → `CreateUri` once):

| Build mode                                               | Size        |
| -------------------------------------------------------- | ----------- |
| `Debug`                                                  | ~1.9 MB     |
| `ReleaseSmall`                                           | ~490 KB     |

DCE strips >99% of the emitted interface vtables. The bundle being
large is not the binary-size story.

Build cost of the same sample:

| Scenario                                          | Wall-clock  |
| ------------------------------------------------- | ----------- |
| Cold (empty `.zig-cache`, regenerates bundle)     | ~107 s      |
| Incremental (touch sample, keep cache)            | ~1.5 s      |

The cold number is dominated by `zig build bindings` walking every
winmd file. Day-to-day edits pay only the incremental cost.

### Guidance

- **Add a WinRT class?** Nothing to size-budget; DCE handles it. The
  bundle already carries the 78-namespace closure.
- **Care about cold CI time?** Cache `.zig-cache/o/*/bundle/` between
  runs — bindings regeneration is the expensive step.
- **Care about binary size?** Build `ReleaseSmall`; expect ≤ ~500 KB
  for a typical single-API sample. Further reduction requires fewer
  call sites, not a smaller bundle.

### Re-measuring

```powershell
cd zig
Remove-Item -Recurse -Force .zig-cache, zig-out
Measure-Command { zig build run-winrt-uri } | ForEach-Object TotalSeconds
Measure-Command { zig build run-winrt-uri } | ForEach-Object TotalSeconds  # warm
zig build samples -Doptimize=ReleaseSmall
(Get-Item zig-out\bin\winrt-uri.exe).Length
```

To recount bundle volume:

```powershell
$b = (Get-ChildItem .zig-cache\o -Directory |
      ForEach-Object { Join-Path $_.FullName 'bundle' } |
      Where-Object { Test-Path $_ } | Select-Object -First 1)
$winrt = Get-ChildItem $b -Filter *.zig |
    Where-Object { $_.Name -notlike 'Windows.Win32.*' -and
                   $_.Name -notlike 'Windows.Wdk.*' }
"{0} namespaces, {1:N0} KB" -f $winrt.Count,
    (($winrt | Measure-Object Length -Sum).Sum / 1KB)
```

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
