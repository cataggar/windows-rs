//! Phase 6/O sample — real struct-field access on SYSTEM_INFO.
//!
//! Where `system-info` (6/G) only exercised the scalar APIs
//! (GetTickCount64, GetSystemDirectoryW), this probe picks the
//! first Win32 API whose out-param is a layout-exposing struct:
//!
//!   GetNativeSystemInfo(SYSTEM_INFO*)   -> void
//!
//! It validates that the anonymous-union shape `SYSTEM_INFO_0`
//! projects correctly: we read both the nested inner struct
//! (`Anonymous.Anonymous.wProcessorArchitecture`) and the
//! outer scalar fields (`dwPageSize`, `dwNumberOfProcessors`,
//! `dwActiveProcessorMask`, etc.) from the same buffer.
//!
//! Contrast with WIN32_FIND_DATAW (6/N), which was a flat record
//! of scalars + nested FILETIME. SYSTEM_INFO adds an `extern union`
//! on top of that — the last remaining shape in the Win32 struct
//! zoo before the generator can emit them wholesale.

const std = @import("std");
const win_sys = @import("win-sys");

pub fn main() !void {
    const win = win_sys.project(.{
        .@"Windows.Win32.System.SystemInformation" = .{
            "GetNativeSystemInfo",
        },
    });

    // Guard against layout regressions. On x64 `SYSTEM_INFO` is 48
    // bytes; on x86 it would be 36. We only ever run on x64 so pin
    // the exact number — if someone cross-compiles to i686 later
    // this assert will fire and force a conscious decision.
    comptime std.debug.assert(@sizeOf(win_sys.structs.SYSTEM_INFO) == 48);
    comptime std.debug.assert(@sizeOf(win_sys.structs.SYSTEM_INFO_0) == 4);
    comptime std.debug.assert(@sizeOf(win_sys.structs.SYSTEM_INFO_0_0) == 4);

    var info: win_sys.structs.SYSTEM_INFO = undefined;
    win.GetNativeSystemInfo(&info);

    // PROCESSOR_ARCHITECTURE enum values — see winnt.h. We don't
    // pull the whole enum alias in for this probe; the numeric
    // constants are stable and widely documented.
    const arch_name: []const u8 = switch (info.Anonymous.Anonymous.wProcessorArchitecture) {
        0 => "x86 (Intel)",
        5 => "ARM",
        6 => "IA64",
        9 => "x64 (AMD64)",
        12 => "ARM64",
        0xFFFF => "Unknown",
        else => "Other",
    };

    // Page size is almost universally 4096. Allocation granularity
    // is 65536 on every shipping Windows. Assert-based sanity beats
    // a flaky print-only sample.
    std.debug.assert(info.dwPageSize == 4096);
    std.debug.assert(info.dwAllocationGranularity == 65536);
    std.debug.assert(info.dwNumberOfProcessors >= 1);

    std.debug.print(
        "arch={s} (raw={d}) pageSize={d} allocGranularity={d}\n" ++
            "processors={d} activeMask=0x{x} procType={d} procLevel={d} procRev={d}\n" ++
            "minAppAddr={*} maxAppAddr={*}\n",
        .{
            arch_name,
            info.Anonymous.Anonymous.wProcessorArchitecture,
            info.dwPageSize,
            info.dwAllocationGranularity,
            info.dwNumberOfProcessors,
            info.dwActiveProcessorMask,
            info.dwProcessorType,
            info.wProcessorLevel,
            info.wProcessorRevision,
            info.lpMinimumApplicationAddress,
            info.lpMaximumApplicationAddress,
        },
    );
}
