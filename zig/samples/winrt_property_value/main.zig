//! WinRT array ABI end-to-end canary — round-trips an `i32` array
//! through `Windows.Foundation.PropertyValue`.
//!
//! Exercises both OUT Phase C WinRT array shapes introduced by
//! Issue #3:
//!
//!   * **PassArray** (`[in]` array) — `IPropertyValueStatics.CreateInt32Array(size, ptr, result)`.
//!     The emitter lowers the single sig param to the split-pair
//!     `p0_size: u32, p0_ptr: [*]const i32`.
//!   * **ReceiveArray** (`[out]` array with BYREF) —
//!     `IPropertyValue.GetInt32Array(size, ptr)`. Lowered to
//!     `p0_size: *u32, p0_ptr: *[*]i32`. Callee-allocated, so the
//!     sample frees the returned buffer via `CoTaskMemFree`.
//!
//! Contrast with `winrt_uri` / `winrt_calendar`: those pre-date the
//! array ABI and only moved through HSTRING / generic-reference
//! out-params. This sample is the first to round-trip a bulk-data
//! array shape.

const std = @import("std");
const win = @import("win");

const core = win.core;
const IInspectable = core.IInspectable;

const Foundation = win.WinRT.Foundation;
const PropertyValue = Foundation.PropertyValue;
const IPropertyValue = Foundation.IPropertyValue;

// `CoTaskMemFree` isn't part of `win-core`'s minimal WinRT surface;
// WinRT callee-allocated arrays hand ownership to the caller via this
// allocator. Link is handled by the sample registering `ole32` in
// `build.zig`.
extern "ole32" fn CoTaskMemFree(ptr: ?*anyopaque) callconv(.winapi) void;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    const statics = try PropertyValue.statics();
    defer statics.deinit();

    const statics_this: *const PropertyValue.Statics =
        @ptrCast(@alignCast(statics.ptr));

    // --- PassArray: box up an `[in]` array into an IPropertyValue.
    const input = [_]i32{ 1, 2, 4, 8, 16 };

    var boxed_raw: ?*const anyopaque = null;
    try core.hresult.ok(statics_this.CreateInt32Array(
        @intCast(input.len),
        &input,
        &boxed_raw,
    ));
    const boxed: IInspectable = .{ .ptr = @ptrCast(@alignCast(@constCast(boxed_raw.?))) };
    defer boxed.deinit();

    // --- QI to the IPropertyValue face so we can read the array back.
    const prop = try boxed.cast(IPropertyValue.Vtbl, &IPropertyValue.IID);
    defer prop.deinit();

    const prop_this: *const IPropertyValue = @ptrCast(@alignCast(prop.ptr));

    // --- ReceiveArray: the callee allocates and hands back
    //     `(size, ptr)`. The split-pair is the whole point of Phase C —
    //     before the fix this slot was opaque and a Zig caller had no
    //     way to reach the data.
    var out_size: u32 = 0;
    var out_ptr: [*]i32 = undefined;
    try core.hresult.ok(prop_this.GetInt32Array(&out_size, &out_ptr));
    defer CoTaskMemFree(out_ptr);

    var stdout_buf: [512]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    try stdout.print("PropertyValue.GetInt32Array -> size={d} [", .{out_size});
    var i: u32 = 0;
    while (i < out_size) : (i += 1) {
        if (i != 0) try stdout.print(", ", .{});
        try stdout.print("{d}", .{out_ptr[i]});
    }
    try stdout.print("]\n", .{});
    try stdout.flush();

    // Sanity: the round-trip must be value-preserving.
    if (out_size != input.len) return error.SizeMismatch;
    i = 0;
    while (i < out_size) : (i += 1) {
        if (out_ptr[i] != input[i]) return error.ValueMismatch;
    }
}
