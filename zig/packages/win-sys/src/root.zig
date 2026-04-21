//! `win-sys` — generated C-style Win32 bindings (analogue of `windows-sys`).
//!
//! Content here is produced by `zig build bindings`. This file is the
//! stable entry point consumers import.

pub const core = @import("win-core");

// Generated namespaces land here in Phase 3.

/// Prebuilt MethodDef indexes (see checkpoints 055–057). Each entry
/// is a `std.static_string_map.StaticStringMap(u32)` mapping a
/// method name to its MethodDef row in the corresponding winmd —
/// used by the comptime `project()` helper (Phase 4) to avoid
/// scanning the 23 MB Win32 winmd inside the comptime VM.
pub const index = struct {
    pub const @"Windows.Win32.Foundation" =
        @import("generated/Windows.Win32.Foundation.index.zig");
};

test "prebuilt index: Windows.Win32.Foundation has SysAllocString" {
    const std = @import("std");
    // Comptime lookup — this is the same call the Phase 4 `project()`
    // helper will make per filter name.
    const row = comptime index.@"Windows.Win32.Foundation"
        .method_def_by_name.get("SysAllocString");
    try std.testing.expect(row != null);
    // Row number is metadata-snapshot dependent; just verify it's in
    // a plausible range for Win32.winmd MethodDef (tens of thousands).
    try std.testing.expect(row.? > 0 and row.? < 100_000);

    // Unknown names must miss.
    try std.testing.expectEqual(
        @as(?u32, null),
        index.@"Windows.Win32.Foundation".method_def_by_name.get("NotARealApi"),
    );
}
