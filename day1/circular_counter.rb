class CircularCounter
  attr_reader :pos

  def initialize
    @size = 100
    @password_counter = 0
    @pos = 50
  end

  def password_counter
    @password_counter
  end

  def move(input)
    direction, clicks = input.match(/^([LR])(\d+)$/).captures
    clicks = clicks.to_i
    rotation = direction == "L" ? clicks.-@ : clicks
    @pos = (@pos + rotation) % @size
    @password_counter += 1 if @pos == 0
    @pos
  end
end
