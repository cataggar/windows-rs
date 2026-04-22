# WinRT — v0.2 scope

`windows-zig` v0.1 ships Win32 + classic COM (the latter still partial —
see [the classic-COM gap](#classic-com-gap) below). WinRT (parameterised
generics, `IInspectable`, activation factories, `HSTRING` pervasively,
async contracts) is deliberately deferred. This doc captures what v0.2
has to deliver and the order it'll be delivered in.

## What v0.1 already has

Enough WinRT plumbing exists that the emitter tests round-trip through
`Windows.Foundation` and a handful of `Windows.Globalization` types —
it's used to keep the classic-COM-path fixes honest.

- `win-core` has `HSTRING`, `IInspectable_Vtbl`, `IUnknown_Vtbl`, and
  the hand-written `error{...}` set that `HRESULT` maps into.
- `emitInterfaceVtbls` emits a `<Name>_Vtbl` for every non-generic
  WinRT interface in a namespace, anchored on
  `base: IInspectable_Vtbl`.
- `emitInterfaceHandles` emits `pub const IFoo = extern struct {
  vtable: *const IFoo_Vtbl }` with `QueryInterface` / `AddRef` /
  `Release` method wrappers.
- `emitRuntimeClasses` emits the default-interface handle for each
  `RuntimeClass`.
- Round-trip emitter tests cover `Windows.Foundation`,
  `Windows.Globalization`, and generic-arity skipping (the ``1``, ``2``
  typedefs are filtered out).

## What v0.1 explicitly doesn't have

These are the pieces that make WinRT *usable* from application code and
are intentionally parked for v0.2:

1. **`HSTRING` pervasively.** The type exists; the activation /
   marshalling path does not. No `HSTRING_HEADER`, no
   `WindowsCreateString` / `WindowsDeleteString` wrapping, no
   auto-conversion from `[]const u8` at method call sites.
2. **Activation factories.** `RoGetActivationFactory` is referenced
   only in emitter tests. There's no helper that turns a runtime-class
   name plus an interface type into a factory handle, no `Uri.create()`
   style surface.
3. **Parameterised generics (`IVector`1`, `IAsyncOperation`1`, …).**
   `emitInterfaceVtbls` skips names containing backticks. The emitter
   has no instantiation-per-use-site machinery.
4. **`IInspectable` surface beyond the vtable base.**
   `GetIids`, `GetRuntimeClassName`, `GetTrustLevel` are slots in the
   vtable but have no method wrappers on the handle types.
5. **Async contracts.** `IAsyncOperation`1`, `IAsyncAction`,
   `IAsyncInfo` — none of them project. Zig 0.16's new I/O interface
   is the natural destination here, but the mapping hasn't been
   designed yet.
6. **Event handlers / delegates across the ABI.** Delegate *fields* in
   structs now project (the `create_window` sample proves it), but
   WinRT `TypedEventHandler`1`,2`` and the add/remove token dance are
   not wrapped.
7. **`project()`-based comptime WinRT.** The comptime projection mode
   covers Win32 functions and records only. Everything WinRT-flavoured
   stays on the codegen path until v0.2 lands.

## Classic-COM gap

v0.1 is advertised as "Win32 + COM", but the COM half is still
incomplete:

- `emitInterfaceVtbls` hard-codes `base: IInspectable_Vtbl`, so it
  only emits vtbls for WinRT interfaces. Classic COM interfaces
  (`IUri`, `IFileDialog`, `IStream`, …) would need
  `base: IUnknown_Vtbl` with the `Extends` chain walked for deeper
  bases.
- `win-sys` intentionally doesn't emit vtables (it's the C surface);
  the `win` package is currently a 10-line placeholder, so there's
  nowhere for classic-COM vtables to land yet.
- `project()` has no COM path at all.

Consequence for samples: `sample_com_uri` (CreateUri + IUri::GetDomain /
GetPort) is blocked. The free-function import (`CreateUri` via
URLMON.dll) is trivially available through `project()`, but the
returned `**IUri` has no handle type to bind to. See
[v0.2 milestones](#v02-milestones) for where this is scheduled.

## v0.2 milestones

Ordered for incremental usability. Each milestone lands behind a
sample that exercises the feature end-to-end, same as the v0.1
pattern.

### M1 — Classic-COM vtable emitter

**Status: done** (checkpoints 118–125).

- Generalised `emitInterfaceVtbls` to walk the `Extends` chain:
  - `Extends == Windows.Win32.System.Com.IUnknown` → `base: IUnknown_Vtbl`.
  - `Extends == Windows.Foundation.IInspectable` → `base: IInspectable_Vtbl`.
  - Otherwise emit `base: <Parent>_Vtbl` and pull the parent's namespace
    into the cross-ns set.
- `win` package hosts classic-COM aggregates; `sample_com_uri` runs on CI
  and exercises `CreateUri` → `IUri::GetDomain` / `GetPort`.
- BSTR helpers live in `win-core` (`SysAllocString` / `SysFreeString`
  pairs are uniform, so they're hand-written, not generated).

### M2 — WinRT `HSTRING` round-trip

**Status: partial — raw HSTRING helpers done, method-wrapper
auto-conversion next.**

Done:
- `win-core` has `Hstring.create` / `Hstring.fromRaw` / `Hstring.slice`
  / `Hstring.deinit` wrapping `WindowsCreateString` /
  `WindowsGetStringRawBuffer` / `WindowsDeleteString`.
- `sample_hstring_roundtrip` canary exercises the round-trip.
- Emitter types WinRT method `HSTRING` params correctly (they compile
  and link through `winrt_uri`).

Pending — method-wrapper sugar:
- When a WinRT method takes `HSTRING`, the generated handle method
  should *also* accept `[]const u8` (or `[]const u16`) and manage the
  HSTRING lifetime internally. Today `winrt_uri` has to write
  `var url_h = try Hstring.create(url); defer url_h.deinit();` before
  every call; the goal is `factory_this.CreateUri("https://...", &raw)`.
- Symmetric convenience on the return side: when a WinRT method returns
  `HSTRING` via out-parameter (`IStringable.ToString(result: *HSTRING)`),
  expose an owned-`Hstring` variant the caller can `defer deinit`.
- Sample update: once both land, `winrt_uri` drops the explicit HSTRING
  dance entirely (~8 lines disappear).

### M3 — Activation factories

**Status: done** (checkpoints 126–128).

- Emitter adds `NAME`, `NAME_W`, `Factory`, and `Statics` aliases on
  every `RuntimeClass` so callers can write `Uri.NAME_W` / `Uri.Factory`
  / `Uri.Statics` instead of repeating attribute-derived strings.
- Emitter adds `pub const Vtbl = <Iface>_Vtbl;` to every interface
  handle so `Uri.Factory.Vtbl` and `IStringable.Vtbl` resolve without
  repeating the mangled suffix.
- `Windows.Foundation` shipped through the build-time bundle as
  `win.WinRT.Foundation` (split namespace to avoid colliding with the
  Win32 `Foundation` aliases).
- `winrt_uri` sample consumes the emitted surface: zero hand-written
  IID / class-name / vtbl constants on the projection side; only the
  generic COM plumbing (`activationFactory`, `cast`) routes through
  `win-core`.
- Dead-code candidates in `win-core` (`IID_IUriRuntimeClassFactory`,
  `IUriRuntimeClassFactory_Vtbl`, `IID_IStringable`,
  `IStringable_Vtbl`, hand-widened `"Windows.Foundation.Uri"`) are now
  redundant and can be removed once `win-core`'s own tests stop
  referencing them.

### M4 — Parameterised generics

- Drop the backtick-skip guard in `emitInterfaceVtbls` and friends.
- Per use-site instantiation: when a method signature references
  `IVector`1` with `T = HSTRING`, emit a unique
  `IVector_HSTRING_Vtbl` + handle at the first site and cache it.
- Sample: iterating a `Windows.Globalization.Calendar`'s
  `Languages` (`IVectorView`1<HSTRING>`).

### M5 — Async contracts (bridge to `std.Io`)

- Design doc first (non-trivial): how does `IAsyncOperation`1<T>`
  map to a Zig async primitive? Options:
  - `*Completion` style (register callback, drive loop yourself).
  - Bridge through `std.Io.async` once the final shape of 0.16's I/O
    interface settles.
- One sample per pattern that survives the design pass.

### M6 — Comptime WinRT

- Extend `project()` to accept WinRT interfaces and runtime classes.
- Gated by an explicit `.winrt = true` config so Win32-only callers
  pay nothing.
- Sample: `project({ .@"Windows.Globalization" = .{"Calendar"} })`
  with a size benchmark.

## Non-goals for v0.2

- Re-generating `.winmd` from headers. `tool_bindgen` /
  `windows-rdl` stays Rust-only. Zig consumes the vendored metadata.
- `IXmlHttpRequest2` / XAML / COM-apartment-aware marshalling beyond
  what a sample needs.
- A `c:\`-style safe-handle abstraction over every WinRT handle. The
  `extern struct { vtable: ... }` shape is the baseline; ergonomic
  wrappers ship per-sample as needed.

## Risks

- **`std.Io` churn.** Zig 0.16's I/O interface shape is still
  settling. M5 should not ship a design that has to rewrite itself
  after the 0.17 release.
- **Emitter re-entrance.** Generic instantiation (M4) needs a
  per-file cache that survives across `emitNamespace` calls when a
  method pulls a generic from a different namespace. The current
  `CrossNsSet` only records namespace names, not instantiation keys.
- **`HSTRING` allocator ownership.** `win-core` uses no allocator
  today; `HSTRING` helpers probably shouldn't pull one in either.
  The raw `HSTRING` handle can travel; only the UTF-8 conversion
  needs a buffer, and the caller supplies it.

## Definition of done for v0.2

- `sample_com_uri` runs on CI.
- At least one WinRT sample (Calendar or Uri) runs on CI with full
  `HSTRING` round-trip.
- A `project()` example pulls in a WinRT runtime class and calls a
  method, under a gated config.
- `docs/comptime-vs-codegen.md` updated with the WinRT cap numbers.
- This file is rewritten as a changelog, not a plan.
