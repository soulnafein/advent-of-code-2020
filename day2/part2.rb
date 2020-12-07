database = File.readlines("./input")

def entry_valid?(entry)
  entry_format = /(\d+)-(\d+) ([a-z]): ([a-z]+)/
  _, first_position, second_position, letter, password = entry.match(entry_format).to_a
  puts entry if password.nil?
  (password[first_position.to_i - 1] == letter) ^
  (password[second_position.to_i - 1] == letter)
end

count = 0
database.each do |entry|
  count += 1 if entry_valid?(entry)
end

puts count
