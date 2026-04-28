# Async bridge — blocking wait for WinRT async contracts

WinRT's four async contracts — `IAsyncAction`, `IAsyncOperation<T>`,
`IAsyncActionWithProgress<P>`, `IAsyncOperationWithProgress<T,P>` —
underpin virtually every modern Windows API. This document describes
how the Zig projection bridges them with a minimal, safe helper in
`win-core`.

## The four contracts

All four extend `IAsyncInfo`, which provides:

| Method           | Returns       | Purpose                           |
|------------------|---------------|-----------------------------------|
| `get_Id`         | `u32`         | Opaque operation identifier       |
| `get_Status`     | `AsyncStatus` | `Started`, `Completed`, `Canceled`, `Error` |
| `get_ErrorCode`  | `HRESULT`     | Set when status is `Error`        |
| `Cancel`         | `void`        | Request cancellation              |
| `Close`          | `void`        | Release resources                 |

Each concrete contract adds:

| Contract                             | `put_Completed` handler type               | `GetResults` returns |
|--------------------------------------|--------------------------------------------|----------------------|
| `IAsyncAction`                       | `AsyncActionCompletedHandler`              | `void`               |
| `IAsyncOperation<T>`                 | `AsyncOperationCompletedHandler<T>`        | `T`                  |
| `IAsyncActionWithProgress<P>`        | `AsyncActionWithProgressCompletedHandler<P>` | `void`             |
| `IAsyncOperationWithProgress<T,P>`   | `AsyncOperationWithProgressCompletedHandler<T,P>` | `T`           |

## Design decision: block-on-signal

Zig 0.16's `std.Io` async interface is still settling. Designing a
native `async fn` bridge now risks a rewrite on 0.17. Instead, we use
the same pattern Rust `windows-rs` uses internally:

1. Create a Win32 manual-reset event (`CreateEventW`).
2. Construct a completion-handler delegate whose `Invoke` body calls
   `SetEvent` on that event handle.
3. Register via `put_Completed`.
4. `WaitForSingleObject(event, INFINITE)` — blocks the calling thread.
5. After wakeup, read status and results.

This is correct, simple, and works on every Windows version. A future
v0.4+ milestone can layer `std.Io` on top without changing the public
API shape.

## API surface

```zig
const Async = win_core.Async;

// IAsyncAction — no result
try Async.wait(allocator, async_action);

// IAsyncOperation<T> — returns T
const value = try Async.waitResult(i32, allocator, async_op);
```

### `Async.wait`

```zig
pub fn wait(
    allocator: std.mem.Allocator,
    action: *IAsyncAction,
) (hresult.Error || error{OutOfMemory})!void
```

Blocks until the async action completes. On success returns `void`.
On failure propagates the operation's error code via `hresult.toError`.
On cancellation returns `error.Aborted`.

### `Async.waitResult`

```zig
pub fn waitResult(
    comptime T: type,
    allocator: std.mem.Allocator,
    operation: *IAsyncOperation_T,
) (hresult.Error || error{OutOfMemory})!T
```

Blocks until the async operation completes. Returns `T` (the result
of `GetResults`). Same error propagation as `wait`.

## Completion handler flow

```
caller
  │
  ▼
Async.wait(allocator, async_action)
  │
  ├─ 1. CreateEventW(null, TRUE, FALSE, null) → hEvent
  │
  ├─ 2. Delegate(CompletedHandlerInvoke, handler_IID)
  │      .create(allocator, &onCompleted, hEvent)
  │      → COM delegate with refcount 1
  │
  ├─ 3. async_action.put_Completed(delegate)
  │     (runtime AddRefs internally)
  │
  ├─ 4. WaitForSingleObject(hEvent, INFINITE)
  │     ← blocks until onCompleted fires SetEvent
  │
  ├─ 5. QI async_action → IAsyncInfo
  │     get_Status →
  │       .Completed → GetResults → return void
  │       .Canceled  → return error.Aborted
  │       .Error     → get_ErrorCode → hresult.toError
  │
  ├─ 6. Delegate.release(delegate)
  │
  └─ 7. CloseHandle(hEvent)
```

The `onCompleted` delegate invoke body:

```zig
fn onCompleted(
    this: *anyopaque,
    _: *anyopaque,   // asyncInfo (unused — we QI separately)
    _: AsyncStatus,  // status (unused — we read it separately)
) callconv(.winapi) HRESULT {
    const event_handle: HANDLE = @ptrCast(
        Delegate.userData(this) orelse return hresult.E_FAIL,
    );
    _ = SetEvent(event_handle);
    return hresult.S_OK;
}
```

## Error propagation

After the wait completes, the helper reads `IAsyncInfo.get_Status`:

| `AsyncStatus` | Action |
|---------------|--------|
| `Completed`   | Call `GetResults()` and return normally. |
| `Canceled`    | Return `error.Aborted` (matches `E_ABORT` semantics). |
| `Error`       | Read `get_ErrorCode` → `hresult.toError(hr)`. The raw HRESULT is stashed in `hresult.last_hresult` for callers that need it. |

## Delegate reuse

The completion handler delegate is constructed via the same
`win_core.Delegate(VtblInvokeFn, iid)` helper shipped in issue #14
(see `zig/docs/generic-delegates.md`). The delegate:

- Implements `QueryInterface` for `IUnknown`, `IAgileObject`, and the
  handler's own IID.
- Uses atomic ref-counting; freed when count hits zero.
- Stores the Win32 event handle as `user_data`.

## Lifetime and threading

- The delegate is created with refcount 1. `put_Completed` AddRefs
  internally. After registration the helper Releases its own
  reference, leaving the runtime as sole owner.
- The `onCompleted` body runs on whatever thread the async operation
  completes on (typically an MTA thread pool thread). `SetEvent` is
  inherently thread-safe.
- Some operations complete synchronously within `put_Completed`. The
  manual-reset event handles this: `SetEvent` fires before
  `WaitForSingleObject`, which returns immediately.

## What's deferred

- **Progress handlers.** `IAsyncActionWithProgress<P>` and
  `IAsyncOperationWithProgress<T,P>` have a `put_Progress` method.
  The blocking wait works for completion; progress callbacks are
  deferred.
- **Cancellation tokens.** Callers can still call
  `IAsyncInfo.Cancel()` directly on the raw interface. A structured
  cancel-token abstraction is future work.
- **Zig native async.** A `std.Io`-based non-blocking bridge is
  deferred to v0.4+ when the Zig I/O interface stabilises.
- **Timeout support.** `WaitForSingleObject` accepts a timeout in
  milliseconds. Adding a timeout parameter is straightforward but
  deferred to keep the initial API minimal.
- **Emitter sugar.** Auto-wrapping async-returning methods with
  blocking wait companions is deferred. Callers use `Async.wait` /
  `Async.waitResult` explicitly.

## Status

- [x] M0 plan + design doc (commit `bf7190563`)
- [x] M1 `Async.wait` — IAsyncAction blocking wait (commit `bf7190563`)
- [x] M2 `Async.waitResult` — IAsyncOperation<T> (commit `08f331cf9`)
- [x] M3 Sample + integration (commit `ad67d6aa4`)
- [x] M4 Doc + close #4
