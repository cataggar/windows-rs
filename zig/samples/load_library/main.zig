//! Phase 6 sample: dynamic lookup via `LoadLibraryW` +
//! `GetProcAddress` + `FreeLibrary`. Exercises Phase 4's
//! cross-namespace projection: `LoadLibraryW` / `GetProcAddress`
//! come from `Windows.Win32.System.LibraryLoader`, but
//! `FreeLibrary` is authored in `Windows.Win32.Foundation.Apis` in
//! the winmd (unlike the MSDN headers where everything sits in
//! `libloaderapi.h`). Projecting two namespaces in a single
//! `project(...)` call proves the filter struct iteration works
//! across namespaces and that each namespace's `resolveTypeRef`
//! table is consulted independently.

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.System.LibraryLoader" = .{
        "LoadLibraryW",
        "GetProcAddress",
    },
    .@"Windows.Win32.Foundation" = .{
        "FreeLibrary",
    },
});

// KERNEL32's `GetCurrentProcessId` has the shape `DWORD ()`. We
// look it up dynamically via GetProcAddress to prove that FARPROC
// → `?*const anyopaque` casts cleanly into a concrete signature.
const GetCurrentProcessIdFn = *const fn () callconv(.winapi) u32;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var stdout_buffer: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    // PWSTR is `?[*:0]u16` (mutable) in the winmd; copy the comptime
    // literal into a mutable buffer to feed LoadLibraryW.
    var kernel32_name = std.unicode.utf8ToUtf16LeStringLiteral("kernel32.dll").*;
    const hmod = win.LoadLibraryW(&kernel32_name);
    if (hmod == 0) return error.LoadLibraryWFailed;
    try stdout.print("LoadLibraryW(kernel32.dll) = 0x{x}\n", .{@as(usize, @bitCast(hmod))});
    defer _ = win.FreeLibrary(hmod);

    // `GetCurrentProcessId` is exported by name. PSTR in the winmd
    // is a mutable `[*:0]u8`; string literals are `const`, so copy
    // into a mutable array first. The underlying GetProcAddress
    // ABI treats the argument as read-only.
    var proc_name = "GetCurrentProcessId".*;
    const proc_opaque = win.GetProcAddress(hmod, &proc_name) orelse
        return error.GetProcAddressFailed;
    const GetCurrentProcessId: GetCurrentProcessIdFn = @ptrCast(@alignCast(proc_opaque));

    const pid = GetCurrentProcessId();
    try stdout.print("GetCurrentProcessId() = {d}\n", .{pid});
    try stdout.flush();
}
