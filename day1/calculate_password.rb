require_relative 'circular_counter'

ROTATIONS = "L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
".freeze

def caclulate_password
  circle = CircularCounter.new
  count = 0
  ROTATIONS.each_line do |rotation|
    pos = circle.move(rotation)
    count = circle.password_counter
  end
  count
end

puts caclulate_password
