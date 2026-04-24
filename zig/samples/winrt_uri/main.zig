//! WinRT end-to-end sample — activate `Windows.Foundation.Uri`, call its
//! factory `CreateUri`, QI to `IStringable`, and print the normalised URL.
//!
//! Consumes the **emitter-generated** `win.WinRT.Foundation.Uri` surface:
//! the pre-widened UTF-16 class name (`Uri.NAME_W`), the `Factory` alias
//! (pointing at `IUriRuntimeClassFactory`), each interface's `Vtbl` / `IID`
//! constants, and the M2 `CreateUriFromUtf16` sugar that converts a
//! `[]const u16` into an HSTRING internally. Only the reference-counted
//! vtable dispatch (`activationFactory`, `cast`) still routes through
//! `win-core`, which is the correct home for generic COM plumbing.
//!
//! Contrast with the earlier HSTRING canary: this version uses zero
//! hand-written `IID_*` / `NAME_*` / `_Vtbl` constants and no explicit
//! `Hstring.create`/`deinit` for method inputs — everything projection-side
//! comes from the winmd.

const std = @import("std");
const win = @import("win");

const core = win.core;
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
    // `Uri.factory()` is the M6 convenience that collapses
    // `core.activationFactory(Uri.Factory.Vtbl, &Uri.Factory.IID, &Uri.NAME_W)`
    // down to a single call.
    const factory = try Uri.factory();
    defer factory.deinit();

    // Construct the Uri instance. `CreateUriFromUtf16` is the M2
    // sugar the emitter generates for any method with an HSTRING
    // input — it takes a `[]const u16` slice directly and handles
    // `Hstring.create`/`.deinit` internally, removing the boilerplate
    // the earlier canary needed.
    const url = core.utf16Lit("https://learn.microsoft.com/windows/apps/");

    var raw: *Uri = undefined;
    const factory_this: *const Uri.Factory = @ptrCast(@alignCast(factory.ptr));
    try core.hresult.ok(factory_this.CreateUriFromUtf16(url, &raw));
    const uri: IInspectable = .{ .ptr = @ptrCast(@alignCast(raw)) };
    defer uri.deinit();

    // QI to IStringable and round-trip the URL through `ToString`.
    const stringable = try uri.cast(IStringable.Vtbl, &IStringable.IID);
    defer stringable.deinit();

    // `ToStringOwned` is the M2 return-side sugar: the emitter wraps
    // the raw `ToString(result: *HSTRING)` with a variant that
    // translates HRESULT through `win_core.hresult.ok` and returns an
    // owning `Hstring` for `defer deinit()`.
    const stringable_this: *const IStringable = @ptrCast(@alignCast(stringable.ptr));
    var got = try stringable_this.ToStringOwned();
    defer got.deinit();

    var utf8: [512]u8 = undefined;
    const n = try std.unicode.utf16LeToUtf8(&utf8, got.slice());

    var stdout_buf: [512]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;
    try stdout.print("Uri.ToString() -> {s}\n", .{utf8[0..n]});
    try stdout.flush();
}
