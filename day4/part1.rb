database = File.readlines('./input', chomp: true)

def reformat_database(database)
  reformatted_database = []
  entry_index = 0
  database.each do |entry|
    if entry == "" 
      entry_index += 1
    else
      reformatted_database[entry_index] =
        "#{reformatted_database[entry_index].to_s} #{entry}"
    end
  end
  reformatted_database
end

def valid?(entry)
  keys = entry.split(' ').map { |e| e.split(':').first }
  mandatory_keys = %w(byr iyr eyr hgt hcl ecl pid)
  mandatory_keys - (keys & mandatory_keys) == []
end

valid_entries = reformat_database(database).find_all do |e|
  valid?(e)
end
puts valid_entries.count
