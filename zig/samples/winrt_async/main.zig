//! WinRT async-bridge canary — exercises `win_core.Async.wait`
//! on a real `IAsyncAction` returned by `ThreadPool.RunAsync`.
//!
//! Pipeline validated:
//!   1. `ThreadPool.statics()` → activation factory for the static class.
//!   2. `Delegate` creates a `WorkItemHandler` whose `Invoke` body
//!      increments a counter (proving the work item ran).
//!   3. `RunAsync(handler)` → `IAsyncAction`.
//!   4. `Async.wait(allocator, action)` blocks until the thread-pool
//!      work item completes.
//!   5. After `wait` returns, the counter proves the work item fired.
//!
//! Build:  `zig build winrt-async`
//! Run:    `.\zig-out\bin\winrt-async.exe`

const std = @import("std");
const win = @import("win");

const core = win.core;
const HRESULT = core.HRESULT;
const Async = core.Async;

const Foundation = win.WinRT.Foundation;
const Threading = win.WinRT.System.Threading;
const ThreadPool = Threading.ThreadPool;

/// IID for WorkItemHandler: {1D1A8B8B-FA66-414F-9CBD-B65FC99D17FA}
const IID_WorkItemHandler = core.GUID.parse("1D1A8B8B-FA66-414F-9CBD-B65FC99D17FA");

/// WorkItemHandler.Invoke signature: fn(this, asyncAction) -> HRESULT
const WorkItemInvokeFn = fn (this: *anyopaque, asyncAction: *anyopaque) callconv(.winapi) HRESULT;

const WorkState = struct {
    fired: std.atomic.Value(u32),
};

fn onWorkItem(this: *anyopaque, _: *anyopaque) callconv(.winapi) HRESULT {
    const D = core.Delegate(WorkItemInvokeFn, IID_WorkItemHandler);
    const ud = D.userData(this) orelse return core.hresult.E_FAIL;
    const state: *WorkState = @ptrCast(@alignCast(ud));
    _ = state.fired.fetchAdd(1, .release);
    return core.hresult.S_OK;
}

pub fn main() !void {
    // MTA required for async bridge.
    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    const allocator = std.heap.page_allocator;

    // 1. Get ThreadPool statics.
    const pool = try ThreadPool.statics();
    defer pool.deinit();

    // 2. Create a WorkItemHandler delegate.
    var state = WorkState{ .fired = std.atomic.Value(u32).init(0) };
    const D = core.Delegate(WorkItemInvokeFn, IID_WorkItemHandler);
    const handler = D.create(allocator, &onWorkItem, @ptrCast(&state)) catch |e| {
        std.debug.print("Failed to create work item handler: {}\n", .{e});
        return error.DelegateFailed;
    };

    // 3. Call ThreadPool.RunAsync → IAsyncAction
    var action: *Foundation.IAsyncAction = undefined;
    const statics_ptr: *const Threading.IThreadPoolStatics = @ptrCast(@alignCast(pool.ptr));
    try core.hresult.ok(statics_ptr.RunAsync(@ptrCast(handler), @ptrCast(&action)));
    defer _ = action.Release();

    // Release our delegate reference — runtime AddRef'd.
    _ = D.release(handler);

    // 4. Block until the work item completes.
    try Async.wait(allocator, @ptrCast(action));

    // 5. Verify the work item fired.
    const count = state.fired.load(.acquire);
    std.debug.print("ThreadPool work item fired {d} time(s) (expected 1)\n", .{count});
    if (count != 1) {
        std.debug.print("ERROR: expected exactly 1 invocation\n", .{});
        return error.WorkItemNotFired;
    }
}
