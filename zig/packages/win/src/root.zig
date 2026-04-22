//! `win` — generated + hand-written safer Windows bindings
//! (analogue of `windows`).
//!
//! Wraps `win-sys` with Zig-idiomatic error handling, COM method syntax,
//! and (eventually) WinRT activation / async helpers.

pub const core = @import("win-core");
pub const sys = @import("win-sys");

/// `Windows.Win32.System.Com` — classic COM surface: IUnknown, IUri,
/// IStream, CreateUri, CoInitializeEx, ... All vtables extend
/// `win-core`'s `IUnknown_Vtbl`; callers dispatch via
/// `handle.vtable.Method(handle, args)`.
///
/// Note: a blanket `_ = Com` test trips a pre-existing emitter gap in
/// the sibling `Windows.Win32.System.Variant` namespace (VARIANT struct
/// is dropped because one of its nested-union fields is a COM
/// interface, which `canRepresentField` currently rejects). Samples
/// that only reference `CreateUri` / `IUri` / `IStream` don't
/// transitively analyze `Variant.zig`, so they compile fine. The
/// emitter fix is tracked as a v0.2 task.
pub const Com = @import("Windows.Win32.System.Com");
