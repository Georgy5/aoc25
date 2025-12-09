simple_map    =  "....S....
                  .........
                  ....^....
                  ........."

                  
def create_map_from_string(str)
  str
    .lines                      # split into lines
    .map(&:strip)               # remove leading/trailing spaces
    .map { |line| line.chars }  # turn each row into array of chars
end

input_grid = create_map_from_string(simple_map)

def get_neighbour(direction, row, col, map)
  case direction
  when :north
    map[row - 1][col]
  when :south
    return nil if row + 1 >= rows
    map[row + 1][col]
  end
end

def sum_up_beam_splits(str_map)
  type = {
    start: 'S',
    beam: '|',
    splitter: '^',
    empty: '.'
  }

  grid_map = create_map_from_string(str_map)
  rows = grid_map.length
  cols = grid_map.first.length

  number_of_splits = 0
  origin = type[:start]

  (1...rows).each do |r|
    (0...cols).each do |c|
      current_grid = grid_map[r][c]
      # check northern neighbour for Start
      northern_point = get_neighbour(:north, r, c, grid_map)
      if northern_point == origin
        grid_map[r][c] = type[:beam]
        origin = type[:beam]
      end
      if northern_point == origin && current_grid == type[:empty]
        grid_map[r][c] = type[:beam]
      end
      # check if current is splitter
      if northern_point == origin && current_grid == type[:splitter]
        number_of_splits += 1
        #left neightbour becomes beam
        grid_map[r][c - 1] = type[:beam]
        #right neightbour becomes beam
        grid_map[r][c + 1] = type[:beam]
      end
    end
  end

  number_of_splits
end
