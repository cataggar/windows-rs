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

**Status: done** (checkpoints 129–130).

Done:
- `win-core` has `Hstring.create` / `Hstring.fromRaw` / `Hstring.slice`
  / `Hstring.deinit` wrapping `WindowsCreateString` /
  `WindowsGetStringRawBuffer` / `WindowsDeleteString`.
- `sample_hstring_roundtrip` canary exercises the round-trip.
- Emitter types WinRT method `HSTRING` params correctly (they compile
  and link through `winrt_uri`).
- **Input sugar** (checkpoint 129): emitter adds
  `<Method>FromUtf16` companion on every method with an HSTRING input.
  Accepts `[]const u16`, handles `Hstring.create`/`deinit` internally,
  maps allocator failure to `E_OUTOFMEMORY`. `winrt_uri` uses
  `factory_this.CreateUriFromUtf16(url, &raw)` directly.
- **Return sugar** (checkpoint 130): emitter adds `<Method>Owned`
  companion on every method that returns an HSTRING via split
  `result: *HSTRING`. Returns `!win_core.Hstring`, translates HRESULT
  through `win_core.hresult.ok`, wraps the raw handle via
  `Hstring.fromRaw` for caller `defer deinit()`. `winrt_uri` uses
  `stringable_this.ToStringOwned()`.

Follow-on (not blocking closure):
- Combined `<Method>OwnedFromUtf16` for methods taking HSTRING in *and*
  out. Not needed for any v0.2 sample; emit on demand when a sample
  calls for it.
- `win-core` dead-code cleanup — delete hand-written
  `IID_IStringable` / `IStringable_Vtbl` /
  `IID_IUriRuntimeClassFactory` / `IUriRuntimeClassFactory_Vtbl` and
  the self-referencing `win-core` test that still blocks them.

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

**Status: Phase 4b landed (cross-namespace registry + instantiation emission).**

**Design:**

- **Location.** Closed instantiations live in the *generic's* home
  namespace, not the use-site. `IVectorView__G1__HSTRING` is emitted
  into `Windows.Foundation.Collections`; every caller references it
  as `@"Windows.Foundation.Collections".IVectorView__G1__HSTRING`.
  Use-site emission would produce nominally-duplicate types that
  fail to round-trip across namespaces — a type-identity bug, not
  just cosmetic duplication.
- **Mangling.** Structural and collision-free: `<Def>__G<arity>__<arg>__<arg>`,
  with `arg` = primitive Zig name (`i32`, `HSTRING`) for built-ins or
  `Ns_Dotted_Name` for class/value refs. Nested generics recurse
  (`IVector__G1__IReference__G1__i32`). Under-uglification is fine;
  ambiguity is not.
- **Open generic defs stay unemitted.** The backtick skip in
  `emitInterfaceVtbls`/`emitInterfaceHandles` is **not** removed —
  open generics exist only as *templates*. The emitter walks them at
  instantiation time, substitutes `ELEMENT_TYPE_VAR`, and produces a
  fresh closed `_Vtbl` / handle pair.
- **Substitution.** `writeZigTy` grows a `type_args: ?[]const Ty`
  parameter. When set, `.var_generic = n` resolves to `type_args[n]`.
  `.mvar_generic` stays `UnsupportedElement` for M4 — generic methods
  are not in scope.
- **Registry.** Per-bundle-run set keyed by `(generic typedef token,
  serialized args)`. Every namespace-emit call appends its used
  instantiations; the bundle driver iterates until fixpoint, then
  re-emits home namespaces with their pending instantiation list.
- **IID scoped out.** WinRT's parameterized-IID algorithm (runtime
  SHA-1 over a per-instantiation blob) is **not** in M4. `cast()` /
  `QueryInterface` against a closed generic stays unsupported.
  Samples that only need the vtable surface (direct factory return)
  work; anything requiring QI onto a closed generic does not.
- **Generic delegates out.** `EventHandler\`1` etc. stay unsupported
  until a sample demands them.

**Phased bring-up:**

0. **Phase 4a.0 — `.object` representability (landed).** Probing
   Windows.Foundation sigs revealed the original Phase 4a premise was
   wrong: `IPropertyValueStatics.CreateInt32` &c. do **not** decode to
   `.class_name{IReference, [i32]}`. Their return type is
   `ELEMENT_TYPE_OBJECT` (System.Object / IInspectable*) — the
   `IReference<T>` shape is a semantic projection, not sig content.
   The practical unblock was therefore tiny: add `.object` to
   `canRepresent` and emit it as `?*const anyopaque` in `writeZigTy`.
   This lit up 20 of the 39 `IPropertyValueStatics.Create*` vtbl
   slots as typed (`p0: i32`, `p0: HSTRING`, …) with a trailing
   `result: *?*const anyopaque` out-param. The 19 `*Array`
   variants still fall back to opaque — they need separate SZARRAY
   support. Closed-generic instantiation machinery (`GenericInstSet`,
   mangler helpers, `substituteTy`) landed as dormant infra for M4
   Phase 4b; today no sig in Windows.Foundation actually triggers it.
1. **Phase 4a — `IReference<T>` single-namespace bring-up (deferred
   pending real consumer).** A corpus-wide probe across
   `Windows.Foundation` sigs found exactly ONE closed-generic method
   parameter (`TypedEventHandler<IMemoryBufferReference, object>` on
   `IMemoryBufferReference.add_Closed`) — a two-arg class instantiation,
   not a primitive `IReference<i32>`. Until a sample demands a
   closed-generic surface that actually appears in a sig, the mangler
   sits inert. When a consumer forces the issue, wire `emitNamespace`
   to drain the `GenericInstSet` and emit `<Mangled>` / `<Mangled>_Vtbl`
   structs.
2. **Phase 4b — cross-namespace generic instantiation registry
   (landed).**  `isMangleableArg` now accepts `.class_name`,
   `.value_name`, and `.object` args (with recursive nesting).
   `writeArgMangle` encodes namespace-qualified args as
   `Ns_Dotted_Name` (dots → underscores). `writeZigTy` lifts the
   same-namespace gate: cross-namespace generics emit
   `*@"<home-ns>".MangledName` and add the home namespace to the
   `CrossNsSet` for `@import` generation.
   `collectGenericInstantiations` scans all method sigs in a namespace
   to discover same-home closed generics. `emitGenericInstantiations`
   drains the set with a worklist-based fixpoint (max 64 iterations)
   to handle transitive generics (e.g. `IVector<T>` → `IIterator<T>`).
   `emitNamespaceEx` accepts optional `extra_insts` seeds for bundle
   drivers to route cross-namespace instantiations.
   The one same-namespace closed generic in the current corpus
   (`TypedEventHandler`2<IMemoryBufferReference, object>` on
   `IMemoryBufferReference.add_Closed`) now produces a typed handle
   + vtbl instead of falling back to `*anyopaque`.
3. **Phase 4c — `Calendar.Languages` shipped canary (deferred, depends
   on 4b).** Downstream of 4b. `IVectorView\`1<HSTRING>` is reached
   today via the open-generic `GetAt` on `IVectorView\`1` — which lives
   in `Windows.Foundation.Collections` where all sig types are `VAR`
   references (open), not closed instantiations. A consumer sample
   would still compile today against the opaque-`*anyopaque` fallback,
   just without the typed-handle ergonomics 4b/4c would provide.

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
- **Emitter re-entrance (mitigated by Phase 4b).** Generic
  instantiation now uses `collectGenericInstantiations` for
  same-namespace discovery and `emitNamespaceEx` with `extra_insts`
  for cross-namespace routing. The `CrossNsSet` records namespace
  names for `@import`; the `GenericInstSet` tracks instantiation keys
  separately. Bundle drivers coordinate cross-namespace seeds.
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
