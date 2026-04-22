//! Phase 6/N — `find_files`: enumerate directory entries via
//! FindFirstFileW / FindNextFileW / FindClose.
//!
//! First sample that *reads* fields from a Win32 out-struct. Prior
//! probes all returned scalars or filled caller-provided PWSTR
//! buffers; here we touch `WIN32_FIND_DATAW.cFileName` and
//! `.dwFileAttributes` directly. The struct is projected as a real
//! Zig `extern struct` (see `win-sys/structs`) rather than an
//! opaque blob — cFileName is a fixed-size `[260]u16` array with a
//! NUL somewhere in it, exactly as the Win32 header declares.

const std = @import("std");
const win_sys = @import("win-sys");

const fs = win_sys.index.@"Windows.Win32.Storage.FileSystem";
const foundation = win_sys.index.@"Windows.Win32.Foundation";

const win = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{
        "FindFirstFileW",
        "FindNextFileW",
        "FindClose",
    },
    .@"Windows.Win32.Foundation" = .{"GetLastError"},
});

/// Find the sentinel NUL in a `[260]u16` cFileName and return the
/// length. Win32 guarantees cFileName is NUL-terminated when the
/// struct is filled.
fn cfileNameLen(name: *const [260]u16) usize {
    for (name, 0..) |c, i| {
        if (c == 0) return i;
    }
    return name.len;
}

pub fn main() !void {
    // Sanity check: struct layout matches Win32 header (592 bytes).
    // If someone reorders fields in win-sys/structs, this fails
    // loudly rather than silently projecting garbage through FFI.
    comptime std.debug.assert(@sizeOf(win_sys.structs.WIN32_FIND_DATAW) == 592);

    // Enumerate C:\Windows\*.exe. Pattern is PWSTR-in → needs
    // @constCast per the PWSTR-in pattern from 6/L/6/M.
    const pattern = std.unicode.utf8ToUtf16LeStringLiteral("C:\\Windows\\*.exe");
    var fd: win_sys.structs.WIN32_FIND_DATAW = undefined;

    const h = win.FindFirstFileW(@constCast(pattern.ptr), &fd);
    if (@intFromPtr(h) == @as(usize, @bitCast(@as(isize, foundation.INVALID_HANDLE_VALUE)))) {
        const e = win.GetLastError();
        std.debug.print("FindFirstFileW failed: GetLastError={d}\n", .{e});
        return;
    }
    defer _ = win.FindClose(h);

    var count: u32 = 0;
    var printed: u32 = 0;
    while (true) : (count += 1) {
        const name_len = cfileNameLen(&fd.cFileName);
        // Only print the first 5; total count is accumulated for
        // all entries.
        if (printed < 5) {
            var utf8: [260 * 3]u8 = undefined;
            const n = std.unicode.utf16LeToUtf8(utf8[0..], fd.cFileName[0..name_len]) catch 0;
            const is_dir = (fd.dwFileAttributes & fs.FILE_ATTRIBUTE_DIRECTORY) != 0;
            std.debug.print(
                "  {s:<40} attrs=0x{x:0>8} sizeHi={d} sizeLo={d} {s}\n",
                .{
                    utf8[0..n],
                    fd.dwFileAttributes,
                    fd.nFileSizeHigh,
                    fd.nFileSizeLow,
                    if (is_dir) "<dir>" else "",
                },
            );
            printed += 1;
        }

        // FindNextFileW returns 0 on failure / end-of-enum.
        const ok = win.FindNextFileW(h, &fd);
        if (ok == 0) {
            const e = win.GetLastError();
            if (e != foundation.ERROR_NO_MORE_FILES) {
                std.debug.print("FindNextFileW stopped with GetLastError={d}\n", .{e});
            }
            break;
        }
    }

    std.debug.print("\nTotal entries matching C:\\Windows\\*.exe: {d}\n", .{count + 1});
}
