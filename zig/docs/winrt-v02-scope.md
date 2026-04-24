# WinRT — v0.2 changelog

What `windows-zig` v0.2 delivered on top of v0.1.

v0.1 shipped Win32 + enough WinRT plumbing for the emitter's own
round-trip tests (`HSTRING` type, `IInspectable_Vtbl` /
`IUnknown_Vtbl` bases, interface vtbls and handles for non-generic
WinRT interfaces, default-interface handles for runtime classes). It
was not usable from application code — no activation path, no
`HSTRING` round-trip, no parameterised generics, no classic-COM
vtable emission, no activation ergonomics. v0.2 closed those gaps.

Milestones are ordered in ship order; each one landed behind at least
one CI-exercised sample.

## M1 — Classic-COM vtable emitter

Generalised `emitInterfaceVtbls` to walk the `Extends` chain:

- `Extends == Windows.Win32.System.Com.IUnknown` → `base: IUnknown_Vtbl`.
- `Extends == Windows.Foundation.IInspectable` → `base: IInspectable_Vtbl`.
- Otherwise → `base: <Parent>_Vtbl` with the parent's namespace added
  to the cross-namespace set.

The `win` package became the home for classic-COM aggregates;
`sample_com_uri` exercises `CreateUri` → `IUri::GetDomain` / `GetPort`
on CI. `BSTR` helpers live hand-written in `win-core`
(`SysAllocString` / `SysFreeString` pairs are too uniform to be
worth generating).

## M2 — WinRT `HSTRING` round-trip

`win-core` grew `Hstring.create` / `Hstring.fromRaw` /
`Hstring.slice` / `Hstring.deinit` wrapping `WindowsCreateString` /
`WindowsGetStringRawBuffer` / `WindowsDeleteString`. The emitter types
WinRT method `HSTRING` params correctly.

Two ergonomic companions land alongside:

- **Input sugar.** For every method with an `HSTRING` input the
  emitter adds a `<Method>FromUtf16` companion that accepts
  `[]const u16`, handles `Hstring.create` / `deinit` internally, and
  maps allocator failure to `E_OUTOFMEMORY`.
- **Return sugar.** For every method returning an `HSTRING` via
  split `result: *HSTRING` the emitter adds a `<Method>Owned`
  companion that returns `!win_core.Hstring`, translates `HRESULT`
  through `win_core.hresult.ok`, and wraps the raw handle for caller
  `defer deinit()`.

`sample_hstring_roundtrip` canary and `winrt_uri` exercise both
shapes.

A `<Method>OwnedFromUtf16` combined variant for methods taking
`HSTRING` in *and* out was designed but not emitted — no sample
demands it yet; it's available on request.

## M3 — Activation factories

Emitter additions on every `RuntimeClass`:

- `NAME` / `NAME_W` (UTF-8 / UTF-16 class name).
- `Factory` / `Statics` aliases pointing at the generated
  factory / statics interface struct.
- `pub const Vtbl = <Iface>_Vtbl` on every interface handle, so
  `Uri.Factory.Vtbl` resolves without repeating the mangled suffix.

`Windows.Foundation` shipped through the bundle as
`win.WinRT.Foundation` (the "WinRT" segment disambiguates from the
Win32 `Foundation` namespace).

`winrt_uri` consumes the emitted surface with zero hand-written IID
/ class-name / vtbl constants — only the generic COM plumbing
(`activationFactory`, `cast`) routes through `win-core`.

## M4 — Parameterised generics

The heaviest milestone; landed in four phases.

**Design decisions worth keeping:**

- **Location.** Closed instantiations live in the *generic's* home
  namespace, not the use-site. `IVectorView__G1__HSTRING` goes into
  `Windows.Foundation.Collections`; every caller references it as
  `@"Windows.Foundation.Collections".IVectorView__G1__HSTRING`.
  Use-site emission would produce nominally-duplicate types that
  break cross-namespace round-trip — a type-identity bug, not
  cosmetic duplication.
- **Mangling.** `<Def>__G<arity>__<arg>__<arg>`, with `arg` =
  primitive Zig name (`i32`, `HSTRING`) for built-ins or
  `Ns_Dotted_Name` for class / value refs. Nested generics recurse
  (`IVector__G1__IReference__G1__i32`). Structural and
  collision-free; readability is secondary to ambiguity avoidance.
- **Open generic defs stay unemitted.** The backtick-skip in
  `emitInterfaceVtbls` / `emitInterfaceHandles` is preserved — open
  generics exist only as templates. The emitter walks them at
  instantiation time, substitutes `ELEMENT_TYPE_VAR`, and produces
  a fresh closed `_Vtbl` / handle pair.
- **Substitution.** `writeZigTy` grew a `type_args: ?[]const Ty`
  parameter; `.var_generic = n` resolves through `type_args[n]`.
  `.mvar_generic` stays `UnsupportedElement` — generic *methods*
  remain out of scope.
- **Registry.** Per-bundle-run set keyed by `(generic typedef
  token, serialized args)`. Every namespace-emit call appends its
  used instantiations; the bundle driver iterates to fixpoint.

**Explicitly out of scope for v0.2:**

- **Parameterised IIDs.** WinRT's per-instantiation SHA-1 over a
  type blob is not implemented. `cast()` / `QueryInterface` onto a
  closed generic is unsupported. Samples that only need the vtable
  surface (direct factory return) work; anything requiring QI onto
  a closed generic does not.
- **Generic delegates** (`EventHandler`1`, `TypedEventHandler`2`
  as first-class). They round-trip through the registry enough to
  unblock sigs that reference them, but there's no sugar for
  add/remove-handler token dance.

**Phased bring-up:**

1. **Phase 4a.0 — `.object` representability.** Probing
   `Windows.Foundation` sigs revealed the original Phase 4a premise
   was wrong: `IPropertyValueStatics.CreateInt32` &c. decode to
   `ELEMENT_TYPE_OBJECT` (System.Object / IInspectable\*), not
   `IReference<i32>`. The practical unblock was tiny: add
   `.object` to `canRepresent`, emit as `?*const anyopaque` in
   `writeZigTy`. Lit up 20 of 39 `IPropertyValueStatics.Create*`
   vtbl slots as typed. Closed-generic machinery (`GenericInstSet`,
   mangler helpers, `substituteTy`) landed as dormant infra.
2. **Phase 4a — `IReference<T>` single-namespace bring-up
   (deferred).** Corpus probe found exactly one closed-generic
   method parameter in `Windows.Foundation`
   (`TypedEventHandler<IMemoryBufferReference, object>` on
   `IMemoryBufferReference.add_Closed`) — a two-arg class
   instantiation, not a primitive `IReference<i32>`. The
   single-namespace path would have been shippable but hollow; the
   work rolled into 4b.
3. **Phase 4b — cross-namespace generic instantiation registry.**
   `isMangleableArg` accepts `.class_name`, `.value_name`, and
   `.object` args with recursive nesting. `writeArgMangle` encodes
   namespace-qualified args as `Ns_Dotted_Name`. `writeZigTy`
   lifted the same-namespace gate; cross-namespace generics emit
   `*@"<home-ns>".MangledName` and add the home namespace to the
   `CrossNsSet` for `@import` generation.
   `collectGenericInstantiations` scans method sigs for same-home
   closed generics; `emitGenericInstantiations` drains the set with
   a worklist-based fixpoint (max 64 iterations) handling
   transitive generics (`IVector<T>` → `IIterator<T>`).
   `emitNamespaceEx` accepts optional `extra_insts` seeds for
   bundle drivers to route cross-namespace instantiations.
4. **Phase 4c — `Calendar.Languages` canary end-to-end.** Bundle
   driver grew `discoverCrossNsGenerics` (a pre-pass over every
   namespace's method sigs) that routes each instantiation to its
   home namespace and re-emits the home with an `extra_insts` seed
   list. The `--seed=` CLI flag is retained for bundle-external
   callers but the bundle itself no longer needs it.
   `Windows.Globalization`, `Windows.Foundation`, and
   `Windows.Foundation.Collections` went into `bundle_namespaces`
   in `build.zig`; the transitive closure (`Windows.System`,
   `Windows.UI.ViewManagement`, etc.) absorbed cleanly without a
   lazy-import-stub mechanism.
   `samples/winrt_calendar` activates `ApplicationLanguages`, calls
   `get_Languages`, and drives the resulting `IVectorView<HSTRING>`
   through typed `GetAt` / `get_Size` — all projection-side types
   come from the winmd via auto-routing. Method-overload dedup
   added to `emitInterfaceVtblsImpl` (suffixes `_2`, `_3`, ... for
   duplicate names like `Clone`, `GetWords`, `TimeZoneAsString`).
5. **Cross-arch unification (PR #8).** All four compile-check paths
   in `build.zig` (host-Windows `compile-check-bundle` and the
   x86/x64/arm64 cross-arch loop) use `winbindgen bundle --outdir`.
   Previously only host exercised cross-ns auto-routing; cross-arch
   emitted namespaces individually and accepted the weaker
   `*anyopaque` fallback. A regression in cross-ns closed-generic
   routing now surfaces on every target triple in CI.

## M5 — Async contracts

**Not shipped.** Zig 0.16's I/O interface shape was still settling
during v0.2; designing `IAsyncOperation`1<T>` → `std.Io.async`
risked a rewrite on 0.17. Deferred to v0.3.

Workaround for v0.2 consumers: drive `IAsyncOperation` manually by
registering a `*Completion` callback and pumping the loop yourself.

## M6 — WinRT activation ergonomics

Original scope draft: *"Extend `project()` to accept WinRT interfaces
and runtime classes, gated by `.winrt = true`."*

**Pivoted after rubber-duck critique.** `project()` pays off for
Win32 because `@extern` linking is symbol-gated — selecting a subset
of symbols genuinely shrinks the link surface. WinRT bundles are
emitted wholesale and Zig / LLD DCE already strips unused paths at
link time, so a WinRT `project()` filter would be ceremony without
a size story. The actual shipping gap was ergonomic: every call site
paid `core.activationFactory(Class.Factory.Vtbl, &Class.Factory.IID,
&Class.NAME_W)` — three tokens for one intent.

The pivot emits the sugar on the class struct itself:

```zig
pub const Uri = extern struct {
    vtable: *const IUriRuntimeClass_Vtbl,
    pub const NAME_W: [22]u16 = .{ ... };
    pub const Factory = IUriRuntimeClassFactory;
    pub const Statics = IUriEscapeStatics;

    pub fn factory() !win_core.Com(Factory.Vtbl) {
        return win_core.activationFactory(Factory.Vtbl, &Factory.IID, &NAME_W);
    }
    pub fn statics() !win_core.Com(Statics.Vtbl) {
        return win_core.activationFactory(Statics.Vtbl, &Statics.IID, &NAME_W);
    }
};
```

Emitted by `emitRuntimeClasses` alongside the existing `activate()`
for parameterless-activatable classes. Classes carrying
`Statics2` / `Statics3` sibling aliases get matching `statics2()` /
`statics3()` methods numbered to match. Gating piggy-backs on the
alias emission: no `Factory` alias → no `factory()` method.

Samples updated:

- `samples/winrt_uri`:
  `core.activationFactory(Uri.Factory.Vtbl, ...)` → `try Uri.factory()`.
- `samples/winrt_calendar`: same collapse for
  `ApplicationLanguages.statics()`.

DCE-driven size story documented quantitatively in
`docs/comptime-vs-codegen.md` (`## WinRT cap numbers`) as an M6
follow-up: 78 bundled WinRT namespaces, ~9.3 MB of generated Zig,
~490 KB `ReleaseSmall` exe for a single-class sample (DCE strips
>99 % of emitted vtables).

## Non-goals for v0.2 (held)

- Re-generating `.winmd` from headers. `tool_bindgen` /
  `windows-rdl` stays Rust-only; Zig consumes the vendored metadata.
- `IXmlHttpRequest2` / XAML / COM-apartment-aware marshalling
  beyond what a sample needs.
- A safe-handle abstraction over every WinRT handle. The
  `extern struct { vtable: ... }` shape is the baseline; ergonomic
  wrappers ship per-sample as needed.

## Carry-overs into v0.3

- **Parameterised IIDs** (SHA-1 over per-instantiation blob).
  Unlocks `cast()` / `QueryInterface` onto closed generics.
- **Async contracts** (M5 deferred above).
- **Generic delegates** with add/remove-handler sugar.
- **Generic methods** (`.mvar_generic` still resolves to
  `UnsupportedElement`).
- **`<Method>OwnedFromUtf16`** combined input-and-return HSTRING
  sugar, once a sample demands it.
