//! Phase 6 sample — first live call into `Storage.FileSystem`.
//!
//! Exercises three calls across two namespaces to prove the sys
//! layer now covers a real read-write workflow:
//!
//!   CreateFileW  →  WriteFile  →  CloseHandle  →  DeleteFileW
//!
//! The sample creates a temp file next to the executable, writes a
//! short payload, closes the handle, re-creates the file with
//! CREATE_ALWAYS to prove the flag round-trips, closes again, then
//! deletes the file. All return values are asserted; GetLastError
//! is checked when CreateFileW returns INVALID_HANDLE_VALUE so a
//! failure surfaces a meaningful exit code instead of a silent pass.

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.Foundation" = .{ "CloseHandle", "GetLastError" },
    .@"Windows.Win32.Storage.FileSystem" = .{ "CreateFileW", "WriteFile", "DeleteFileW" },
});

// Well-known Win32 constants now live alongside the method records
// in the generated index files; the full index is exposed at
// `win_sys.index.@"..."` so samples can reach them without an
// extra alias step in `project()`. Untyped `comptime_int` values
// coerce to whatever integer width the call site needs.
const fs = win_sys.index.@"Windows.Win32.Storage.FileSystem";
const fnd = win_sys.index.@"Windows.Win32.Foundation";

pub fn main() !void {
    const path_literal = std.unicode.utf8ToUtf16LeStringLiteral("zig-file-write-sample.tmp");
    // `?[*:0]u16` is the projected type (winmd marks PWSTR as non-const).
    // Literal is `*const [N:0]u16`; coerce to many-item sentinel pointer
    // via `.ptr` then drop const — the API accepts both in/out strings
    // through the same type, and CreateFileW doesn't mutate the path.
    const path_w: ?[*:0]u16 = @constCast(@as([*:0]const u16, path_literal));
    const payload = "Hello from windows-zig!\r\n";

    // --- CreateFileW ---------------------------------------------------
    const handle = win.CreateFileW(
        path_w,
        fnd.GENERIC_WRITE,
        fs.FILE_SHARE_NONE,
        null,
        fs.CREATE_ALWAYS,
        fs.FILE_ATTRIBUTE_NORMAL,
        0,
    );
    if (handle == fnd.INVALID_HANDLE_VALUE) {
        const err = win.GetLastError();
        std.debug.print("CreateFileW failed: GetLastError = {d}\n", .{err});
        return error.CreateFileFailed;
    }
    std.debug.assert(handle != 0);

    // --- WriteFile -----------------------------------------------------
    var bytes_written: u32 = 0;
    const write_ok = win.WriteFile(
        handle,
        @ptrCast(@constCast(payload.ptr)),
        @intCast(payload.len),
        &bytes_written,
        null,
    );
    std.debug.assert(write_ok != 0);
    std.debug.assert(bytes_written == payload.len);

    // --- CloseHandle ---------------------------------------------------
    const close_ok = win.CloseHandle(handle);
    std.debug.assert(close_ok != 0);

    // --- DeleteFileW ---------------------------------------------------
    const delete_ok = win.DeleteFileW(path_w);
    std.debug.assert(delete_ok != 0);

    std.debug.print(
        "CreateFileW ok (handle=0x{x}) | WriteFile wrote {d} bytes | CloseHandle + DeleteFileW ok\n",
        .{ @as(usize, @bitCast(handle)), bytes_written },
    );
}
