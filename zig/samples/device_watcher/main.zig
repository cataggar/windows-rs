//! Port of `crates/samples/windows/device_watcher` — enumerates
//! devices using WinRT `DeviceWatcher` with event callbacks.
//!
//! Exercises: WinRT activation, COM delegate construction (cross-
//! namespace `TypedEventHandler`), event registration via raw
//! `add_Added` / `add_EnumerationCompleted` vtable slots.
//!
//! Build:  `zig build device-watcher`
//! Run:    `.\zig-out\bin\device-watcher.exe`

const std = @import("std");
const win = @import("win");

const core = win.core;
const HRESULT = core.HRESULT;
const GUID = core.GUID;
const HSTRING = core.HSTRING;
const Hstring = core.Hstring;

const Devices = win.WinRT.Devices.Enumeration;
const Foundation = win.WinRT.Foundation;

/// TypedEventHandler<DeviceWatcher, DeviceInformation> Invoke signature.
/// fn(this, sender: *DeviceWatcher, args: *DeviceInformation) -> HRESULT
const AddedHandlerInvoke = fn (
    this: *anyopaque,
    sender: *anyopaque,
    args: *anyopaque,
) callconv(.winapi) HRESULT;

/// TypedEventHandler<DeviceWatcher, object> Invoke for EnumerationCompleted.
const CompletedHandlerInvoke = fn (
    this: *anyopaque,
    sender: *anyopaque,
    args: *anyopaque,
) callconv(.winapi) HRESULT;

// IID for TypedEventHandler<DeviceWatcher, DeviceInformation>
// {03c5a07b-990c-5d09-b0b8-5734eaa38222}
const IID_AddedHandler = GUID.parse("03c5a07b-990c-5d09-b0b8-5734eaa38222");

// IID for TypedEventHandler<DeviceWatcher, object>
// {9234630f-1ff4-54f6-9e3f-ac20369b7725}
const IID_CompletedHandler = GUID.parse("9234630f-1ff4-54f6-9e3f-ac20369b7725");

fn onDeviceAdded(
    _: *anyopaque,
    _: *anyopaque,
    args: *anyopaque,
) callconv(.winapi) HRESULT {
    // args is *IDeviceInformation — read its Name property.
    const info: *const Devices.IDeviceInformation = @ptrCast(@alignCast(args));
    var name: HSTRING = null;
    const hr = info.get_Name(&name);
    if (hr < 0) return hr;
    var owned = Hstring.fromRaw(name);
    defer owned.deinit();

    var utf8_buf: [512]u8 = undefined;
    const n = std.unicode.utf16LeToUtf8(&utf8_buf, owned.slice()) catch 0;
    if (n > 0) {
        std.debug.print("{s}\n", .{utf8_buf[0..n]});
    }
    return core.hresult.S_OK;
}

fn onEnumerationCompleted(
    _: *anyopaque,
    _: *anyopaque,
    _: *anyopaque,
) callconv(.winapi) HRESULT {
    std.debug.print("done!\n", .{});
    return core.hresult.S_OK;
}

pub fn main() !void {
    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    const allocator = std.heap.page_allocator;

    // Get DeviceInformation statics and QI to IDeviceInformationStatics
    // (which has CreateWatcher).
    const statics2 = try Devices.DeviceInformation.statics();
    defer statics2.deinit();

    // QI for IDeviceInformationStatics (has CreateWatcher without filters).
    var statics_ptr: ?*anyopaque = null;
    try core.hresult.ok(statics2.vtbl().base.base.QueryInterface(
        statics2.ptr,
        &Devices.IDeviceInformationStatics.IID,
        &statics_ptr,
    ));
    const statics: *const Devices.IDeviceInformationStatics = @ptrCast(@alignCast(statics_ptr.?));
    defer _ = statics.Release();

    // Create a DeviceWatcher.
    var watcher: *Devices.IDeviceWatcher = undefined;
    try core.hresult.ok(statics.CreateWatcher(@ptrCast(&watcher)));
    defer _ = watcher.Release();

    // Register Added handler.
    const AddedDelegate = core.Delegate(AddedHandlerInvoke, IID_AddedHandler);
    const added_handler = try AddedDelegate.create(allocator, &onDeviceAdded, null);
    var added_token: Foundation.EventRegistrationToken = undefined;
    @memset(std.mem.asBytes(&added_token), 0);
    try core.hresult.ok(watcher.add_Added(added_handler, &added_token));
    _ = AddedDelegate.release(added_handler);

    // Register EnumerationCompleted handler.
    const CompletedDelegate = core.Delegate(CompletedHandlerInvoke, IID_CompletedHandler);
    const completed_handler = try CompletedDelegate.create(allocator, &onEnumerationCompleted, null);
    var completed_token: Foundation.EventRegistrationToken = undefined;
    @memset(std.mem.asBytes(&completed_token), 0);
    try core.hresult.ok(watcher.add_EnumerationCompleted(completed_handler, &completed_token));
    _ = CompletedDelegate.release(completed_handler);

    // Start watching.
    try core.hresult.ok(watcher.Start());

    // Wait a few seconds for enumeration to complete.
    std.debug.print("Enumerating devices for 5 seconds...\n", .{});
    const Sleep = struct {
        extern "kernel32" fn Sleep(dwMilliseconds: u32) callconv(.winapi) void;
    }.Sleep;
    Sleep(5000);
}
