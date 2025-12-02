input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124"
input = input.delete("\n")

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

ranges = input.split(",").map do |part|
  start_str, end_str = part.split("-")
  (start_str.to_i..end_str.to_i)
end

ranges.each do |range|
  puts "Processing range: #{range}"
  invalid_ids = get_invalid_ids(range)
  @all_invalid_ids.push invalid_ids
  puts "Invalid IDs in range #{range}: #{invalid_ids}"
end

p @all_invalid_ids.flatten!.sum