//! Phase 6/I sample — first live call into `Windows.Win32.Security`.
//!
//! Builds the well-known "Everyone" SID end-to-end:
//!
//!   GetSidLengthRequired(1)                -> u32  (size for 1 sub-authority)
//!   CreateWellKnownSid(WinWorldSid, NULL, buf, &size)  -> BOOL
//!   IsValidSid(buf)                        -> BOOL
//!   GetLengthSid(buf)                      -> u32
//!
//! Validates the new aliases `PSID → ?*anyopaque` and
//! `WELL_KNOWN_SID_TYPE → i32` through project(). PSID is
//! winmd-declared as a ValueType but is semantically an opaque
//! pointer; the projection passes it through unchanged so both
//! in-params (existing SID) and out-buffers (writable region)
//! share the same shape.

const std = @import("std");
const win_sys = @import("win-sys");

const sec = win_sys.index.@"Windows.Win32.Security";

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.Security" = .{
            "GetSidLengthRequired",
            "CreateWellKnownSid",
            "IsValidSid",
            "GetLengthSid",
        },
    });

    // Upper bound on a SID (SECURITY_MAX_SID_SIZE = 68).
    var sid_buf: [68]u8 = undefined;
    @memset(&sid_buf, 0);

    const required = win.GetSidLengthRequired(1);
    std.debug.assert(required > 0);
    std.debug.assert(required <= sid_buf.len);

    var size: u32 = sid_buf.len;
    const create_ok = win.CreateWellKnownSid(
        sec.WinWorldSid,
        null,
        @ptrCast(&sid_buf),
        &size,
    );
    std.debug.assert(create_ok != 0);
    std.debug.assert(size > 0);

    const valid = win.IsValidSid(@ptrCast(&sid_buf));
    std.debug.assert(valid != 0);

    const len = win.GetLengthSid(@ptrCast(&sid_buf));
    std.debug.assert(len == size);

    std.debug.print(
        "WinWorldSid: required>=1={d}B | created {d}B | valid=1 | length={d}\n",
        .{ required, size, len },
    );
}
