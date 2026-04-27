//! WinRT event-sugar canary — exercises the M3 emitted
//! `addClosed` / `removeClosed` companions on
//! `Windows.Foundation.IMemoryBufferReference`.
//!
//! Pipeline being validated end-to-end:
//!
//!   1. `winbindgen` matches `(add_Closed, remove_Closed)` on
//!      `IMemoryBufferReference` and emits same-namespace
//!      closed-generic sugar (`addClosed` / `removeClosed`) bound
//!      to `TypedEventHandler__G2__Windows_Foundation_IMemoryBufferReference__object`.
//!   2. The emitted body wires the user's typed `invoke` fn ptr
//!      through `win_core.Delegate`, dispatches the raw
//!      `add_Closed(handler, &token)` ABI slot, and translates
//!      HRESULT into `win_core.hresult.Error`.
//!   3. Closing the `IMemoryBufferReference` (via its `IClosable`
//!      facet) fires the `Closed` event synchronously back into our
//!      Zig invoke body.
//!
//! The whole sample contains zero hand-written IID / vtable /
//! mangled-name strings — every COM type comes from the winmd, and
//! every event-sugar helper comes from the emitter.
//!
//! Compare with `winrt_calendar` (read-only WinRT canary) and
//! `winrt_property_set` (mutable WinRT canary): this is the first
//! sample that exercises a WinRT *callback* surface.
//!
//! Build: `zig build winrt-event-sugar`
//! Run:   `.\zig-out\bin\winrt-event-sugar.exe`

const std = @import("std");
const win = @import("win");

const core = win.core;
const HRESULT = core.HRESULT;
const IInspectable = core.IInspectable;

const Foundation = win.WinRT.Foundation;
const MemoryBuffer = Foundation.MemoryBuffer;
const IMemoryBuffer = Foundation.IMemoryBuffer;
const IMemoryBufferReference = Foundation.IMemoryBufferReference;
const IClosable = Foundation.IClosable;

/// Scratch state passed into the `invoke` body via
/// `addClosed(allocator, invoke, user_data)`. The emitter encodes
/// `user_data` as `?*anyopaque`; we recover it inside the body via
/// `win_core.Delegate(...).userData(this)`.
const Counter = struct {
    fired: u32 = 0,
};

/// `TypedEventHandler<IMemoryBufferReference, IInspectable>::Invoke`.
/// The signature is taken straight from the closed-generic
/// `_Vtbl.Invoke` field — so the `this` pointer is *typed* (not
/// `*anyopaque`) and ABI-compatible with `win_core.Delegate.Instance`.
fn onClosed(
    this: *const Foundation.TypedEventHandler__G2__Windows_Foundation_IMemoryBufferReference__object,
    sender: *IMemoryBufferReference,
    args: ?*const anyopaque,
) callconv(.winapi) HRESULT {
    _ = args;
    _ = sender;

    // Recover `Counter*` set up before `addClosed`. The
    // `userData` helper unpacks the offset-0 `Instance` header
    // that `win_core.Delegate` lays out behind every typed handle.
    const D = core.Delegate(@TypeOf(onClosed), Foundation.TypedEventHandler__G2__Windows_Foundation_IMemoryBufferReference__object.IID);
    const ctx_raw = D.userData(@ptrCast(@constCast(this))) orelse return 0;
    const ctx: *Counter = @ptrCast(@alignCast(ctx_raw));
    ctx.fired += 1;
    return 0;
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var stdout_buf: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    // Activate `Windows.Foundation.MemoryBuffer` (capacity = 16
    // bytes; the actual buffer is irrelevant — we only need a
    // reference whose `Closed` event we can fire).
    const factory = try MemoryBuffer.factory();
    defer factory.deinit();

    const factory_this: *const MemoryBuffer.Factory =
        @ptrCast(@alignCast(factory.ptr));

    var mb: *MemoryBuffer = undefined;
    try core.hresult.ok(factory_this.Create(16, &mb));
    const mb_insp: IInspectable = .{ .ptr = @ptrCast(@alignCast(mb)) };
    defer mb_insp.deinit();

    // `MemoryBuffer` shares `IMemoryBuffer`'s vtable layout — reinterpret
    // so we can call `CreateReference()` (declared on the interface).
    const mb_iface: *const IMemoryBuffer = @ptrCast(@alignCast(mb));

    // `CreateReference()` hands back an `IMemoryBufferReference`
    // whose `Closed` event fires on `IClosable.Close`.
    var ref: *IMemoryBufferReference = undefined;
    try core.hresult.ok(mb_iface.CreateReference(&ref));
    const ref_insp: IInspectable = .{ .ptr = @ptrCast(@alignCast(ref)) };
    defer ref_insp.deinit();

    // ---------- The whole point of the sample ----------
    //
    // `addClosed` is the M3 sugar. Caller supplies a typed `invoke`
    // fn ptr + opaque user data; the emitter wires both through
    // `win_core.Delegate` and dispatches the raw `add_Closed` slot.
    var counter: Counter = .{};
    // Any allocator works — `Delegate.create` only needs to alloc the
    // refcount-tracking `Instance` header. Page allocator avoids
    // pulling in `GeneralPurposeAllocator` / `DebugAllocator` cfg
    // surface.
    const allocator = std.heap.page_allocator;

    const token = try ref.addClosed(allocator, &onClosed, &counter);

    // Fire the event by closing the reference (cast to `IClosable`).
    const closable = ref.cast(IClosable) orelse return error.NoIClosable;
    try core.hresult.ok(closable.Close());

    // Best-effort unregister — the event source has already fired,
    // but verifying the sugar's removeClosed path is part of the
    // canary. Errors here are non-fatal.
    ref.removeClosed(token) catch {};

    try stdout.print(
        "MemoryBuffer.Closed fired {d} time(s) (expected 1)\n",
        .{counter.fired},
    );
    try stdout.flush();

    if (counter.fired != 1) return error.UnexpectedEventCount;
}
