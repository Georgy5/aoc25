require_relative "../tachyon_beam.rb"

simple_map    =  "....S....
                  ....|....
                  ...|^|...
                  ...|.|..."


example_map   = [['.','.','.','.','S','.','.','.','.'],
                 ['.','.','.','.','|','.','.','.','.'],
                 ['.','.','.','|','^','|','.','.','.'],
                 ['.','.','.','|','.','|','.','.','.']]

describe "Teleportation Laboratory" do
  describe "#create_map_from_string" do
    it "creates a 2d array from the string input" do
      expect(create_map_from_string(simple_map)).to eq(example_map)
    end
  end
end