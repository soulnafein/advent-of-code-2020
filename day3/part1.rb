slope_pattern = File.readlines('./input', chomp: true)

slope_length = slope_pattern.size
slope_pattern_width = slope_pattern.first.size

x = 0
y = 0

trees = 0

while(y < slope_length-1)
  y += 1
  x = (x + 3) % slope_pattern_width
  puts x
  puts y
  puts slope_pattern_width
  puts slope_pattern[y]
  puts "==========="
  trees += 1 if slope_pattern[y][x] == "#"
end

puts trees


