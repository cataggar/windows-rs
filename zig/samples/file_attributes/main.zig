//! Query filesystem attributes of a known-missing path and a
//! known-present directory, demonstrating the single-PWSTR-in /
//! u32-out shape that's pervasive across Storage.FileSystem.
//!
//! GetFileAttributesW returns INVALID_FILE_ATTRIBUTES (0xFFFFFFFF)
//! on failure — the caller cross-references GetLastError for the
//! reason. FILE_ATTRIBUTE_* bits decode the success case. No Zig
//! allocations; the utf-16 literal lives in `.rodata` and is
//! `@constCast`-passed through the mutable-PWSTR projection.

const std = @import("std");
const win_sys = @import("win-sys");

const fs = win_sys.index.@"Windows.Win32.Storage.FileSystem";

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.Storage.FileSystem" = .{"GetFileAttributesW"},
        .@"Windows.Win32.Foundation" = .{"GetLastError"},
    });

    {
        const missing = std.unicode.utf8ToUtf16LeStringLiteral(
            "C:\\__definitely_does_not_exist_42__.bin",
        );
        const attrs = win.GetFileAttributesW(@constCast(missing.ptr));
        const err = win.GetLastError();
        std.debug.print(
            "missing: attrs=0x{x:0>8} (invalid=0x{x:0>8}) | GetLastError={d}\n",
            .{ attrs, fs.INVALID_FILE_ATTRIBUTES, err },
        );
    }

    {
        const windir = std.unicode.utf8ToUtf16LeStringLiteral("C:\\Windows");
        const attrs = win.GetFileAttributesW(@constCast(windir.ptr));
        const is_dir = (attrs & fs.FILE_ATTRIBUTE_DIRECTORY) != 0;
        std.debug.print(
            "C:\\Windows: attrs=0x{x:0>8} | is_dir={} | DIRECTORY_bit=0x{x}\n",
            .{ attrs, is_dir, fs.FILE_ATTRIBUTE_DIRECTORY },
        );
    }
}
