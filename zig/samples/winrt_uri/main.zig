//! WinRT end-to-end canary: activate `Windows.Foundation.Uri`, call its
//! factory `CreateUri`, QI to `IStringable`, and print the normalised URL.
//!
//! Exercises the full M2+M3 plumbing (HSTRING round-trip + activation
//! factories) from a standalone exe using only the hand-written `win-core`
//! surface — no emitter-generated WinRT bindings involved yet. This is the
//! "what the emitter must eventually automate" north-star sample.

const std = @import("std");
const win = @import("win");

const core = win.core;
const Hstring = core.Hstring;
const IInspectable = core.IInspectable;
const IStringable_Vtbl = core.IStringable_Vtbl;
const IUriRuntimeClassFactory_Vtbl = core.IUriRuntimeClassFactory_Vtbl;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    // Activation factory for `Windows.Foundation.Uri`, typed directly as
    // `IUriRuntimeClassFactory` so we can call `CreateUri` without an
    // extra QueryInterface.
    const class = core.utf16Lit("Windows.Foundation.Uri");
    const factory = try core.activationFactory(
        IUriRuntimeClassFactory_Vtbl,
        &core.IID_IUriRuntimeClassFactory,
        class,
    );
    defer factory.deinit();

    // Construct the Uri instance from a UTF-16 HSTRING.
    const url = core.utf16Lit("https://learn.microsoft.com/windows/apps/");
    var url_h = try Hstring.create(url);
    defer url_h.deinit();

    var raw: ?*anyopaque = null;
    try core.hresult.ok(factory.vtbl().CreateUri(factory.ptr, url_h.raw, &raw));
    const uri: IInspectable = .{ .ptr = @ptrCast(@alignCast(raw.?)) };
    defer uri.deinit();

    // QI to IStringable and round-trip the URL through `ToString`.
    const stringable = try uri.cast(IStringable_Vtbl, &core.IID_IStringable);
    defer stringable.deinit();

    var out: core.HSTRING = null;
    try core.hresult.ok(stringable.vtbl().ToString(stringable.ptr, &out));
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
