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

  def move(direction, clicks)
    rotation = direction == "L" ? clicks.-@ : clicks
    @pos = (@pos + rotation) % @size
    @password_counter += 1 if @pos == 0
    @pos
  end

  def move_left(clicks)
    move("L", clicks)
  end

  def move_right(clicks)
    move("R", clicks)
  end
end
