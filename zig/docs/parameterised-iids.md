# Parameterised IIDs for closed WinRT generics

Closed WinRT generics — `IVector<HSTRING>`, `IMap<HSTRING, object>`,
`IReference<bool>`, etc. — do not have their IID stored in winmd. The
TypeDef row is the **open** template; its `GuidAttribute` is the
*template* IID, not the per-instantiation IID. The runtime IID for a
closed generic is computed from a structural signature.

The Zig emitter computes it at codegen time and emits a literal
`pub const IID: GUID = .{ ... };` per instantiation, so callers can
`cast()` / `QueryInterface` against closed generics with no runtime
machinery.

## Algorithm

The recipe is the canonical RFC 4122 v5 UUID over the WinRT PIID
namespace, applied to a structural signature string.

### 1. Build the signature string

`runtimeSignature(ty)` walks the type and produces:

| Type                         | Signature                                       |
|------------------------------|-------------------------------------------------|
| `bool`                       | `b1`                                            |
| `u8`/`i8`                    | `u1` / `i1`                                     |
| `u16`/`i16`                  | `u2` / `i2`                                     |
| `u32`/`i32`                  | `u4` / `i4`                                     |
| `u64`/`i64`                  | `u8` / `i8`                                     |
| `f32`/`f64`                  | `f4` / `f8`                                     |
| `char` (UTF-16 code unit)    | `c2`                                            |
| `HSTRING` (`string`)         | `string`                                        |
| `GUID` (`g16`)               | `g16`                                           |
| `IInspectable` (`object`)    | `cinterface(IInspectable)`                      |
| Non-generic interface        | `{guid}` (lowercase, braces)                    |
| Closed generic interface     | `pinterface({guid};arg0;arg1;...)`              |
| `struct`                     | `struct(Ns.Name;f0;f1;...)`                     |
| `enum`                       | `enum(Ns.Name;underlying)`                      |
| Runtime class                | `rc(Ns.Class;{default-iface-iid})`              |
| Delegate                     | `delegate({guid})` (or `pinterface(...)` if generic) |

The signature is recursive: type arguments and field/element types are
expanded the same way.

### 2. Hash to a v5 UUID

`parameterizedIid(sig)`:

1. Prepend the 16-byte WinRT PIID namespace GUID:

   ```
   11 f4 7a d5 7b 73 42 c0 ab ae 87 8b 1e 16 ad ee
   ```

2. Append the signature bytes (UTF-8, no terminator).
3. SHA-1 the buffer; take the first 16 bytes.
4. Set version 5 and variant 10:

   ```
   bytes[6] = (bytes[6] & 0x0f) | 0x50;
   bytes[8] = (bytes[8] & 0x3f) | 0x80;
   ```

5. Repack as a Windows `GUID`:
   - `data1` = big-endian `u32` of `bytes[0..4]`
   - `data2` = big-endian `u16` of `bytes[4..6]`
   - `data3` = big-endian `u16` of `bytes[6..8]`
   - `data4` = `bytes[8..16]`

This matches `windows-core/src/guid.rs::from_signature` byte-for-byte.

## Golden vectors

These are validated end-to-end (computed at codegen time and accepted
by the OS's `QueryInterface` at runtime):

| Type                              | Computed IID                              | Validated by |
|-----------------------------------|-------------------------------------------|--------------|
| `IReference<bool>`                | `{3c00fd60-2950-5939-a21a-2d12c5a01b8a}`  | M0 unit test |
| `IVector<HSTRING>`                | `{98b9acc1-4b56-532e-ac73-03d5291cca90}`  | M2 unit test |
| `IMap<HSTRING, object>`           | `{1b0d3570-0877-5ec2-8a2c-3b9539506aca}`  | M4 sample (live `cast()` against `PropertySet`) |

The third row is the runtime proof: the sample
(`zig/samples/winrt_property_set`) activates
`Windows.Foundation.Collections.PropertySet`, then `cast()`s the
resulting `IInspectable` to `IMap<HSTRING, object>` using the
emitter-computed IID. A successful cast means the OS accepted our
GUID.

## Implementation pointers

- `zig/packages/winbindgen/src/root.zig`
  - `runtimeSignature` — sig builder.
  - `parameterizedIid` — SHA-1 + bit-flip + repack.
  - `emitGenericInstantiations` — calls both and emits the literal
    `pub const IID: GUID = ...;` per closed generic.
- `zig/packages/win-core/src/root.zig`
  - `IInspectable.cast(comptime V, *const GUID)` — the consumer-side
    helper that picks up the emitted `IID`.

## Reference (Rust)

For cross-checking byte recipes:

- `crates/libs/bindgen/src/types/mod.rs` — `runtime_signature`,
  `interface_signature`.
- `crates/libs/core/src/guid.rs` — `GUID::from_signature`.

## Out of scope (today)

- **Generic delegates** (`EventHandler<T>`, `TypedEventHandler<T,U>`):
  same sig recipe, different emitter site. Delegate handler-sugar is
  its own slice.
- **Generic methods** (`.mvar_generic`): still resolves to
  `UnsupportedElement`. Out of scope by construction — closed sigs
  cannot contain mvars.

## History

- Issue [#13](https://github.com/cataggar/windows-rs/issues/13).
- Shipped across PRs #20 (M1), #22 (M2), #23 (M3), #24 (M4), #25 (M5).
