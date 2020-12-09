
def traverse(x_inc, y_inc)
  slope_pattern = File.readlines('./input', chomp: true)
  slope_length = slope_pattern.size
  slope_pattern_width = slope_pattern.first.size
  x = 0
  y = 0
  trees = 0

  while(y < slope_length-1)
    y += y_inc
    x = (x + x_inc) % slope_pattern_width
    trees += 1 if slope_pattern[y][x] == "#"
  end

  trees
end

puts traverse(1,1)*traverse(3,1)*traverse(5,1)*traverse(7,1)*traverse(1,2)

