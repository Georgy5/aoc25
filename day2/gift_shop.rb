def is_id_invalid?(id)
  id_str = id.to_s

  if id_str.size.even?
    half = id_str.size / 2
    first_half = id_str[0...half]
    second_half = id_str[half..-1]
    return first_half == second_half
  end
  false
end

def get_invalid_ids(id_range)
  list_of_invalid_ids = []

  id_range.each do |id|
    id_str = id.to_s
    next if id_str[0] == "0"

    list_of_invalid_ids << id if is_id_invalid?(id)
  end

  list_of_invalid_ids
end

@all_invalid_ids = []
filename = 'input'
File.readlines(filename, chomp: true).each do |input|
  ranges = input.split(",").map do |part|
    start_str, end_str = part.split("-")
    (start_str.to_i..end_str.to_i)
  end

  ranges.each do |range|
    invalid_ids = get_invalid_ids(range)
    @all_invalid_ids.push invalid_ids
  end
end

p @all_invalid_ids.flatten!.sum
