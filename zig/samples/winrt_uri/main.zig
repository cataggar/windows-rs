//! WinRT end-to-end sample — activate `Windows.Foundation.Uri`, call its
//! factory `CreateUri`, QI to `IStringable`, and print the normalised URL.
//!
//! Consumes the **emitter-generated** `win.WinRT.Foundation.Uri` surface:
//! the pre-widened UTF-16 class name (`Uri.NAME_W`), the `Factory` alias
//! (pointing at `IUriRuntimeClassFactory`), and each interface's
//! `Vtbl` / `IID` constants. Only the reference-counted vtable dispatch
//! (`activationFactory`, `cast`) still routes through `win-core`, which
//! is the correct home for generic COM plumbing.
//!
//! Contrast with the earlier HSTRING canary: this version uses zero
//! hand-written `IID_*` / `NAME_*` / `_Vtbl` constants — everything
//! projection-side comes from the winmd.

const std = @import("std");
const win = @import("win");

const core = win.core;
const Hstring = core.Hstring;
const IInspectable = core.IInspectable;

const Foundation = win.WinRT.Foundation;
const Uri = Foundation.Uri;
const IStringable = Foundation.IStringable;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    // Activation factory for `Windows.Foundation.Uri`, typed as
    // `IUriRuntimeClassFactory` via `Uri.Factory` (emitter-generated
    // from `[Activatable(typeof(IUriRuntimeClassFactory), ...)]`).
    const factory = try core.activationFactory(
        Uri.Factory.Vtbl,
        &Uri.Factory.IID,
        &Uri.NAME_W,
    );
    defer factory.deinit();

    // Construct the Uri instance from a UTF-16 HSTRING.
    const url = core.utf16Lit("https://learn.microsoft.com/windows/apps/");
    var url_h = try Hstring.create(url);
    defer url_h.deinit();

    var raw: *Uri = undefined;
    const factory_this: *const Uri.Factory = @ptrCast(@alignCast(factory.ptr));
    try core.hresult.ok(factory_this.CreateUri(url_h.raw, &raw));
    const uri: IInspectable = .{ .ptr = @ptrCast(@alignCast(raw)) };
    defer uri.deinit();

    // QI to IStringable and round-trip the URL through `ToString`.
    const stringable = try uri.cast(IStringable.Vtbl, &IStringable.IID);
    defer stringable.deinit();

    var out: core.HSTRING = null;
    const stringable_this: *const IStringable = @ptrCast(@alignCast(stringable.ptr));
    try core.hresult.ok(stringable_this.ToString(&out));
    var got = Hstring.fromRaw(out);
    defer got.deinit();

    var utf8: [512]u8 = undefined;
    const n = try std.unicode.utf16LeToUtf8(&utf8, got.slice());

    var stdout_buf: [512]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;
    try stdout.print("Uri.ToString() -> {s}\n", .{utf8[0..n]});
    try stdout.flush();
}
