//! Playable Zig port of robmikh/minesweeper-rs.
//!
//! The original sample renders with Windows.UI.Composition. This version
//! ports the game, window, input, and render loop structure and draws the
//! board with Win32/GDI so it exercises today's Win32 projection end-to-end.
//!
//! Build: `zig build samples`
//! Run:   `.\zig-out\bin\minesweeper.exe`

const std = @import("std");
const win_sys = @import("win-sys");
const game_mod = @import("minesweeper.zig");

const win = win_sys.project(.{
    .@"Windows.Win32.UI.WindowsAndMessaging" = .{
        "RegisterClassA",
        "CreateWindowExA",
        "DefWindowProcA",
        "GetMessageA",
        "TranslateMessage",
        "DispatchMessageA",
        "PostQuitMessage",
        "LoadCursorW",
        "ShowWindow",
        "SetWindowLongPtrA",
        "GetWindowLongPtrA",
    },
    .@"Windows.Win32.System.LibraryLoader" = .{"GetModuleHandleA"},
    .@"Windows.Win32.System.SystemInformation" = .{"GetTickCount64"},
    .@"Windows.Win32.Graphics.Gdi" = .{
        "FillRect",
        "CreateSolidBrush",
        "DeleteObject",
        "TextOutA",
        "SetBkMode",
        "SetTextColor",
        "InvalidateRect",
        "UpdateWindow",
    },
});

const WAM = win_sys.index.@"Windows.Win32.UI.WindowsAndMessaging";

const tile = 28;
const margin = 12;
const header = 46;
const client_width = margin * 2 + game_mod.width * tile;
const client_height = header + margin + game_mod.height * tile;

const PAINTSTRUCT = extern struct {
    hdc: ?*anyopaque,
    fErase: i32,
    rcPaint: win_sys.structs.RECT,
    fRestore: i32,
    fIncUpdate: i32,
    rgbReserved: [32]u8,
};

extern "USER32" fn BeginPaint(hwnd: ?*anyopaque, paint: *PAINTSTRUCT) callconv(.winapi) ?*anyopaque;
extern "USER32" fn EndPaint(hwnd: ?*anyopaque, paint: *PAINTSTRUCT) callconv(.winapi) i32;

const App = struct {
    game: game_mod.Game,

    fn init() App {
        return .{ .game = game_mod.Game.init(seed()) };
    }

    fn restart(self: *App) void {
        self.game.restart(seed());
    }
};

fn seed() u64 {
    const ticks = win.GetTickCount64();
    return if (ticks == 0) 1 else ticks;
}

fn appFromWindow(hwnd: ?*anyopaque) ?*App {
    const raw = win.GetWindowLongPtrA(hwnd, WAM.GWLP_USERDATA);
    if (raw == 0) return null;
    return @ptrFromInt(@as(usize, @intCast(raw)));
}

fn wndproc(
    hwnd: ?*anyopaque,
    message: u32,
    wparam: usize,
    lparam: isize,
) callconv(.winapi) isize {
    switch (message) {
        WAM.WM_PAINT => {
            if (appFromWindow(hwnd)) |app| {
                var ps: PAINTSTRUCT = undefined;
                @memset(std.mem.asBytes(&ps), 0);
                const hdc = BeginPaint(hwnd, &ps);
                if (hdc != null) {
                    render(hdc, &app.game);
                }
                _ = EndPaint(hwnd, &ps);
                return 0;
            }
        },
        WAM.WM_LBUTTONDOWN => {
            if (appFromWindow(hwnd)) |app| {
                if (cellFromLparam(lparam)) |cell| {
                    app.game.sweep(cell);
                    _ = win.InvalidateRect(hwnd, null, 1);
                }
            }
            return 0;
        },
        WAM.WM_RBUTTONDOWN => {
            if (appFromWindow(hwnd)) |app| {
                if (cellFromLparam(lparam)) |cell| {
                    app.game.toggleFlag(cell);
                    _ = win.InvalidateRect(hwnd, null, 1);
                }
            }
            return 0;
        },
        WAM.WM_KEYDOWN => {
            if (wparam == 'R' or wparam == 'r') {
                if (appFromWindow(hwnd)) |app| {
                    app.restart();
                    _ = win.InvalidateRect(hwnd, null, 1);
                }
                return 0;
            }
        },
        WAM.WM_DESTROY => {
            win.PostQuitMessage(0);
            return 0;
        },
        else => {},
    }

    return win.DefWindowProcA(hwnd, message, wparam, lparam);
}

fn cellFromLparam(lparam: isize) ?usize {
    const bits: usize = @bitCast(lparam);
    const x: i16 = @bitCast(@as(u16, @truncate(bits)));
    const y: i16 = @bitCast(@as(u16, @truncate(bits >> 16)));

    const board_x = @as(i32, margin);
    const board_y = @as(i32, header);
    const rel_x = @as(i32, x) - board_x;
    const rel_y = @as(i32, y) - board_y;
    if (rel_x < 0 or rel_y < 0) return null;

    const col: usize = @intCast(@divTrunc(rel_x, tile));
    const row: usize = @intCast(@divTrunc(rel_y, tile));
    if (col >= game_mod.width or row >= game_mod.height) return null;
    return game_mod.index(row, col);
}

fn render(hdc: ?*anyopaque, game: *const game_mod.Game) void {
    fill(hdc, rect(0, 0, client_width, client_height), rgb(0x20, 0x23, 0x2a));

    var status_buf: [128:0]u8 = undefined;
    @memset(std.mem.asBytes(&status_buf), 0);
    const status = switch (game.status) {
        .playing => std.fmt.bufPrint(status_buf[0..status_buf.len], "Mines: {d}/{d}   Left opens, right flags, R restarts", .{
            game.flags(),
            game_mod.mine_count,
        }) catch return,
        .won => std.fmt.bufPrint(status_buf[0..status_buf.len], "You won! Press R to play again.", .{}) catch return,
        .lost => std.fmt.bufPrint(status_buf[0..status_buf.len], "Boom! Press R to try again.", .{}) catch return,
    };

    _ = win.SetBkMode(hdc, 1);
    _ = win.SetTextColor(hdc, rgb(0xf2, 0xf2, 0xf2));
    _ = win.TextOutA(hdc, margin, 16, @ptrCast(&status_buf), @intCast(status.len));

    for (game.cells, 0..) |cell, i| {
        const row: i32 = @intCast(game_mod.rowOf(i));
        const col: i32 = @intCast(game_mod.colOf(i));
        const left = margin + col * tile;
        const top = header + row * tile;
        const cell_rect = rect(left, top, left + tile, top + tile);

        if (cell.visible) {
            fill(hdc, cell_rect, if (cell.mine) rgb(0xb8, 0x3a, 0x3a) else rgb(0xd5, 0xd9, 0xdf));
            if (cell.mine) {
                drawText(hdc, left + 9, top + 6, "X", rgb(0xff, 0xff, 0xff));
            } else if (cell.neighbor_mines != 0) {
                drawDigit(hdc, left + 10, top + 6, cell.neighbor_mines);
            }
        } else if (cell.flagged) {
            fill(hdc, cell_rect, rgb(0xe7, 0xb4, 0x4b));
            drawText(hdc, left + 10, top + 6, "F", rgb(0x22, 0x22, 0x22));
        } else {
            fill(hdc, cell_rect, rgb(0x59, 0x66, 0x75));
        }

        border(hdc, cell_rect, rgb(0x17, 0x19, 0x1f));
    }
}

fn drawDigit(hdc: ?*anyopaque, x: i32, y: i32, value: u8) void {
    const color = switch (value) {
        1 => rgb(0x24, 0x5e, 0xc4),
        2 => rgb(0x25, 0x7a, 0x39),
        3 => rgb(0xb5, 0x32, 0x2d),
        4 => rgb(0x55, 0x34, 0xa5),
        else => rgb(0x1d, 0x1d, 0x1d),
    };

    var buf = "0".*;
    buf[0] = '0' + value;
    _ = win.SetTextColor(hdc, color);
    _ = win.TextOutA(hdc, x, y, &buf, 1);
}

fn drawText(hdc: ?*anyopaque, x: i32, y: i32, comptime text: []const u8, color: u32) void {
    var buf = (text ++ "\x00").*;
    _ = win.SetTextColor(hdc, color);
    _ = win.TextOutA(hdc, x, y, &buf, text.len);
}

fn border(hdc: ?*anyopaque, r: win_sys.structs.RECT, color: u32) void {
    fill(hdc, rect(r.left, r.top, r.right, r.top + 1), color);
    fill(hdc, rect(r.left, r.bottom - 1, r.right, r.bottom), color);
    fill(hdc, rect(r.left, r.top, r.left + 1, r.bottom), color);
    fill(hdc, rect(r.right - 1, r.top, r.right, r.bottom), color);
}

fn fill(hdc: ?*anyopaque, r: win_sys.structs.RECT, color: u32) void {
    const brush = win.CreateSolidBrush(color);
    if (brush == null) return;
    defer _ = win.DeleteObject(brush);
    var mutable_rect = r;
    _ = win.FillRect(hdc, &mutable_rect, brush);
}

fn rect(left: i32, top: i32, right: i32, bottom: i32) win_sys.structs.RECT {
    return .{
        .left = left,
        .top = top,
        .right = right,
        .bottom = bottom,
    };
}

fn rgb(r: u8, g: u8, b: u8) u32 {
    return @as(u32, r) | (@as(u32, g) << 8) | (@as(u32, b) << 16);
}

pub fn main() !void {
    const instance = win.GetModuleHandleA(null);
    if (instance == null) return error.GetModuleHandleFailed;

    var app = App.init();

    var class_name = "zig-minesweeper".*;
    const class_name_ptr: ?[*:0]u8 = &class_name;

    var wc: win_sys.structs.WNDCLASSA = undefined;
    @memset(std.mem.asBytes(&wc), 0);
    wc.style = WAM.CS_HREDRAW | WAM.CS_VREDRAW;
    wc.lpfnWndProc = @ptrCast(&wndproc);
    wc.hInstance = .{ .Value = instance.? };
    const idc_arrow: ?[*:0]u16 = @ptrFromInt(@as(usize, WAM.IDC_ARROW));
    const cursor = win.LoadCursorW(null, idc_arrow);
    if (cursor != null) wc.hCursor = .{ .Value = cursor.? };
    wc.lpszClassName = .{ .Value = @ptrCast(&class_name) };

    const atom = win.RegisterClassA(&wc);
    if (atom == 0) return error.RegisterClassFailed;

    var title = "Zig Minesweeper".*;
    const title_ptr: ?[*:0]u8 = &title;
    const hwnd = win.CreateWindowExA(
        0,
        class_name_ptr,
        title_ptr,
        WAM.WS_OVERLAPPEDWINDOW | WAM.WS_VISIBLE,
        WAM.CW_USEDEFAULT,
        WAM.CW_USEDEFAULT,
        client_width + 18,
        client_height + 46,
        null,
        null,
        instance,
        null,
    );
    if (hwnd == null) return error.CreateWindowFailed;

    _ = win.SetWindowLongPtrA(hwnd, WAM.GWLP_USERDATA, @intCast(@intFromPtr(&app)));
    _ = win.ShowWindow(hwnd, WAM.SW_SHOW);
    _ = win.UpdateWindow(hwnd);

    var message: win_sys.structs.MSG = undefined;
    @memset(std.mem.asBytes(&message), 0);
    while (win.GetMessageA(&message, null, 0, 0) != 0) {
        _ = win.TranslateMessage(&message);
        _ = win.DispatchMessageA(&message);
    }
}
