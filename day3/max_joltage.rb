class MaxJoltage
  def find_max_joltage(battery_bank_str)
    digits = battery_bank_str.chars.map(&:to_i)
    return 0 if digits.length < 2

    (9).downto(0) do |tens|
      indices = digits.each_index.select { |i| digits[i] == tens }
      next if indices.empty?

      indices.each do |idx|
        # Look to the right for the best possible ones digit
        right_side = digits[(idx+1)..-1]
        next if right_side.empty?

        ones = right_side.max
        return (tens * 10 + ones)
      end
    end
  end

  def sum_max_joltage(banks_str)
    banks_str
      .lines
      .map(&:strip)
      .reject(&:empty?)
      .map { |bank| find_max_joltage(bank) }
      .sum
  end

  def total_output_joltage
    filename = 'input'
    jol = MaxJoltage.new
    total = jol.sum_max_joltage(File.read(filename))
    puts "Total max joltage sum: #{total}"
  end
end


jol = MaxJoltage.new
# jol.find_max_joltage("987654321111111")
jol.total_output_joltage
