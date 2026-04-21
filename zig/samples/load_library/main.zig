//! Phase 6 sample: dynamic lookup via `GetModuleHandleW` +
//! `GetProcAddress`, projected from the
//! `Windows.Win32.System.LibraryLoader` namespace.
//!
//! Exercises Phase 4's cross-namespace projection: both functions
//! live in `System.LibraryLoader` but their signatures reference
//! `Foundation` handles (HMODULE, PWSTR, PSTR). The compiler walks
//! LibraryLoader's `resolveTypeRef` table + the shared alias table
//! to materialize the right extern fn pointers.

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.System.LibraryLoader" = .{
        "GetModuleHandleW",
        "GetProcAddress",
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

    // GetModuleHandleW returns the already-loaded kernel32 module.
    // kernel32 is always present in every Win32 process, so there's
    // nothing to free. PWSTR is `?[*:0]u16` (mutable) in the winmd;
    // copy the comptime literal into a mutable buffer to feed it.
    var kernel32_name = std.unicode.utf8ToUtf16LeStringLiteral("kernel32.dll").*;
    const hmod = win.GetModuleHandleW(&kernel32_name);
    if (hmod == 0) return error.GetModuleHandleWFailed;
    try stdout.print("GetModuleHandleW(kernel32.dll) = 0x{x}\n", .{@as(usize, @bitCast(hmod))});

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
