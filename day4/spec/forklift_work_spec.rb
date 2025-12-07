# frozen_string_literal: true
require_relative "../forklift_work.rb"

RSpec.describe PrintingGrid do
  # @ - roll of paper
  # x - forklift
  let(:grid) do
    [
      "..@@.@@@@.",
      "@@@.@.@.@@",
      "@@@@@.@.@@",
      "@.@@@@..@.",
      "@@.@@@@.@@",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "@.@@@.@@@@",
      ".@@@@@@@@.",
      "@.@.@@@.@."
    ]
  end

  describe "#accessible_rolls_count" do
    it "counts how many rolls (@) have fewer than 4 neighbouring rolls" do
      paper_grid = PrintingGrid.new(grid)
      expect(paper_grid.accessible_rolls_count).to eq(13)
    end
  end

  describe "#neighbors (private)" do
    it "returns the 8 surrounding coordinates (not filtered for bounds)" do
      paper_grid = PrintingGrid.new(grid)

      neighbors = paper_grid.send(:neighbors, 5, 5)

      expect(neighbors).to contain_exactly(
        [4,4], [4,5], [4,6],
        [5,4],        [5,6],
        [6,4], [6,5], [6,6]
      )
    end
  end

  describe "#count_paper_neighbors (private)" do
    it "counts adjacent @ symbols around a given cell" do
      paper_grid = PrintingGrid.new(grid)

      # Choose a roll of paper '@' with a predictable number of neighbors
      # Example: grid[1][1] contains '@'
      count = paper_grid.send(:count_paper_neighbors, 1, 1)

      expect(count).to eq(6)
    end
  end
end
