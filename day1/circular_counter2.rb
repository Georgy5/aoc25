class CircularCounter
  attr_reader :pos, :password_counter

  def initialize
    @size = 100
    @pos = 50
    @password_counter = 0
  end
  
  def next_pos
    @pos = (@pos + 1) % @size
    @password_counter += 1 if @pos == 0
  end
  
  def prev_pos
    @pos = (@pos - 1) % @size
    # @pos = @size - 1 if @pos < 0
    @password_counter += 1 if @pos == 0
  end

  def move(input)
    direction, clicks = input.match(/^([LR])(\d+)$/).captures
    clicks = clicks.to_i
    case direction
    when "L"
      clicks.times { prev_pos }
    when "R"
      clicks.times { next_pos }
      @pos
    end
    @pos
  end
end
