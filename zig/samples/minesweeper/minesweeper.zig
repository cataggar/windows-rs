const std = @import("std");

pub const width = 16;
pub const height = 16;
pub const mine_count = 40;
pub const cell_count = width * height;

pub const Status = enum {
    playing,
    won,
    lost,
};

pub const Cell = struct {
    mine: bool = false,
    visible: bool = false,
    flagged: bool = false,
    neighbor_mines: u8 = 0,
};

pub const Game = struct {
    cells: [cell_count]Cell,
    generated: bool,
    status: Status,
    remaining_safe: u16,
    rng: std.Random.DefaultPrng,

    pub fn init(seed: u64) Game {
        return .{
            .cells = [_]Cell{.{}} ** cell_count,
            .generated = false,
            .status = .playing,
            .remaining_safe = cell_count - mine_count,
            .rng = std.Random.DefaultPrng.init(seed),
        };
    }

    pub fn restart(self: *Game, seed: u64) void {
        self.* = init(seed);
    }

    pub fn toggleFlag(self: *Game, cell_index: usize) void {
        if (self.status != .playing) return;
        if (cell_index >= cell_count) return;

        var cell = &self.cells[cell_index];
        if (cell.visible) return;
        cell.flagged = !cell.flagged;
    }

    pub fn sweep(self: *Game, cell_index: usize) void {
        if (self.status != .playing) return;
        if (cell_index >= cell_count) return;
        if (self.cells[cell_index].flagged or self.cells[cell_index].visible) return;

        if (!self.generated) {
            self.generate(cell_index);
        }

        if (self.cells[cell_index].mine) {
            self.cells[cell_index].visible = true;
            self.revealMines();
            self.status = .lost;
            return;
        }

        self.revealRegion(cell_index);
        if (self.remaining_safe == 0) {
            self.status = .won;
            for (&self.cells) |*cell| {
                if (cell.mine) cell.flagged = true;
            }
        }
    }

    pub fn flags(self: *const Game) u16 {
        var total: u16 = 0;
        for (self.cells) |cell| {
            if (cell.flagged) total += 1;
        }
        return total;
    }

    pub fn mineTotal(self: *const Game) u16 {
        var total: u16 = 0;
        for (self.cells) |cell| {
            if (cell.mine) total += 1;
        }
        return total;
    }

    fn generate(self: *Game, first_sweep: usize) void {
        var candidates: [cell_count - 1]u16 = undefined;
        var len: usize = 0;
        for (0..cell_count) |i| {
            if (i == first_sweep) continue;
            candidates[len] = @intCast(i);
            len += 1;
        }

        var random = self.rng.random();
        random.shuffle(u16, candidates[0..len]);

        for (candidates[0..mine_count]) |candidate| {
            self.cells[candidate].mine = true;
        }

        for (0..cell_count) |i| {
            if (!self.cells[i].mine) {
                self.cells[i].neighbor_mines = self.countNeighborMines(i);
            }
        }

        self.generated = true;
    }

    fn countNeighborMines(self: *const Game, cell_index: usize) u8 {
        var total: u8 = 0;
        var neighbors = NeighborIterator.init(cell_index);
        while (neighbors.next()) |neighbor| {
            if (self.cells[neighbor].mine) total += 1;
        }
        return total;
    }

    fn revealRegion(self: *Game, cell_index: usize) void {
        var stack: [cell_count]usize = undefined;
        var stack_len: usize = 0;

        self.revealSafeCell(cell_index, &stack, &stack_len);
        while (stack_len > 0) {
            stack_len -= 1;
            const current = stack[stack_len];

            var neighbors = NeighborIterator.init(current);
            while (neighbors.next()) |neighbor| {
                self.revealSafeCell(neighbor, &stack, &stack_len);
            }
        }
    }

    fn revealSafeCell(
        self: *Game,
        cell_index: usize,
        stack: *[cell_count]usize,
        stack_len: *usize,
    ) void {
        var cell = &self.cells[cell_index];
        if (cell.visible or cell.flagged or cell.mine) return;

        cell.visible = true;
        self.remaining_safe -= 1;

        if (cell.neighbor_mines == 0) {
            stack[stack_len.*] = cell_index;
            stack_len.* += 1;
        }
    }

    fn revealMines(self: *Game) void {
        for (&self.cells) |*cell| {
            if (cell.mine) cell.visible = true;
        }
    }
};

pub fn index(row: usize, col: usize) usize {
    return row * width + col;
}

pub fn rowOf(cell_index: usize) usize {
    return cell_index / width;
}

pub fn colOf(cell_index: usize) usize {
    return cell_index % width;
}

const NeighborIterator = struct {
    row: i32,
    col: i32,
    next_slot: usize,

    const offsets = [_][2]i32{
        .{ -1, -1 },
        .{ -1, 0 },
        .{ -1, 1 },
        .{ 0, -1 },
        .{ 0, 1 },
        .{ 1, -1 },
        .{ 1, 0 },
        .{ 1, 1 },
    };

    fn init(cell_index: usize) NeighborIterator {
        return .{
            .row = @intCast(rowOf(cell_index)),
            .col = @intCast(colOf(cell_index)),
            .next_slot = 0,
        };
    }

    fn next(self: *NeighborIterator) ?usize {
        while (self.next_slot < offsets.len) : (self.next_slot += 1) {
            const offset = offsets[self.next_slot];
            const row = self.row + offset[0];
            const col = self.col + offset[1];
            if (row < 0 or row >= height or col < 0 or col >= width) continue;

            self.next_slot += 1;
            return index(@intCast(row), @intCast(col));
        }
        return null;
    }
};

test "first sweep places the requested mine count and spares the clicked cell" {
    var game = Game.init(1234);
    game.sweep(index(4, 4));

    try std.testing.expect(game.generated);
    try std.testing.expect(!game.cells[index(4, 4)].mine);
    try std.testing.expectEqual(@as(u16, mine_count), game.mineTotal());
}

test "flagged cells do not sweep" {
    var game = Game.init(1);
    const target = index(0, 0);

    game.toggleFlag(target);
    game.sweep(target);

    try std.testing.expect(!game.generated);
    try std.testing.expect(game.cells[target].flagged);
    try std.testing.expect(!game.cells[target].visible);
}
