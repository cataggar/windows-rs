//! `win-sys` — generated C-style Win32 bindings (analogue of `windows-sys`).
//!
//! Content here is produced by `zig build bindings`. This file is the
//! stable entry point consumers import.

pub const core = @import("win-core");

/// Comptime-only MethodDef signature decoder used by `project()`.
/// Exposed as a module so downstream packages can reuse the
/// decoder without pulling the full `winmd` reader.
pub const sig = @import("sig.zig");

/// Comptime `project()` helper — consumes `index.<ns>.method_def_by_name`,
/// `sig.decode`, and `index.<ns>.resolveTypeRef` to materialize extern
/// function pointers into a populated struct value.
pub const project = @import("project.zig").project;

test {
    // Pull in tests from sibling modules — `@import` alone won't
    // make the Zig test runner discover them.
    _ = sig;
    _ = @import("project.zig");
}

// Generated namespaces land here in Phase 3.

/// Prebuilt MethodDef indexes (see checkpoints 055–057). Each entry
/// is a `std.static_string_map.StaticStringMap(u32)` mapping a
/// method name to its MethodDef row in the corresponding winmd —
/// used by the comptime `project()` helper (Phase 4) to avoid
/// scanning the 23 MB Win32 winmd inside the comptime VM.
pub const index = struct {
    pub const @"Windows.Win32.Foundation" =
        @import("generated/Windows.Win32.Foundation.index.zig");
    pub const @"Windows.Win32.System.LibraryLoader" =
        @import("generated/Windows.Win32.System.LibraryLoader.index.zig");
};

test "prebuilt index: Windows.Win32.Foundation has SysAllocString" {
    const std = @import("std");
    // Comptime lookup — this is the same call the Phase 4 `project()`
    // helper will make per filter name.
    const rec = comptime index.@"Windows.Win32.Foundation"
        .method_def_by_name.get("SysAllocString");
    try std.testing.expect(rec != null);

    // Library and import name must be populated. SysAllocString is a
    // BSTR helper exported from OLEAUT32.DLL.
    try std.testing.expectEqualStrings("OLEAUT32", rec.?.library);
    try std.testing.expectEqualStrings("SysAllocString", rec.?.import);

    // Signature is a raw MethodDef sig blob. First byte is the
    // calling-convention flags per ECMA-335 §II.23.2.1 (0x00 for
    // HASTHIS=0 DEFAULT, 0x20+ when HASTHIS is set). Non-empty + a
    // plausible first byte is enough here; signature parsing is
    // exercised separately.
    try std.testing.expect(rec.?.signature.len > 0);
    try std.testing.expect(rec.?.signature[0] <= 0x20);

    // Unknown names must miss.
    try std.testing.expectEqual(
        @as(?@TypeOf(rec.?), null),
        index.@"Windows.Win32.Foundation".method_def_by_name.get("NotARealApi"),
    );
}

test "prebuilt index: resolveTypeRef maps SysAllocString return's BSTR coded index" {
    const std = @import("std");
    // SysAllocString's signature: \x00\x01\x11\x8d\x35\x11\x05
    // Byte 2: flags=0, byte 3: 1 param, bytes 4..: return = VALUETYPE
    // + 2-byte compressed coded-index 0x8d35 → 0x0d35.
    const rec = comptime index.@"Windows.Win32.Foundation"
        .method_def_by_name.get("SysAllocString").?;

    // Byte 2 is VALUETYPE (0x11). Bytes 3-4 are the 2-byte compressed
    // form of the coded-index. For a 2-byte compressed value, mask
    // off the continuation bit: (b0 & 0x3f) << 8 | b1.
    const b0 = rec.signature[2 + 1];
    const b1 = rec.signature[2 + 2];
    try std.testing.expectEqual(@as(u8, 0x11), rec.signature[2]);
    const coded: u32 = (@as(u32, b0 & 0x3f) << 8) | b1;

    const resolved = comptime index.@"Windows.Win32.Foundation"
        .resolveTypeRef(coded);
    try std.testing.expect(resolved != null);
    try std.testing.expectEqualStrings("BSTR", resolved.?.name);
    try std.testing.expectEqualStrings("Windows.Win32.Foundation", resolved.?.namespace);

    // Unknown coded indices return null.
    try std.testing.expectEqual(
        @as(?@TypeOf(resolved.?), null),
        index.@"Windows.Win32.Foundation".resolveTypeRef(0xFFFFFFFF),
    );
}
