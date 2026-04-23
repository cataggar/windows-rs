//! WinRT closed-generic canary — activate the
//! `Windows.Globalization.ApplicationLanguages` static factory, call
//! `get_Languages`, and print the first entry of the returned
//! `IVectorView`1<HSTRING>`.
//!
//! This exercises the M4 Phase 4b/4c pipeline end-to-end:
//!
//!   * The emitter pulled in `Windows.Globalization` via the bundle's
//!     namespace closure and produced a typed `get_Languages` whose
//!     `result` parameter is `**Windows.Foundation.Collections.IVectorView__G1__HSTRING`
//!     (cross-namespace closed-generic reference).
//!   * A build-time `--seed=IVectorView`1,string` seeded the
//!     instantiation, so `IVectorView__G1__HSTRING` is materialised as
//!     an `extern struct` with a fully typed vtable
//!     (`GetAt(u32, *HSTRING)`, `get_Size(*u32)`, `IndexOf(...)`).
//!   * No hand-written IID / vtable / mangled struct name appears in
//!     this sample — everything projection-side comes from the winmd.
//!
//! Contrast with the earlier `winrt_uri` canary: that one consumed an
//! *open* generic via a concrete return type; this one consumes a
//! *closed* generic across a namespace boundary, which is the shape
//! most WinRT Collections surfaces take.

const std = @import("std");
const win = @import("win");

const core = win.core;
const IInspectable = core.IInspectable;

const Globalization = win.WinRT.Globalization;
const ApplicationLanguages = Globalization.ApplicationLanguages;

const Collections = win.WinRT.Collections;
const IVectorView_HSTRING = Collections.IVectorView__G1__HSTRING;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    // `ApplicationLanguages` is a pure-static WinRT class: no instance
    // activation, just an `IActivationFactory` that also implements
    // `IApplicationLanguagesStatics`. `ApplicationLanguages.Statics`
    // is the emitter-generated alias for that statics interface.
    const factory = try core.activationFactory(
        ApplicationLanguages.Statics.Vtbl,
        &ApplicationLanguages.Statics.IID,
        &ApplicationLanguages.NAME_W,
    );
    defer factory.deinit();

    const statics_this: *const ApplicationLanguages.Statics =
        @ptrCast(@alignCast(factory.ptr));

    // `get_Languages` returns an `IVectorView`1<HSTRING>`. The
    // `**IVectorView__G1__HSTRING` out-param is the whole point of
    // this sample: it proves the emitter threads closed-generic
    // references across namespace boundaries and into typed vtable
    // entries rather than falling back to `*anyopaque`.
    var view_raw: *IVectorView_HSTRING = undefined;
    try core.hresult.ok(statics_this.get_Languages(&view_raw));

    // Use `IInspectable`'s deinit for reference-counted release. The
    // mangled-generic struct shares `IInspectable`'s vtable layout
    // through its `base` chain so this is safe.
    const view_insp: IInspectable = .{ .ptr = @ptrCast(@alignCast(view_raw)) };
    defer view_insp.deinit();

    var size: u32 = 0;
    try core.hresult.ok(view_raw.vtable.get_Size(view_raw, &size));

    var stdout_buf: [512]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    try stdout.print("ApplicationLanguages.Languages.Size = {d}\n", .{size});

    if (size > 0) {
        var lang_raw: core.HSTRING = null;
        try core.hresult.ok(view_raw.vtable.GetAt(view_raw, 0, &lang_raw));
        var lang = core.Hstring.fromRaw(lang_raw);
        defer lang.deinit();

        var utf8: [256]u8 = undefined;
        const n = try std.unicode.utf16LeToUtf8(&utf8, lang.slice());
        try stdout.print("ApplicationLanguages.Languages[0] -> {s}\n", .{utf8[0..n]});
    }

    try stdout.flush();
}
