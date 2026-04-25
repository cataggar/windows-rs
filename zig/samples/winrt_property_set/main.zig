//! End-to-end smoke test for parameterised IIDs on closed WinRT generics.
//!
//! Activates `Windows.Foundation.Collections.PropertySet` — a runtime
//! class whose primary interface is `IPropertySet` but which also
//! implements `IObservableMap<HSTRING, IInspectable>` and (through it)
//! `IMap<HSTRING, IInspectable>`. The `IMap<...>` shape is a *closed*
//! WinRT generic, so its IID isn't stored in metadata — it has to be
//! computed at codegen time via the SHA-1 v5 UUID recipe over the
//! WinRT runtime-type signature `pinterface(...)`.
//!
//! This sample reaches that interface by `QueryInterface`-ing through
//! the emitter-generated `IMap__G2__HSTRING__object.IID`. If the recipe
//! is correct, `cast()` returns a non-null pointer; if the IID is wrong
//! by a single byte, `QueryInterface` fails with `E_NOINTERFACE`.
//!
//! Refs Issue #13 (M4).
//!
//! Contrast with `winrt_uri` / `winrt_property_value`: those reach
//! non-generic interfaces (`IStringable`, `IPropertyValue`) whose IIDs
//! ship in winmd. This sample is the first one whose `cast` target's
//! IID is *computed*, not read.

const std = @import("std");
const win = @import("win");

const core = win.core;
const IInspectable = core.IInspectable;

const Collections = win.WinRT.Collections;
const PropertySet = Collections.PropertySet;
const IMap_HSTRING_Object = Collections.IMap__G2__HSTRING__object;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    try core.roInitialize(.multi_threaded);
    defer core.winrt.RoUninitialize();

    // Activate PropertySet manually rather than via `PropertySet.activate()`:
    // the auto-generated activator passes the `_Vtbl` type into
    // `activateInstance`, which expects a handle struct with `.IID` — a
    // pre-existing emitter quirk unrelated to Issue #13. Going through
    // `IActivationFactory` directly gives us a well-typed `IInspectable`
    // anyway, which is exactly what `cast` consumes.
    const factory = try core.activationFactory(
        core.IActivationFactory_Vtbl,
        &core.IID_IActivationFactory,
        &PropertySet.NAME_W,
    );
    defer factory.deinit();

    var inspectable_raw: ?*anyopaque = null;
    try core.hresult.ok(factory.vtbl().ActivateInstance(factory.ptr, &inspectable_raw));
    const inst: IInspectable = .{
        .ptr = @ptrCast(@alignCast(inspectable_raw orelse return error.NullActivation)),
    };
    defer inst.deinit();

    // QI via the emitter-computed parameterised IID. If the SHA-1 v5
    // UUID recipe (or any link in the signature chain) is off by a
    // bit, this fails with HRESULT 0x80004002 (E_NOINTERFACE).
    const map = try inst.cast(IMap_HSTRING_Object.Vtbl, &IMap_HSTRING_Object.IID);
    defer map.deinit();

    var stdout_buf: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    const iid = IMap_HSTRING_Object.IID;
    try stdout.print(
        "PropertySet -> IMap<HSTRING, object> via parameterised IID OK " ++
            "({{{x:0>8}-{x:0>4}-{x:0>4}-{x:0>2}{x:0>2}-{x:0>2}{x:0>2}{x:0>2}{x:0>2}{x:0>2}{x:0>2}}})\n",
        .{
            iid.data1,    iid.data2,    iid.data3,
            iid.data4[0], iid.data4[1], iid.data4[2],
            iid.data4[3], iid.data4[4], iid.data4[5],
            iid.data4[6], iid.data4[7],
        },
    );
    try stdout.flush();
}
