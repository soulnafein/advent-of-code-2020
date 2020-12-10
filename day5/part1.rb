passes = File.readlines('./input', chomp: true);

def pass_to_id(pass)
  row = calculate_row(pass[0..6])
  column = calculate_column(pass[7..9])
  row * 8 + column
end

def calculate_row(code)
  min = 1
  max = 126
  code.each_char do |letter|
    middle = (max - min) / 2 + min
    if letter == "F"
      max = middle
    elsif letter == "B"
      min = middle + 1
    end
  end
  max
end

def calculate_column(code)
  min = 0
  max = 7
  code.each_char do |letter|
    middle = (max - min) / 2 + min
    if letter == "L"
      max = middle
    elsif letter == "R"
      min = middle + 1
    end
  end
  max
end

all_ids = passes.map { |p| pass_to_id(p) }.sort
result = all_ids.each_cons(2).find do |pair|
  (pair[1] - pair[0]) > 1
end

puts (result.last)-1
