# Copilot instructions for windows-rs

`windows-rs` is the Rust language projection for the Windows API. It contains the `windows` and `windows-sys` crates along with supporting libraries, code generators, metadata readers, and regenerated bindings committed into the tree.

## Repository layout

Cargo workspace rooted at `Cargo.toml` with members under `crates/`:

- `crates/libs/*` — published crates (`windows`, `windows-sys`, `windows-core`, `windows-bindgen`, `windows-metadata`, `windows-rdl`, `windows-implement`, `windows-interface`, `windows-result`, `windows-strings`, `windows-targets`, `windows-link`, `windows-registry`, `windows-services`, `windows-threading`, `windows-future`, `windows-collections`, `windows-numerics`, `windows-version`, `cppwinrt`, `riddle`).
- `crates/tools/*` — internal code generators (`bindgen`, `bindings`, `yml`, `license`, `workspace`, `msvc`, `gnu`, `rdl_roundtrip`, `helpers`, `merge`). They run as `cargo run -p tool_<name>`.
- `crates/tests/{libs,misc,winrt}/*` — test crates; goldens/generated fixtures are committed and CI enforces `git diff --exit-code`.
- `crates/samples/*` — runnable samples grouped by style (`windows`, `windows-sys`, `json`, `csharp`, `services`, `robot`).
- `crates/targets/*` — generated import libs per target triple. `crates/targets/baseline` is excluded from the workspace.
- `crates/libs/bindgen/default/*.winmd` — the canonical metadata the tree is generated from.

## Build, test, lint

Primary toolchain is MSRV/stable on Windows MSVC; the published crates must stay `no_std`-friendly and free of unexpected cfgs. Warnings are denied in CI (`RUSTFLAGS=-D warnings`).

- Format: `cargo fmt --all` (CI runs `--check`; `rustfmt.toml` sets `newline_style = "Unix"`).
- Clippy: `cargo clippy --all --tests` (requires nightly on `windows-2025`, like CI).
- Full test matrix (as CI runs it):
  ```
  cargo test --all --exclude windows_aarch64_gnullvm --exclude windows_aarch64_msvc --exclude windows_i686_gnu --exclude windows_i686_gnullvm --exclude windows_i686_msvc --exclude windows_x86_64_gnu --exclude windows_x86_64_gnullvm --exclude windows_x86_64_msvc
  ```
  The `windows_*` target crates are excluded because they just re-export prebuilt import libs.
- Single crate / single test:
  ```
  cargo test -p <crate>                     # one crate
  cargo test -p <crate> --test <file>       # one integration test file (e.g. --test panic)
  cargo test -p <crate> <substring>         # filter by test name
  ```
- Other CI workflows worth mirroring locally when touching relevant areas: `msrv`, `no_std`, `no-default-features`, `slim_errors`, `miri`, `linux`, `cross`, `doc`.

## Code generation workflow (important)

Many files in the tree are generated and CI fails if they are stale. After editing metadata, bindgen, or any tool, rerun the relevant generator and commit the diff:

- `cargo run -p tool_bindings` — regenerates bindings for the published `windows*` crates by driving `windows-bindgen` with the `.txt` arg files in `crates/tools/bindings/src/`.
- `cargo run -p tool_bindgen` — regenerates the `.winmd` files under `crates/libs/bindgen/default/`.
- `cargo run -p tool_yml` — regenerates `.github/workflows/*.yml` entries derived from the workspace.
- `cargo run -p tool_license` — refreshes license headers / files.
- `cargo run -p tool_workspace` — regenerates workspace membership / related `Cargo.toml` bits.
- `cargo run -p tool_msvc` / `tool_gnu` — regenerate import libs under `crates/targets/*/lib/` (needs vcvars / MSYS2; see `.github/workflows/lib.yml`).

If `cargo test` modifies files, CI treats that as failure ("Tests changed code in the repo."). Either commit the regenerated output or fix the test — do not ignore it.

Roundtrip-style tests (e.g. `test_clang` under `crates/tests/libs/clang`) rewrite their golden `.rdl` files in place when run. To validate without clobbering goldens, run only the panic-check tests (e.g. `cargo test -p test_clang --test panic`) and restore any accidental regeneration with `git checkout -- <path>`.

## Conventions

- Don't hand-edit generated code. Look for a matching `tool_*` and rerun it.
- `libclang` is required for anything touching `windows-rdl`'s clang module and for `test_header2rdl`. CI installs LLVM 18 and sets `LIBCLANG_PATH`; locally set `LIBCLANG_PATH` to your LLVM `bin` (or `lib` on Linux) directory.
- Keep published `windows*` crates `no_std`-clean and `default-features = false` compatible — the `no_std` and `no-default-features` workflows will catch regressions.
- Workspace lints in root `Cargo.toml`: `unexpected_cfgs` is warn-allowlisted to `windows_raw_dylib` and `windows_slim_errors`; `missing_unsafe_on_extern` is warn. Don't introduce new cfgs without updating `check-cfg`.
- PRs should reference an existing issue (see `docs/contributing.md` and `.github/pull_request_template.md`).
- Commit messages include a `Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>` trailer when produced with Copilot assistance.
