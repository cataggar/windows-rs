//! Zig port of `crates/samples/windows/com_uri/src/main.rs`.
//!
//! Demonstrates classic-COM dispatch through `@import("win").Com`:
//! `CreateUri` (URLMON) hands back an `IUri`, from which we fetch
//! the domain (a BSTR owned by oleaut32) and port.
//!
//! This sample is the end-to-end canary for the classic-COM vtbl
//! emitter — a regression in `writeMethodPointer` or the shipping
//! story for `win.Com` breaks the build here, not just a hidden
//! golden check.

const std = @import("std");
const win = @import("win");

const Com = win.Com;
const F = win.Foundation;
const hresult = win.core.hresult;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    // `CreateUri` takes a `PWSTR` (mutable wide string) even though it
    // only reads the buffer. Cast away const on a comptime utf16
    // literal — URLMON does not write through this pointer.
    const url_literal = std.unicode.utf8ToUtf16LeStringLiteral(
        "http://kennykerr.ca",
    );
    const url: F.PWSTR = .{ .Value = @ptrCast(@constCast(url_literal)) };

    var uri: *Com.IUri = undefined;
    try hresultOk(Com.CreateUri(url, @enumFromInt(0), 0, &uri));
    defer _ = uri.Release();

    var domain: F.BSTR = .{ .Value = undefined };
    try hresultOk(uri.GetDomain(&domain));
    defer F.SysFreeString(domain);

    var port: u32 = 0;
    try hresultOk(uri.GetPort(&port));

    const len = F.SysStringLen(domain);
    const wide_ptr: [*]u16 = @ptrCast(domain.Value);
    const wide = wide_ptr[0..len];
    var utf8_buf: [512]u8 = undefined;
    const n = try std.unicode.utf16LeToUtf8(&utf8_buf, wide);

    var stdout_buf: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buf);
    const stdout = &stdout_writer.interface;
    try stdout.print("{s} ({d})\n", .{ utf8_buf[0..n], port });
    try stdout.flush();
}

fn hresultOk(hr: win.core.HRESULT) !void {
    if (hresult.failed(hr)) return error.HResult;
}
