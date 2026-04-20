//! `win-targets` — produce Windows import libraries from `.def` files
//! at build time, without needing LLVM.
//!
//! Zig 0.16 ships native `.def → .lib` support; this package wraps that
//! into a reusable `std.Build` step so downstream `build.zig` files can
//! just declare which APIs they need.
//!
//! Phase 5 replaces the checked-in per-triple `.lib` blobs under
//! `crates/targets/` with on-demand generation.

const std = @import("std");

/// Placeholder — real build helpers land in Phase 5.
pub fn addImportLib(_: *std.Build, _: []const u8) void {}
