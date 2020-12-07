numbers = File.readlines('input')
numbers.map!(&:to_i)

numbers.permutation(3).each do |numbers|
  total = numbers.reduce(&:+)
  if (total == 2020)
    puts "Answer: #{numbers.reduce(&:*)}"
    break
  end
end

