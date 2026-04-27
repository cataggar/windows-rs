# Generic delegates and add/remove-handler sugar

WinRT's event model is built on **delegates** — small COM-callable
function objects that the runtime invokes when an event fires. The two
canonical generic delegates are:

- `Windows.Foundation.EventHandler<T>` — `Invoke(sender: object, args: T)`
- `Windows.Foundation.TypedEventHandler<TSender, TArgs>` —
  `Invoke(sender: TSender, args: TArgs)`

Plus a long tail of one-off generic delegates (`AsyncOperationCompletedHandler<T>`,
`AsyncOperationProgressHandler<T,P>`, etc.) used by the async contracts.

After issue #13 the Zig emitter reaches **closed-generic instantiations**
of these delegates: for each `(TypedEventHandler, T, U)` referenced by
the corpus we emit a typed handle struct, a typed `_Vtbl` with the
`Invoke` slot, and a parameterised IID constant.

Issue #14 lands the runtime + codegen pieces that make these instantiations
actually **usable** from Zig — so a caller can register a handler on a
WinRT event source, hold the registration token, and unregister it
later.

## ABI in one page

A WinRT delegate is a COM object whose vtable is `IUnknown` plus a
single `Invoke` slot. Specifically:

| Slot | Method                                | Notes |
|------|---------------------------------------|-------|
| 0    | `QueryInterface(riid, ppv)`           | Must succeed for `IID_IUnknown`, the delegate's own IID, and `IID_IAgileObject` (marker, returns `self`). |
| 1    | `AddRef()`                            | Increments the strong count. |
| 2    | `Release()`                           | Decrements; frees on zero. |
| 3    | `Invoke(arg0, arg1, ...)`             | Signature matches the delegate's `Invoke` method in winmd. Returns `HRESULT`. |

The thing that trips up every fresh implementation: WinRT delegates
**do not extend `IInspectable`**. In winmd they are
`extends System.MulticastDelegate`, which the runtime treats as a sibling
of `Object`, not a subclass. So the vtable layout is `IUnknown_Vtbl + Invoke`
(4 slots), **not** `IInspectable_Vtbl + Invoke` (7 slots). Confusing,
because every other WinRT type does extend `IInspectable`.

The Zig emitter's closed-generic instantiation path now reflects this:
when the closed type's open template has `extends MulticastDelegate`,
the emitted `_Vtbl` uses `base: IUnknown_Vtbl`. Otherwise (true WinRT
interface) it uses `base: IInspectable_Vtbl`. See the regression test
`"closed-generic delegate vtbl uses IUnknown_Vtbl base, not
IInspectable_Vtbl"` in `winbindgen` and the matching code in
`emitGenericInstantiations`. Without this fix the emitted `Invoke`
slot would be three vtbl entries too late and any call would dispatch
into garbage; the M0 fix is the correctness foundation that M1's
`Delegate` helper relies on.

### IAgileObject

Almost every WinRT event source marshals its handlers between
apartments. If `QueryInterface(IID_IAgileObject)` returns `E_NOINTERFACE`,
the runtime falls back to slow proxying paths and (worse) some sources
hard-fail with `RPC_E_WRONG_THREAD`. The handler **must** answer yes to
`IID_IAgileObject` even though it has no methods of its own — return
`self` and `AddRef`. M1 unit-tests this explicitly.

### EventRegistrationToken

The `add_*` family on event sources returns
`Windows.Win32.System.WinRT.EventRegistrationToken` — a single `i64`
field — by value. The corresponding `remove_*` takes that token by
value. `0` is a **valid** token for some sources (notably statics-only
event sources), so callers and the helper must not treat zero as
"no registration". M1's helper preserves whatever the runtime hands
back.

## Carry-over plan (M0–M5)

This is the M0 design landing. Implementation is staged across five
PRs against `cataggar:zig`:

| M  | Title                                       | Notes |
|----|---------------------------------------------|-------|
| M0 | Plan + ABI fix + design doc                 | This doc, the `IUnknown_Vtbl` base fix in `emitGenericInstantiations`, and the regression test. |
| M1 | `win_core.Delegate` helper                  | Heap-allocated vtbl + 16-byte ref-count header, raw vtbl-style callback ABI, IAgileObject in QI, fired-once unit test. |
| M2 | Event-pair detection in winbindgen          | Recognise `(add_X, remove_X)` pairs by signature shape. |
| M3 | Sugar emission on interfaces                | `addX(self, callback, ctx) !EventToken` + `removeX(self, token) !void` per detected pair. |
| M4 | Smoke sample                                | Live `winrt_event` sample using `IMemoryBufferReference.add_Closed`. |
| M5 | Doc + close #14                             | Move bullet from "deferred" to "shipped"; finalise this doc. |

## Reference implementation (M1 target)

For concreteness, here is the shape M1 will land in `win-core`. This
is intentionally written as a hand-built reference — the production
code in M1 will be generic over `InvokeFn` and `iid` via comptime, but
the runtime mechanics are exactly these.

```zig
// PSEUDO-CODE — see win-core/src/root.zig in M1 for the real version.

const Header = extern struct {
    vtbl: *const _Vtbl,           // points to a comptime-built static
    refcount: std.atomic.Value(u32),
    callback: *const InvokeFn,
    ctx: ?*anyopaque,
};

fn QueryInterface(self: *Header, riid: *const GUID, ppv: *?*anyopaque) callconv(.c) HRESULT {
    if (eq(riid, &IID_IUnknown) or eq(riid, &iid) or eq(riid, &IID_IAgileObject)) {
        _ = self.refcount.fetchAdd(1, .acq_rel);
        ppv.* = @ptrCast(self);
        return S_OK;
    }
    ppv.* = null;
    return E_NOINTERFACE;
}

fn AddRef(self: *Header) callconv(.c) u32 {
    return self.refcount.fetchAdd(1, .acq_rel) + 1;
}

fn Release(self: *Header) callconv(.c) u32 {
    const prev = self.refcount.fetchSub(1, .acq_rel);
    if (prev == 1) std.heap.c_allocator.destroy(self);
    return prev - 1;
}

fn Invoke(self: *Header, arg0: ..., arg1: ...) callconv(.c) HRESULT {
    return self.callback(self.ctx, arg0, arg1);
}

// Public surface:
pub fn Delegate(comptime InvokeFn: type, comptime iid: GUID) type {
    return struct {
        const Self = @This();
        pub const _Vtbl = ...; // IUnknown + Invoke

        pub fn init(callback: *const InvokeFn, ctx: ?*anyopaque) !*Self { ... }
        pub fn asInterface(self: *Self) *anyopaque { return @ptrCast(self); }
    };
}
```

The caller wires it through M3-emitted sugar:

```zig
// M3 emits this method on IMemoryBufferReference:
const token = try buf_ref.addClosed(&onClosed, @ptrCast(state));
defer buf_ref.removeClosed(token) catch {};
```

## Lifetime and ownership

- The `Delegate.init` allocation is owned by the runtime: every
  successful `add_X` causes the runtime to `AddRef`, every fired
  invocation comes through the same vtbl, and `remove_X` (or final
  source teardown) hits `Release`. The Zig caller does **not**
  free the allocation directly.
- The `ctx` pointer is borrowed: the caller is responsible for
  ensuring `ctx` outlives the registration. The ergonomic wrapper
  in M5 may offer an arena-owned variant.
- `EventToken` is `Copy` — pass by value freely.
- A delegate that fires synchronously from inside `add_X` (some
  sources do this when state is already in the target condition) is
  legal and the helper handles it; the M4 smoke test exercises this.

## Out of scope for #14

- Non-`addX/removeX` event patterns (statics-only event sources,
  e.g. `CoreApplication.Suspending`).
- Async-bridge consumption of `TypedEventHandler` for
  `IAsyncOperation.put_Completed` (issue #4 picks that up — the
  delegate machinery here lands the foundation).
- Multi-listener registries / weak-reference lifecycle. Callers
  manage their own `EventToken`.
- A Zig-friendly callback ABI (`fn(args...) !void` with HRESULT
  translated). M0–M3 use the raw vtbl-style ABI for zero
  translation cost; M5 may revisit.
