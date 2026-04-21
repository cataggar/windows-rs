//! Phase 6/H sample — virtual memory API round-trip.
//!
//! Builds on `System.Memory` (already wired in Phase 6/F) to exercise
//! the three canonical virtual-memory calls:
//!
//!   VirtualAlloc(NULL, 4096, MEM_COMMIT|MEM_RESERVE, PAGE_READWRITE)
//!   VirtualProtect(page, 4096, PAGE_READONLY, &old)
//!   VirtualFree(page, 0, MEM_RELEASE)
//!
//! This reuses the alias entries added in Phase 6/F
//! (VIRTUAL_ALLOCATION_TYPE, VIRTUAL_FREE_TYPE, PAGE_PROTECTION_FLAGS)
//! and validates that `*PAGE_PROTECTION_FLAGS` out-params project
//! correctly through the pointer-to-alias path.

const std = @import("std");
const win_sys = @import("win-sys");

const mem = win_sys.index.@"Windows.Win32.System.Memory";

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Memory" = .{ "VirtualAlloc", "VirtualProtect", "VirtualFree" },
    });

    const size: usize = 4096;
    const raw = win.VirtualAlloc(
        null,
        size,
        mem.MEM_COMMIT | mem.MEM_RESERVE,
        mem.PAGE_READWRITE,
    );
    if (raw == null) return error.VirtualAllocFailed;

    const page: [*]u8 = @ptrCast(raw);

    // Freshly committed pages are zero-filled by Windows.
    std.debug.assert(page[0] == 0);
    std.debug.assert(page[size - 1] == 0);

    const payload = "zig vmem";
    @memcpy(page[0..payload.len], payload);
    std.debug.assert(std.mem.eql(u8, page[0..payload.len], payload));

    // Flip to read-only; further writes would AV. The old-protect
    // out-param validates that `*PAGE_PROTECTION_FLAGS` is projected
    // as a proper writable pointer on our side.
    var old_protect: u32 = 0;
    const prot_ok = win.VirtualProtect(raw, size, mem.PAGE_READONLY, &old_protect);
    std.debug.assert(prot_ok != 0);
    std.debug.assert(old_protect == mem.PAGE_READWRITE);

    // Read-back still works under PAGE_READONLY.
    std.debug.assert(std.mem.eql(u8, page[0..payload.len], payload));

    // dwSize must be 0 when passing MEM_RELEASE.
    const free_ok = win.VirtualFree(raw, 0, mem.MEM_RELEASE);
    std.debug.assert(free_ok != 0);

    std.debug.print(
        "VirtualAlloc 0x{x} | wrote {d}B | VirtualProtect READONLY (old=0x{x}) | VirtualFree ok\n",
        .{ @intFromPtr(page), payload.len, old_protect },
    );
}
