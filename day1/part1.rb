numbers = File.readlines('input')
numbers.map!(&:to_i)

while(numbers.any?)
  first, *rest = numbers
  second = 2020 - first
  if rest.include?(second)
    puts "Answer: #{first * second}"
    break
  end
  numbers = rest
end
