//! Phase 6/K sample — queries the current process's elevation token.
//!
//! Chains three namespaces that are already wired:
//!
//!   Threading.GetCurrentProcess()                  -> HANDLE
//!   Threading.OpenProcessToken(h, TOKEN_QUERY, &t) -> BOOL
//!   Security.GetTokenInformation(
//!       t, TokenElevation, &elev, sizeof, &ret)    -> BOOL
//!   Foundation.CloseHandle(t)                      -> BOOL
//!
//! Validates two new aliases:
//!   TOKEN_ACCESS_MASK       -> u32 (flags)
//!   TOKEN_INFORMATION_CLASS -> i32 (C enum)
//!
//! Also first use of `*HANDLE` out-param: Ptr + TypeRef(HANDLE) ->
//! *isize at call sites. TOKEN_ELEVATION is a POD { DWORD } so we
//! read it as a plain u32 and avoid wiring the struct layout.

const std = @import("std");
const win_sys = @import("win-sys");

const sec = win_sys.index.@"Windows.Win32.Security";

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.Threading" = .{
            "GetCurrentProcess",
            "OpenProcessToken",
        },
        .@"Windows.Win32.Security" = .{
            "GetTokenInformation",
        },
        .@"Windows.Win32.Foundation" = .{
            "CloseHandle",
        },
    });

    const h_process = win.GetCurrentProcess();

    var h_token: ?*anyopaque = null;
    const open_ok = win.OpenProcessToken(h_process, sec.TOKEN_QUERY, &h_token);
    std.debug.assert(open_ok != 0);
    std.debug.assert(h_token != null);
    defer _ = win.CloseHandle(h_token);

    // TOKEN_ELEVATION has a single DWORD field (TokenIsElevated).
    var elevation: u32 = 0;
    var returned: u32 = 0;
    const get_ok = win.GetTokenInformation(
        h_token,
        sec.TokenElevation,
        &elevation,
        @sizeOf(u32),
        &returned,
    );
    std.debug.assert(get_ok != 0);
    std.debug.assert(returned == @sizeOf(u32));

    std.debug.print(
        "hProcess=0x{x} | hToken=0x{x} | TokenIsElevated={d}\n",
        .{ @intFromPtr(h_process), @intFromPtr(h_token), elevation },
    );
}
