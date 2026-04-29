//! Port of `crates/samples/windows/counter` — reads CPU usage via
//! Performance Data Helper (PDH) in a loop.
//!
//! Exercises: Win32 PDH APIs, opaque handle types, extern union access.
//!
//! Build:  `zig build counter`
//! Run:    `.\zig-out\bin\counter.exe`

const std = @import("std");
const win_sys = @import("win-sys");

const win = win_sys.project(.{
    .@"Windows.Win32.System.Performance" = .{
        "PdhOpenQueryW",
        "PdhAddCounterW",
        "PdhCollectQueryData",
        "PdhGetFormattedCounterValue",
    },
    .@"Windows.Win32.System.Threading" = .{"Sleep"},
});

// PDH handles are opaque (?*anyopaque aliases).
// PDH_FMT_COUNTERVALUE is an extern struct with an Anonymous union.
// We define the struct inline since it's not in the curated structs proxy.
const PDH_FMT_COUNTERVALUE = extern struct {
    CStatus: u32,
    Anonymous: extern union {
        longValue: i32,
        doubleValue: f64,
        largeValue: i64,
    },
};

const PDH_FMT_DOUBLE: u32 = 512;

pub fn main() void {
    var query: ?*anyopaque = null;
    if (win.PdhOpenQueryW(null, 0, &query) != 0) {
        std.debug.print("PdhOpenQueryW failed\n", .{});
        return;
    }

    const counter_path = comptime blk: {
        const s = "\\Processor(0)\\% Processor Time";
        var buf: [s.len:0]u16 = undefined;
        for (s, 0..) |c, i| buf[i] = c;
        buf[s.len] = 0;
        break :blk buf;
    };

    var counter: ?*anyopaque = null;
    if (win.PdhAddCounterW(query, @constCast(@ptrCast(&counter_path)), 0, &counter) != 0) {
        std.debug.print("PdhAddCounterW failed\n", .{});
        return;
    }

    std.debug.print("Reading CPU usage...\n", .{});

    var i: u32 = 0;
    while (i < 10) : (i += 1) {
        win.Sleep(1000);
        if (win.PdhCollectQueryData(query) != 0) continue;

        var value: PDH_FMT_COUNTERVALUE = undefined;
        @memset(std.mem.asBytes(&value), 0);
        var counter_type: u32 = 0;
        if (win.PdhGetFormattedCounterValue(counter, PDH_FMT_DOUBLE, &counter_type, @ptrCast(&value)) == 0) {
            std.debug.print("{d:.2}%\n", .{value.Anonymous.doubleValue});
        }
    }
}
