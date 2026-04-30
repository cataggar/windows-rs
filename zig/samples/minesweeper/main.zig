//! Composition-backed Zig port of robmikh/minesweeper-rs.
//!
//! This keeps the existing pure game state in `minesweeper.zig` and renders
//! a board-sized grid of `SpriteVisual`s through Windows.UI.Composition.
//!
//! Build: `zig build samples`
//! Run:   `.\zig-out\bin\minesweeper.exe`

const std = @import("std");
const win = @import("win");
const win_sys = @import("win-sys");
const game_mod = @import("minesweeper.zig");

const core = win.core;
const Composition = win.WinRT.UI.Composition;
const CompositionDesktop = Composition.Desktop;
const Interop = win.Win32.System.WinRT.Composition;
const Numerics = win.WinRT.Numerics;
const System = win.WinRT.System;

const sys = win_sys.project(.{
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
});

const WAM = win_sys.index.@"Windows.Win32.UI.WindowsAndMessaging";

const tile = 28;
const margin = 12;
const header = 46;
const client_width = margin * 2 + game_mod.width * tile;
const client_height = header + margin + game_mod.height * tile;
const segment_count = 7;

const segment_top: u8 = 1 << 0;
const segment_upper_right: u8 = 1 << 1;
const segment_lower_right: u8 = 1 << 2;
const segment_bottom: u8 = 1 << 3;
const segment_lower_left: u8 = 1 << 4;
const segment_upper_left: u8 = 1 << 5;
const segment_middle: u8 = 1 << 6;
const segment_bits = [_]u8{
    segment_top,
    segment_upper_right,
    segment_lower_right,
    segment_bottom,
    segment_lower_left,
    segment_upper_left,
    segment_middle,
};
const segment_digit_masks = [_]u8{
    segment_top | segment_upper_right | segment_lower_right | segment_bottom | segment_lower_left | segment_upper_left,
    segment_upper_right | segment_lower_right,
    segment_top | segment_upper_right | segment_middle | segment_lower_left | segment_bottom,
    segment_top | segment_upper_right | segment_middle | segment_lower_right | segment_bottom,
    segment_upper_left | segment_middle | segment_upper_right | segment_lower_right,
    segment_top | segment_upper_left | segment_middle | segment_lower_right | segment_bottom,
    segment_top | segment_upper_left | segment_middle | segment_lower_left | segment_lower_right | segment_bottom,
    segment_top | segment_upper_right | segment_lower_right,
    segment_top | segment_upper_right | segment_lower_right | segment_bottom | segment_lower_left | segment_upper_left | segment_middle,
    segment_top | segment_upper_right | segment_lower_right | segment_bottom | segment_upper_left | segment_middle,
};
const segment_flag_mask = segment_top | segment_upper_left | segment_middle | segment_lower_left;
const segment_mine_mask = segment_digit_masks[8];

const DispatcherQueueOptions = extern struct {
    dwSize: u32,
    threadType: i32,
    apartmentType: i32,
};

const DQTYPE_THREAD_CURRENT: i32 = 2;
const DQTAT_COM_STA: i32 = 2;

extern "CoreMessaging" fn CreateDispatcherQueueController(
    options: DispatcherQueueOptions,
    dispatcher_queue_controller: *?*anyopaque,
) callconv(.winapi) core.HRESULT;

const BrushSet = struct {
    background: *const Composition.ICompositionColorBrush,
    hidden: *const Composition.ICompositionColorBrush,
    revealed: *const Composition.ICompositionColorBrush,
    empty: *const Composition.ICompositionColorBrush,
    flagged: *const Composition.ICompositionColorBrush,
    mine: *const Composition.ICompositionColorBrush,
    numbers: [9]*const Composition.ICompositionColorBrush,

    fn init(compositor: *const Composition.ICompositor) !BrushSet {
        return .{
            .background = try createBrush(compositor, rgba(0xff, 0x20, 0x23, 0x2a)),
            .hidden = try createBrush(compositor, rgba(0xff, 0x59, 0x66, 0x75)),
            .revealed = try createBrush(compositor, rgba(0xff, 0xd5, 0xd9, 0xdf)),
            .empty = try createBrush(compositor, rgba(0xff, 0xc5, 0xca, 0xd1)),
            .flagged = try createBrush(compositor, rgba(0xff, 0xe7, 0xb4, 0x4b)),
            .mine = try createBrush(compositor, rgba(0xff, 0xb8, 0x3a, 0x3a)),
            .numbers = .{
                try createBrush(compositor, rgba(0xff, 0xc5, 0xca, 0xd1)),
                try createBrush(compositor, rgba(0xff, 0x24, 0x5e, 0xc4)),
                try createBrush(compositor, rgba(0xff, 0x25, 0x7a, 0x39)),
                try createBrush(compositor, rgba(0xff, 0xb5, 0x32, 0x2d)),
                try createBrush(compositor, rgba(0xff, 0x55, 0x34, 0xa5)),
                try createBrush(compositor, rgba(0xff, 0x9a, 0x5a, 0x14)),
                try createBrush(compositor, rgba(0xff, 0x1b, 0x7f, 0x8c)),
                try createBrush(compositor, rgba(0xff, 0x1d, 0x1d, 0x1d)),
                try createBrush(compositor, rgba(0xff, 0x70, 0x70, 0x70)),
            },
        };
    }

    fn deinit(self: *BrushSet) void {
        _ = self.background.Release();
        _ = self.hidden.Release();
        _ = self.revealed.Release();
        _ = self.empty.Release();
        _ = self.flagged.Release();
        _ = self.mine.Release();
        for (self.numbers) |brush| {
            _ = brush.Release();
        }
    }

    fn forCell(self: *const BrushSet, cell: game_mod.Cell) *const Composition.ICompositionColorBrush {
        if (cell.visible and cell.mine) return self.mine;
        if (cell.flagged) return self.flagged;
        if (!cell.visible) return self.hidden;
        if (cell.neighbor_mines == 0) return self.empty;
        return self.revealed;
    }
};

const SegmentRect = struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
};

const CellVisual = struct {
    tile: *const Composition.ISpriteVisual,
    segments: [segment_count]*const Composition.ISpriteVisual,

    fn deinit(self: *const CellVisual) void {
        for (self.segments) |segment| {
            _ = segment.Release();
        }
        _ = self.tile.Release();
    }
};

const CompositionState = struct {
    dispatcher: *const System.IDispatcherQueueController,
    compositor: *const Composition.ICompositor,
    target: *const CompositionDesktop.IDesktopWindowTarget,
    root: *const Composition.IContainerVisual,
    background: *const Composition.ISpriteVisual,
    cells: [game_mod.cell_count]CellVisual,
    brushes: BrushSet,

    fn init(hwnd: win.Foundation.HWND, game: *const game_mod.Game) !CompositionState {
        try core.roInitialize(.single_threaded);
        errdefer core.winrt.RoUninitialize();

        var dispatcher_raw: ?*anyopaque = null;
        try core.hresult.ok(CreateDispatcherQueueController(.{
            .dwSize = @intCast(@sizeOf(DispatcherQueueOptions)),
            .threadType = DQTYPE_THREAD_CURRENT,
            .apartmentType = DQTAT_COM_STA,
        }, &dispatcher_raw));
        const dispatcher_ptr = dispatcher_raw orelse return error.CreateDispatcherQueueControllerFailed;
        const dispatcher: *const System.IDispatcherQueueController =
            @ptrCast(@alignCast(dispatcher_ptr));
        errdefer _ = dispatcher.Release();

        const compositor = try core.activateInstance(
            Composition.ICompositor,
            &Composition.Compositor.NAME_W,
        );
        errdefer _ = compositor.Release();

        const desktop_interop =
            compositor.cast(Interop.ICompositorDesktopInterop) orelse
            return error.NoCompositorDesktopInterop;
        defer _ = desktop_interop.Release();

        var target_raw: *CompositionDesktop.DesktopWindowTarget = undefined;
        try core.hresult.ok(desktop_interop.CreateDesktopWindowTarget(
            hwnd,
            0,
            &target_raw,
        ));
        const target: *const CompositionDesktop.IDesktopWindowTarget =
            @ptrCast(@alignCast(target_raw));
        errdefer _ = target.Release();

        const target_composition =
            target.cast(Composition.ICompositionTarget) orelse
            return error.NoCompositionTarget;
        defer _ = target_composition.Release();

        var root_raw: *Composition.ContainerVisual = undefined;
        try core.hresult.ok(compositor.CreateContainerVisual(&root_raw));
        const root: *const Composition.IContainerVisual =
            @ptrCast(@alignCast(root_raw));
        errdefer _ = root.Release();

        const root_visual =
            root.cast(Composition.IVisual) orelse return error.NoRootVisual;
        defer _ = root_visual.Release();
        try core.hresult.ok(root_visual.put_Size(vec2(
            @floatFromInt(client_width),
            @floatFromInt(client_height),
        )));
        try core.hresult.ok(target_composition.put_Root(
            @ptrCast(@constCast(root_visual)),
        ));

        var children_raw: *Composition.VisualCollection = undefined;
        try core.hresult.ok(root.get_Children(&children_raw));
        const children: *const Composition.IVisualCollection =
            @ptrCast(@alignCast(children_raw));
        defer _ = children.Release();

        var brushes = try BrushSet.init(compositor);
        errdefer brushes.deinit();

        const background = try createSprite(
            compositor,
            children,
            0,
            0,
            client_width,
            client_height,
            brushes.background,
        );
        errdefer _ = background.Release();

        var cells: [game_mod.cell_count]CellVisual = undefined;
        var visual_count: usize = 0;
        errdefer {
            for (cells[0..visual_count]) |visual| {
                visual.deinit();
            }
        }

        for (0..game_mod.cell_count) |i| {
            const col: i32 = @intCast(game_mod.colOf(i));
            const row: i32 = @intCast(game_mod.rowOf(i));
            cells[i] = try createCellVisual(
                compositor,
                children,
                col,
                row,
                &brushes,
                game.cells[i],
            );
            visual_count += 1;
        }

        return .{
            .dispatcher = dispatcher,
            .compositor = compositor,
            .target = target,
            .root = root,
            .background = background,
            .cells = cells,
            .brushes = brushes,
        };
    }

    fn render(self: *CompositionState, game: *const game_mod.Game) !void {
        for (game.cells, 0..) |cell, i| {
            try self.renderCell(&self.cells[i], cell);
        }
    }

    fn renderCell(
        self: *CompositionState,
        cell_visual: *const CellVisual,
        cell: game_mod.Cell,
    ) !void {
        if (cell.flagged and !cell.visible) {
            try setSpriteBrush(cell_visual.tile, self.brushes.hidden);
            try setSegmentPattern(cell_visual, segment_flag_mask, self.brushes.flagged);
            return;
        }

        try setSpriteBrush(cell_visual.tile, self.brushes.forCell(cell));
        if (cell.visible and cell.mine) {
            try setSegmentPattern(cell_visual, segment_mine_mask, self.brushes.numbers[7]);
        } else if (!cell.visible or cell.neighbor_mines == 0) {
            try setSegmentPattern(cell_visual, 0, self.brushes.hidden);
        } else {
            try setSegmentPattern(
                cell_visual,
                segment_digit_masks[cell.neighbor_mines],
                self.brushes.numbers[cell.neighbor_mines],
            );
        }
    }

    fn deinit(self: *CompositionState) void {
        for (self.cells) |cell| {
            cell.deinit();
        }
        _ = self.background.Release();
        self.brushes.deinit();
        _ = self.root.Release();
        _ = self.target.Release();
        _ = self.compositor.Release();
        _ = self.dispatcher.Release();
        core.winrt.RoUninitialize();
    }
};

const App = struct {
    game: game_mod.Game,
    composition: CompositionState,

    fn init(hwnd: win.Foundation.HWND) !App {
        var game = game_mod.Game.init(seed());
        return .{
            .composition = try CompositionState.init(hwnd, &game),
            .game = game,
        };
    }

    fn deinit(self: *App) void {
        self.composition.deinit();
    }

    fn render(self: *App) void {
        self.composition.render(&self.game) catch |err| {
            std.debug.print("minesweeper render failed: {}\n", .{err});
        };
    }

    fn restart(self: *App) void {
        self.game.restart(seed());
        self.render();
    }
};

fn createBrush(
    compositor: *const Composition.ICompositor,
    color: win.WinRT.UI.Color,
) !*const Composition.ICompositionColorBrush {
    var raw: *Composition.CompositionColorBrush = undefined;
    try core.hresult.ok(compositor.CreateColorBrush_2(color, &raw));
    return @ptrCast(@alignCast(raw));
}

fn createSprite(
    compositor: *const Composition.ICompositor,
    children: *const Composition.IVisualCollection,
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    brush: *const Composition.ICompositionColorBrush,
) !*const Composition.ISpriteVisual {
    var raw: *Composition.SpriteVisual = undefined;
    try core.hresult.ok(compositor.CreateSpriteVisual(&raw));
    const sprite: *const Composition.ISpriteVisual = @ptrCast(@alignCast(raw));
    errdefer _ = sprite.Release();

    try setSpriteBrush(sprite, brush);

    const visual = sprite.cast(Composition.IVisual) orelse return error.NoSpriteVisual;
    defer _ = visual.Release();
    try core.hresult.ok(visual.put_Offset(vec3(
        @floatFromInt(x),
        @floatFromInt(y),
        0,
    )));
    try core.hresult.ok(visual.put_Size(vec2(
        @floatFromInt(width),
        @floatFromInt(height),
    )));
    try core.hresult.ok(children.InsertAtTop(
        @ptrCast(@constCast(visual)),
    ));

    return sprite;
}

fn createCellVisual(
    compositor: *const Composition.ICompositor,
    children: *const Composition.IVisualCollection,
    col: i32,
    row: i32,
    brushes: *const BrushSet,
    cell: game_mod.Cell,
) !CellVisual {
    const x = margin + col * tile + 1;
    const y = header + row * tile + 1;
    const tile_visual = try createSprite(
        compositor,
        children,
        x,
        y,
        tile - 2,
        tile - 2,
        brushes.forCell(cell),
    );
    errdefer _ = tile_visual.Release();

    var segments: [segment_count]*const Composition.ISpriteVisual = undefined;
    var initialized: usize = 0;
    errdefer {
        for (segments[0..initialized]) |segment| {
            _ = segment.Release();
        }
    }

    const rects = segmentRects(x, y);
    for (rects, 0..) |rect, i| {
        segments[i] = try createSprite(
            compositor,
            children,
            rect.x,
            rect.y,
            rect.width,
            rect.height,
            brushes.hidden,
        );
        initialized += 1;
        try setSpriteOpacity(segments[i], 0);
    }

    const result: CellVisual = .{
        .tile = tile_visual,
        .segments = segments,
    };
    try setSegmentPattern(&result, markerMask(cell), markerBrush(brushes, cell));
    return result;
}

fn segmentRects(x: i32, y: i32) [segment_count]SegmentRect {
    const digit_x = x + 5;
    const digit_y = y + 3;
    return .{
        .{ .x = digit_x + 3, .y = digit_y, .width = 10, .height = 3 },
        .{ .x = digit_x + 13, .y = digit_y + 2, .width = 3, .height = 8 },
        .{ .x = digit_x + 13, .y = digit_y + 11, .width = 3, .height = 8 },
        .{ .x = digit_x + 3, .y = digit_y + 18, .width = 10, .height = 3 },
        .{ .x = digit_x, .y = digit_y + 11, .width = 3, .height = 8 },
        .{ .x = digit_x, .y = digit_y + 2, .width = 3, .height = 8 },
        .{ .x = digit_x + 3, .y = digit_y + 9, .width = 10, .height = 3 },
    };
}

fn markerMask(cell: game_mod.Cell) u8 {
    if (cell.flagged and !cell.visible) return segment_flag_mask;
    if (cell.mine) return segment_mine_mask;
    if (!cell.visible or cell.neighbor_mines == 0) return 0;
    return segment_digit_masks[cell.neighbor_mines];
}

fn markerBrush(
    brushes: *const BrushSet,
    cell: game_mod.Cell,
) *const Composition.ICompositionColorBrush {
    if (cell.flagged and !cell.visible) return brushes.flagged;
    if (cell.mine) return brushes.numbers[7];
    return brushes.numbers[cell.neighbor_mines];
}

fn setSegmentPattern(
    cell_visual: *const CellVisual,
    mask: u8,
    brush: *const Composition.ICompositionColorBrush,
) !void {
    for (cell_visual.segments, 0..) |segment, i| {
        if ((mask & segment_bits[i]) != 0) {
            try setSpriteBrush(segment, brush);
            try setSpriteOpacity(segment, 1);
        } else {
            try setSpriteOpacity(segment, 0);
        }
    }
}

fn setSpriteBrush(
    sprite: *const Composition.ISpriteVisual,
    brush: *const Composition.ICompositionColorBrush,
) !void {
    const brush_base =
        brush.cast(Composition.ICompositionBrush) orelse
        return error.NoCompositionBrush;
    defer _ = brush_base.Release();
    try core.hresult.ok(sprite.put_Brush(
        @ptrCast(@constCast(brush_base)),
    ));
}

fn setSpriteOpacity(
    sprite: *const Composition.ISpriteVisual,
    opacity: f32,
) !void {
    const visual = sprite.cast(Composition.IVisual) orelse return error.NoSpriteVisual;
    defer _ = visual.Release();
    try core.hresult.ok(visual.put_Opacity(opacity));
}

fn appFromWindow(hwnd: ?*anyopaque) ?*App {
    const raw = sys.GetWindowLongPtrA(hwnd, WAM.GWLP_USERDATA);
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
        WAM.WM_LBUTTONDOWN => {
            if (appFromWindow(hwnd)) |app| {
                if (cellFromLparam(lparam)) |cell| {
                    app.game.sweep(cell);
                    app.render();
                }
            }
            return 0;
        },
        WAM.WM_RBUTTONDOWN => {
            if (appFromWindow(hwnd)) |app| {
                if (cellFromLparam(lparam)) |cell| {
                    app.game.toggleFlag(cell);
                    app.render();
                }
            }
            return 0;
        },
        WAM.WM_KEYDOWN => {
            if (wparam == 'R' or wparam == 'r') {
                if (appFromWindow(hwnd)) |app| {
                    app.restart();
                }
                return 0;
            }
        },
        WAM.WM_DESTROY => {
            sys.PostQuitMessage(0);
            return 0;
        },
        else => {},
    }

    return sys.DefWindowProcA(hwnd, message, wparam, lparam);
}

fn cellFromLparam(lparam: isize) ?usize {
    const bits: usize = @bitCast(lparam);
    const x: i16 = @bitCast(@as(u16, @truncate(bits)));
    const y: i16 = @bitCast(@as(u16, @truncate(bits >> 16)));

    const rel_x = @as(i32, x) - margin;
    const rel_y = @as(i32, y) - header;
    if (rel_x < 0 or rel_y < 0) return null;

    const col: usize = @intCast(@divTrunc(rel_x, tile));
    const row: usize = @intCast(@divTrunc(rel_y, tile));
    if (col >= game_mod.width or row >= game_mod.height) return null;
    return game_mod.index(row, col);
}

fn seed() u64 {
    const ticks = sys.GetTickCount64();
    return if (ticks == 0) 1 else ticks;
}

fn vec2(x: f32, y: f32) Numerics.Vector2 {
    return .{ .X = x, .Y = y };
}

fn vec3(x: f32, y: f32, z: f32) Numerics.Vector3 {
    return .{ .X = x, .Y = y, .Z = z };
}

fn rgba(a: u8, r: u8, g: u8, b: u8) win.WinRT.UI.Color {
    return .{ .A = a, .R = r, .G = g, .B = b };
}

pub fn main() !void {
    const instance = sys.GetModuleHandleA(null);
    if (instance == null) return error.GetModuleHandleFailed;

    var class_name = "zig-minesweeper-composition".*;
    const class_name_ptr: ?[*:0]u8 = &class_name;

    var wc: win_sys.structs.WNDCLASSA = undefined;
    @memset(std.mem.asBytes(&wc), 0);
    wc.style = WAM.CS_HREDRAW | WAM.CS_VREDRAW;
    wc.lpfnWndProc = @ptrCast(&wndproc);
    wc.hInstance = .{ .Value = instance.? };
    const idc_arrow: ?[*:0]u16 = @ptrFromInt(@as(usize, WAM.IDC_ARROW));
    const cursor = sys.LoadCursorW(null, idc_arrow);
    if (cursor != null) wc.hCursor = .{ .Value = cursor.? };
    wc.lpszClassName = .{ .Value = @ptrCast(&class_name) };

    const atom = sys.RegisterClassA(&wc);
    if (atom == 0) return error.RegisterClassFailed;

    var title = "Zig Minesweeper - Composition".*;
    const title_ptr: ?[*:0]u8 = &title;
    const hwnd = sys.CreateWindowExA(
        WAM.WS_EX_NOREDIRECTIONBITMAP,
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

    var app = try App.init(.{ .Value = hwnd.? });
    defer app.deinit();
    _ = sys.SetWindowLongPtrA(hwnd, WAM.GWLP_USERDATA, @intCast(@intFromPtr(&app)));

    _ = sys.ShowWindow(hwnd, WAM.SW_SHOW);

    var message: win_sys.structs.MSG = undefined;
    @memset(std.mem.asBytes(&message), 0);
    while (sys.GetMessageA(&message, null, 0, 0) != 0) {
        _ = sys.TranslateMessage(&message);
        _ = sys.DispatchMessageA(&message);
    }
}
