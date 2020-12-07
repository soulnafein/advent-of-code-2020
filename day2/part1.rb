database = File.readlines("./input")

def entry_valid?(entry)
  entry_format = /(\d+)-(\d+) ([a-z]): ([a-z]+)/
  _, min, max, letter, password = entry.match(entry_format).to_a
  puts entry if password.nil?
  password.count(letter).between?(min.to_i, max.to_i)
end

count = 0
database.each do |entry|
  count += 1 if entry_valid?(entry)
end

puts count
