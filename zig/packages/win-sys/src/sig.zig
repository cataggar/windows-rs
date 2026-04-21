//! Comptime-only MethodDef signature decoder.
//!
//! The full `winmd.readMethodSignature` requires a `*File` to
//! resolve TypeDefOrRef coded indices to names and an allocator
//! for nested types. Neither is usable from inside the comptime
//! VM when `project()` materializes extern fns (see checkpoint 059
//! for why parsing a winmd at comptime is a non-starter).
//!
//! This decoder keeps just enough structure to build a Zig
//! `std.builtin.Type.Fn`:
//!   * Primitives decode to `Ty` variants with concrete Zig types.
//!   * ELEMENT_TYPE_PTR wraps the inner type as a pointer.
//!   * ELEMENT_TYPE_VALUETYPE / ELEMENT_TYPE_CLASS preserve the
//!     raw TypeDefOrRef coded-index value. The caller maps it
//!     via a parallel table emitted by winbindgen.
//!
//! ECMA-335 references: §II.23.2.1 (MethodDefSig),
//! §II.23.1.16 (ElementType), §II.23.2.8 (TypeDefOrRefOrSpecEncoded).

const std = @import("std");

// ---- ElementType constants (§II.23.1.16) --------------------------------

pub const ELEMENT_TYPE_VOID: u8 = 0x01;
pub const ELEMENT_TYPE_BOOLEAN: u8 = 0x02;
pub const ELEMENT_TYPE_CHAR: u8 = 0x03;
pub const ELEMENT_TYPE_I1: u8 = 0x04;
pub const ELEMENT_TYPE_U1: u8 = 0x05;
pub const ELEMENT_TYPE_I2: u8 = 0x06;
pub const ELEMENT_TYPE_U2: u8 = 0x07;
pub const ELEMENT_TYPE_I4: u8 = 0x08;
pub const ELEMENT_TYPE_U4: u8 = 0x09;
pub const ELEMENT_TYPE_I8: u8 = 0x0a;
pub const ELEMENT_TYPE_U8: u8 = 0x0b;
pub const ELEMENT_TYPE_R4: u8 = 0x0c;
pub const ELEMENT_TYPE_R8: u8 = 0x0d;
pub const ELEMENT_TYPE_STRING: u8 = 0x0e;
pub const ELEMENT_TYPE_PTR: u8 = 0x0f;
pub const ELEMENT_TYPE_VALUETYPE: u8 = 0x11;
pub const ELEMENT_TYPE_CLASS: u8 = 0x12;
pub const ELEMENT_TYPE_I: u8 = 0x18;
pub const ELEMENT_TYPE_U: u8 = 0x19;

// Max params/pointer depth supported by the comptime decoder. Win32
// method sigs comfortably fit in these bounds (largest seen is
// ~20 params; no more than a handful of pointer indirections).
pub const MAX_PARAMS: usize = 32;
pub const MAX_PTR_DEPTH: u8 = 4;

pub const Kind = enum {
    void,
    bool,
    i8,
    u8,
    i16,
    u16,
    i32,
    u32,
    i64,
    u64,
    f32,
    f64,
    isize,
    usize,
    char,
    /// ELEMENT_TYPE_VALUETYPE — `coded_index` holds the raw
    /// TypeDefOrRef compressed value. Resolve via a sidecar table.
    value_ref,
    /// ELEMENT_TYPE_CLASS — same resolution rule as `value_ref`.
    class_ref,
    /// Signature contained a construct this MVP decoder doesn't
    /// yet handle (arrays, generics, byref, modifiers, …). The
    /// caller should skip the method.
    unsupported,
};

pub const Ty = struct {
    kind: Kind,
    /// Pointer indirection count (0 = value, N = N-level pointer).
    ptrs: u8 = 0,
    /// For `value_ref` / `class_ref`: the raw TypeDefOrRef
    /// compressed coded-index value.
    coded_index: u32 = 0,
};

pub const Sig = struct {
    has_this: bool,
    param_count: u32,
    return_type: Ty,
    params_buf: [MAX_PARAMS]Ty,

    pub fn params(self: *const Sig) []const Ty {
        return self.params_buf[0..self.param_count];
    }
};

pub const Error = error{
    ShortBlob,
    TooManyParams,
    PointerTooDeep,
    TrailingBytes,
};

/// Comptime-friendly compressed-integer reader (§II.23.2).
fn readCompressed(bytes: []const u8, pos: *usize) Error!u32 {
    if (pos.* >= bytes.len) return error.ShortBlob;
    const b0 = bytes[pos.*];
    pos.* += 1;
    if (b0 & 0x80 == 0) return b0;
    if (pos.* >= bytes.len) return error.ShortBlob;
    const b1 = bytes[pos.*];
    pos.* += 1;
    if (b0 & 0xc0 == 0x80) {
        return (@as(u32, b0 & 0x3f) << 8) | b1;
    }
    if (pos.* + 1 >= bytes.len) return error.ShortBlob;
    const b2 = bytes[pos.*];
    pos.* += 1;
    const b3 = bytes[pos.*];
    pos.* += 1;
    return (@as(u32, b0 & 0x1f) << 24) | (@as(u32, b1) << 16) | (@as(u32, b2) << 8) | b3;
}

fn readU8(bytes: []const u8, pos: *usize) Error!u8 {
    if (pos.* >= bytes.len) return error.ShortBlob;
    const b = bytes[pos.*];
    pos.* += 1;
    return b;
}

fn primitiveKind(code: u8) ?Kind {
    return switch (code) {
        ELEMENT_TYPE_VOID => .void,
        ELEMENT_TYPE_BOOLEAN => .bool,
        ELEMENT_TYPE_CHAR => .char,
        ELEMENT_TYPE_I1 => .i8,
        ELEMENT_TYPE_U1 => .u8,
        ELEMENT_TYPE_I2 => .i16,
        ELEMENT_TYPE_U2 => .u16,
        ELEMENT_TYPE_I4 => .i32,
        ELEMENT_TYPE_U4 => .u32,
        ELEMENT_TYPE_I8 => .i64,
        ELEMENT_TYPE_U8 => .u64,
        ELEMENT_TYPE_R4 => .f32,
        ELEMENT_TYPE_R8 => .f64,
        ELEMENT_TYPE_I => .isize,
        ELEMENT_TYPE_U => .usize,
        else => null,
    };
}

fn readType(bytes: []const u8, pos: *usize) Error!Ty {
    // Count pointer indirections. Anything else unsupported falls
    // through to `.unsupported` so the caller can skip cleanly.
    var ptrs: u8 = 0;
    while (true) {
        if (pos.* >= bytes.len) return error.ShortBlob;
        const peek = bytes[pos.*];
        if (peek != ELEMENT_TYPE_PTR) break;
        pos.* += 1;
        if (ptrs == MAX_PTR_DEPTH) return error.PointerTooDeep;
        ptrs += 1;
    }

    const code = try readU8(bytes, pos);
    if (primitiveKind(code)) |k| {
        return .{ .kind = k, .ptrs = ptrs };
    }
    switch (code) {
        ELEMENT_TYPE_VALUETYPE => {
            const ci = try readCompressed(bytes, pos);
            return .{ .kind = .value_ref, .ptrs = ptrs, .coded_index = ci };
        },
        ELEMENT_TYPE_CLASS => {
            const ci = try readCompressed(bytes, pos);
            return .{ .kind = .class_ref, .ptrs = ptrs, .coded_index = ci };
        },
        else => return .{ .kind = .unsupported, .ptrs = ptrs },
    }
}

/// Decode a MethodDef signature blob into a flat `Sig`. Allocator-
/// and File-free so it runs in the comptime VM.
pub fn decode(blob: []const u8) Error!Sig {
    var pos: usize = 0;
    const flags = try readU8(blob, &pos);
    const has_this = (flags & 0x20) != 0;

    const pc = try readCompressed(blob, &pos);
    if (pc > MAX_PARAMS) return error.TooManyParams;

    const ret = try readType(blob, &pos);

    var sig: Sig = .{
        .has_this = has_this,
        .param_count = pc,
        .return_type = ret,
        .params_buf = @splat(Ty{ .kind = .unsupported }),
    };

    var i: u32 = 0;
    while (i < pc) : (i += 1) {
        sig.params_buf[i] = try readType(blob, &pos);
    }
    // Don't enforce `pos == blob.len` — modifiers/sentinels we
    // don't understand yet would trip it. Future slice: strictly
    // validate the tail.
    return sig;
}

// ---- Tests --------------------------------------------------------------

test "decode: GetLastError -> WIN32_ERROR (value_ref, no params)" {
    // \x00\x00\x11\x81\x01
    // flags=0 (DEFAULT, no HASTHIS), param_count=0,
    // return = VALUETYPE + compressed coded-index 0x0101 (2-byte).
    const blob = "\x00\x00\x11\x81\x01";
    const sig = try decode(blob);
    try std.testing.expectEqual(false, sig.has_this);
    try std.testing.expectEqual(@as(u32, 0), sig.param_count);
    try std.testing.expectEqual(Kind.value_ref, sig.return_type.kind);
    try std.testing.expectEqual(@as(u8, 0), sig.return_type.ptrs);
    try std.testing.expectEqual(@as(u32, 0x0101), sig.return_type.coded_index);
}

test "decode: SetLastError(WIN32_ERROR) -> void" {
    // \x00\x01\x01\x11\x81\x01
    // flags=0, params=1, return=VOID, param0=VALUETYPE coded 0x0101.
    const blob = "\x00\x01\x01\x11\x81\x01";
    const sig = try decode(blob);
    try std.testing.expectEqual(@as(u32, 1), sig.param_count);
    try std.testing.expectEqual(Kind.void, sig.return_type.kind);
    try std.testing.expectEqual(Kind.value_ref, sig.params()[0].kind);
    try std.testing.expectEqual(@as(u32, 0x0101), sig.params()[0].coded_index);
}

test "decode: primitive-only synthetic sig" {
    // Hand-crafted: flags=0, params=2, return=u32, p0=i32, p1=*u8.
    const blob = "\x00\x02\x09\x08\x0f\x05";
    const sig = try decode(blob);
    try std.testing.expectEqual(@as(u32, 2), sig.param_count);
    try std.testing.expectEqual(Kind.u32, sig.return_type.kind);
    try std.testing.expectEqual(@as(u8, 0), sig.return_type.ptrs);
    try std.testing.expectEqual(Kind.i32, sig.params()[0].kind);
    try std.testing.expectEqual(Kind.u8, sig.params()[1].kind);
    try std.testing.expectEqual(@as(u8, 1), sig.params()[1].ptrs);
}

test "decode: works at comptime" {
    comptime {
        const blob = "\x00\x00\x11\x81\x01";
        const sig = try decode(blob);
        if (sig.return_type.kind != .value_ref) @compileError("expected value_ref");
        if (sig.return_type.coded_index != 0x0101) @compileError("wrong coded index");
    }
}

test "decode: ShortBlob on truncated input" {
    try std.testing.expectError(error.ShortBlob, decode(""));
    try std.testing.expectError(error.ShortBlob, decode("\x00"));
    try std.testing.expectError(error.ShortBlob, decode("\x00\x01\x09"));
}
