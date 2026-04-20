//! `win` — generated + hand-written safer Windows bindings
//! (analogue of `windows`).
//!
//! Wraps `win-sys` with Zig-idiomatic error handling, COM method syntax,
//! and (eventually) WinRT activation / async helpers.

pub const core = @import("win-core");
pub const sys = @import("win-sys");

// Generated namespaces land here in Phase 3.
