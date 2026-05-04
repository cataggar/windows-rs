# windows-zig samples

Seventeen end-to-end probes that each exercise one shape of the
winmd→Zig projection. The goal of these samples isn't to demonstrate
clever Win32 usage — it's to pin down a specific wire shape
(PWSTR-out, struct field access, opaque buffer cast, etc.) with a
program that actually runs and verifies its own output.

Each sample builds as `zig build <name>` and runs as
`zig build run-<name>`. CI runs every one on `windows-2022`.

## Running

```powershell
cd zig
zig build samples            # build all
zig build run-find-files     # build + run one
```

## The catalog

### Entry-level: error handling and dynamic load

| Sample            | Shape exercised                                     |
|-------------------|-----------------------------------------------------|
| `last-error`      | Zero-arg call returning `u32`. FormatMessageW wrap. |
| `load-library`    | `HMODULE` handle lifecycle; GetProcAddress wrap.    |
| `debug-output`    | `PWSTR`-in literal via `@constCast(literal.ptr)`.   |

### Handles and waits

| Sample            | Shape exercised                                     |
|-------------------|-----------------------------------------------------|
| `threading`       | CreateThread + WaitForSingleObject; callback ptr.   |
| `event-roundtrip` | CreateEventW → SetEvent → WaitForSingleObject → CloseHandle. |
| `desktop-window`  | GetDesktopWindow → GetWindowRect; cross-lib linker. |

### File I/O and paths

| Sample            | Shape exercised                                                |
|-------------------|----------------------------------------------------------------|
| `file-write`      | CreateFileW + WriteFile + CloseHandle; OVERLAPPED-null.        |
| `file-attributes` | GetFileAttributesW flags-return (INVALID_FILE_ATTRIBUTES=-1).  |
| `temp-path`       | **PWSTR-out buffer pattern**: local `[261:0]u16`, pass `&buf`. |
| `find-files`      | **Struct field access**: FindFirstFileW writes into `WIN32_FIND_DATAW`; sample reads `.cFileName`, `.dwFileAttributes`, `.nFileSize{Hi,Lo}` directly. |

### Memory, system info, security

| Sample               | Shape exercised                                                |
|----------------------|----------------------------------------------------------------|
| `heap-alloc`         | HeapAlloc → HeapFree; usize size.                              |
| `virtual-alloc`      | VirtualAlloc flags combos; `?*anyopaque` return.               |
| `system-info`        | Scalar reads: GetTickCount64 (u64), GetSystemDirectoryW.       |
| `native-system-info` | **Anonymous union access**: GetNativeSystemInfo writes SYSTEM_INFO; sample reads `info.Anonymous.Anonymous.wProcessorArchitecture`. |
| `well-known-sid`     | **Opaque buffer + `@ptrCast`**: local `[SECURITY_MAX_SID_SIZE]u8 align(4)` passed to CreateWellKnownSid/IsValidSid/GetLengthSid as PSID (`?*anyopaque`). |
| `token-elevation`    | **Depth-1 HANDLE-out**: OpenProcessToken takes `*HANDLE` → `*isize`. GetTokenInformation reads `TokenIsElevated` directly into a `u32` (TOKEN_ELEVATION's sole field). |

### UI / callbacks

| Sample           | Shape exercised                                                |
|------------------|----------------------------------------------------------------|
| `create-window`  | **Delegate-typed struct field**: `WNDCLASSA.lpfnWndProc` projects as `?*const anyopaque`. Sample registers a class, creates a window, drains the message loop, and lets `WM_DESTROY` fire `PostQuitMessage(0)` for a clean exit. Also shows the alias-form (`?*anyopaque` handles) vs struct-form (`extern struct { Value: *anyopaque }`) bridge at `.{ .Value = ... }` assignments. |

## The shapes, distilled

### PWSTR-in (constant literal)

```zig
const msg: [:0]const u16 = std.unicode.utf8ToUtf16LeStringLiteral("hello\n");
win.OutputDebugStringW(@constCast(msg.ptr));
```

The generator projects `PWSTR` as `?[*:0]u16` (non-const) because the
winmd doesn't distinguish in-vs-out. For constant literals, callers
`@constCast` at the call site. Decision (6/M): don't split the
projection; one cast per const-string call is acceptable.

### PWSTR-out (caller buffer)

```zig
var buf: [261:0]u16 = undefined;
const n = win.GetTempPathW(buf.len, &buf);
// n is chars written, not including NUL.
```

Caller owns a `[N:0]u16` buffer. `&buf` coerces to `?[*:0]u16`
without a cast. Length is passed in chars, not bytes.

### Struct field access

```zig
var info: win_sys.structs.WIN32_FIND_DATAW = undefined;
const h = win.FindFirstFileW(@constCast(pattern.ptr), &info);
// info.cFileName is [260]u16 — scan for NUL at runtime.
// info.dwFileAttributes, info.nFileSize{Hi,Lo} are flat scalars.
```

Concrete `extern struct` in `win_sys.structs` means direct `.field`
access. Layouts are **handcrafted today**; generator pass forthcoming
will emit them from TypeDef Fields.

### Anonymous union field access

```zig
var info: win_sys.structs.SYSTEM_INFO = undefined;
win.GetNativeSystemInfo(&info);
const arch = info.Anonymous.Anonymous.wProcessorArchitecture;
```

Anonymous unions are projected as `extern union` named after the
windows-rs convention (`_0`, `_0_0`, …). Field path mirrors the C
header exactly — no auto-flattening.

### Opaque buffer + `@ptrCast`

```zig
var sid_buf: [SECURITY_MAX_SID_SIZE]u8 align(4) = undefined;
var size: u32 = sid_buf.len;
const ok = win.CreateWellKnownSid(
    .WinWorldSid, null, @ptrCast(&sid_buf), &size,
);
const valid = win.IsValidSid(@ptrCast(&sid_buf));
```

When the projection keeps a type opaque (`PSID → ?*anyopaque`),
callers back it with a raw aligned byte buffer and `@ptrCast` into
the slot. Used for generic buffer APIs where the struct graph isn't
worth projecting.

### Cross-namespace constants

```zig
const fs = win_sys.index.@"Windows.Win32.Storage.FileSystem";
const foundation = win_sys.index.@"Windows.Win32.Foundation";
const win = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{ "FindFirstFileW" },
});
if (h == foundation.INVALID_HANDLE_VALUE) return error.NotFound;
if (attrs & fs.FILE_ATTRIBUTE_DIRECTORY != 0) continue;
```

`index.<NS>` is the compile-time constant namespace (per-winmd flat
map of integer literals). `project(...)` materializes extern fn
pointers. Same sample can reach into multiple `index.<NS>`
bundles — constants live where Windows put them (`INVALID_HANDLE_VALUE`
is Foundation, not FileSystem).

### Generated WinRT bundle facade

```zig
const win = @import("win");
const UI = win.WinRT.UI;
const Composition = UI.Composition;
const Interop = win.Win32.System.WinRT.Composition;
```

The `win` package mounts the generated `win-bundle` facade emitted by
`winbindgen bundle --imports=module`. Samples such as `minesweeper` use
these curated aliases for public WinRT/Win32 Composition paths. The bundle
build mounts each generated namespace as a stable `<namespace>` module, so
cross-namespace dependencies are explicit in Zig's module graph instead of
depending on sibling file-relative imports.

### Layout assertion

```zig
comptime std.debug.assert(@sizeOf(win_sys.structs.WIN32_FIND_DATAW) == 592);
comptime std.debug.assert(@sizeOf(win_sys.structs.SYSTEM_INFO) == 48);
```

`extern struct` guarantees no field reordering, but the assert catches
deliberate edits that shift layout. Fires at comptime.

## Adding a new sample

1. Create `samples/<name>/main.zig`.
2. Append a `Sample` entry to `build.zig` (same block that lists `find-files`, etc.). Add `extra_libs` only if the APIs need something beyond `kernel32`.
3. Append the sample to the `$samples` PowerShell array in `.github/workflows/zig.yml`.
4. `zig build run-<name>` to smoke-test locally.
5. `zig build test` to confirm 73/75 baseline holds.

## Non-goals

- These samples are not a tutorial on Win32 APIs. They document projection shapes.
- They are not a replacement for the `compile-check` gauntlet in `build.zig` — that one regenerates 35 namespaces per target arch and type-checks them as a bundle. The samples only exercise the ~15 APIs their `project(...)` calls name.
- They do not run on non-Windows. `zig build samples` on Linux compiles but can't execute.
