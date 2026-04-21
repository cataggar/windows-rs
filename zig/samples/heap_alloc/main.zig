//! Phase 6/F sample — first live call into `System.Memory`.
//!
//! Exercises the process heap end-to-end:
//!
//!   GetProcessHeap()               -> HANDLE
//!   HeapAlloc(heap, ZERO_MEM, N)   -> *mut c_void
//!   HeapFree(heap, 0, ptr)         -> BOOL
//!
//! Allocates a 1 KiB zero-initialized buffer, verifies the first
//! byte reads 0, writes a small payload through the pointer, reads
//! it back, then frees the block. All checks are assertions so a
//! regression fails the sample rather than silently passing.

const std = @import("std");
const win_sys = @import("win-sys");

const mem = win_sys.index.@"Windows.Win32.System.Memory";

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Memory" = .{ "GetProcessHeap", "HeapAlloc", "HeapFree" },
    });

    const heap = win.GetProcessHeap();
    if (heap == 0) return error.NoProcessHeap;

    const size: usize = 1024;
    const raw = win.HeapAlloc(heap, mem.HEAP_ZERO_MEMORY, size);
    if (raw == null) return error.HeapAllocFailed;

    const buf: [*]u8 = @ptrCast(raw);
    std.debug.assert(buf[0] == 0);
    std.debug.assert(buf[size - 1] == 0);

    const payload = "zig + windows-rs";
    @memcpy(buf[0..payload.len], payload);
    std.debug.assert(std.mem.eql(u8, buf[0..payload.len], payload));

    const ok = win.HeapFree(heap, 0, raw);
    std.debug.assert(ok != 0);

    std.debug.print(
        "GetProcessHeap = 0x{x} | HeapAlloc({d}) ok | round-trip {d} bytes | HeapFree ok\n",
        .{ @as(usize, @bitCast(heap)), size, payload.len },
    );
}
