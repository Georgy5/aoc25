# require_relative 'circular_counter'
require_relative 'circular_counter2'

def calculate_password
  filename = 'input'
  circle = CircularCounter.new
  count = 0
  File.readlines(filename, chomp: true).each do |rotation|
    next if rotation.strip.empty?

    pos = circle.move(rotation)
    count = circle.password_counter
  end
  count
end

puts calculate_password
