class PrintingGrid
  def initialize(grid)
    @grid = grid
  end

  def accessible_rolls_count
    count = 0

    @grid.each_with_index do |row, y|
      row.chars.each_with_index do |cell, x|
        if cell == '@'
          neighbor_count = count_paper_neighbors(x, y)
          count += 1 if neighbor_count < 4
        end
      end
    end

    count
  end

  private

  def count_paper_neighbors(x, y)
    neighbors(x, y).count do |nx, ny|
      in_bounds?(nx, ny) && @grid[ny][nx] == '@'
    end
  end

  def neighbors(x, y)
    [
      [x - 1, y - 1], [x, y - 1], [x + 1, y - 1],
      [x - 1, y],                 [x + 1, y],
      [x - 1, y + 1], [x, y + 1], [x + 1, y + 1]
    ]
  end

  def in_bounds?(x, y)
    y >= 0 && y < @grid.length && x >= 0 && x < @grid[0].length
  end
end
