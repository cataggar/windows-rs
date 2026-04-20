//! `winbindgen` — `.winmd` → `.zig` code generator and comptime projector.
//!
//! Phase 3 target: a CLI compatible with `windows-bindgen` that reads
//! the filter manifests under `tools/bindings/src/*.txt` and emits
//! namespaced `.zig` files into `packages/win-sys/src/` and
//! `packages/win/src/`.
//!
//! Phase 4 target: `project(.{ .filter = ... })` — a `comptime` function
//! that materializes the requested subset of the API directly using
//! `@Struct`, `@Enum`, and `@Union` (the per-kind type-creating builtins
//! introduced in Zig 0.16). No generated source files.

const std = @import("std");
const winmd = @import("winmd");

/// Placeholder — real codegen lands in Phase 3.
pub fn generate(_: std.mem.Allocator) !void {}

test "placeholder" {
    _ = winmd;
    try std.testing.expect(true);
}
