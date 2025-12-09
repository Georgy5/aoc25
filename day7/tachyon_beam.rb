def create_map_from_string(str)
  str
    .lines                      # split into lines
    .map(&:strip)               # remove leading/trailing spaces
    .map { |line| line.chars }  # turn each row into array of chars
end

