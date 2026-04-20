//! `winmd` — zero-copy ECMA-335 metadata reader for `.winmd` files.
//!
//! Phase 1 target: parse `Windows.Win32.winmd`, `Windows.Wdk.winmd`, and
//! `Windows.winmd` via `std.fs.File.MemoryMap` into tables
//! (`TypeDef`, `MethodDef`, `Field`, `Param`, `Attribute`, ...) that mirror
//! the shape of `crates/libs/metadata` in the Rust tree.
//!
//! All transient parse state is bump-allocated; callers pass in an arena
//! and free the whole thing in one shot. `std.heap.ArenaAllocator` in
//! Zig 0.16 is thread-safe and lock-free, so multiple readers can share
//! the same arena under parallel builds.

const std = @import("std");

/// Placeholder — the real reader lands in Phase 1.
pub const File = struct {};

test "placeholder" {
    try std.testing.expect(true);
}
