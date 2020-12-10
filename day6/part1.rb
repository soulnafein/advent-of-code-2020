answers = File.readlines('./input', chomp: true)

groups = [[]]

answers.each do |answer|
  if answer == ""
    groups.push []
  else
    groups.last.push answer
  end
end

unique_answers_per_group = groups.map do |answers|
  answers.join("").chars.uniq.count
end

puts "Answer #{unique_answers_per_group.reduce(:+)}"
