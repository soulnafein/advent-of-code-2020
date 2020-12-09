#database = File.readlines('./invalid_examples', chomp: true)
#database = File.readlines('./valid_examples', chomp: true)
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

def valid?(database_entry)
  puts database_entry
  entry = database_entry.split(' ').map { |e| e.split(':') }.to_h
  valid_byr?(entry) &&
  valid_iyr?(entry) &&
  valid_eyr?(entry) &&
  valid_hgt?(entry) &&
  valid_hcl?(entry) &&
  valid_ecl?(entry) &&
  valid_pid?(entry)
end

def valid_byr?(entry)
  byr = entry["byr"].to_i
  byr.between?(1920, 2002)
end

def valid_iyr?(entry)
  iyr = entry["iyr"].to_s
  return false unless iyr.match /^\d{4}$/
  iyr.to_i.between?(2010, 2020)
end

def valid_eyr?(entry)
  eyr = entry["eyr"].to_s
  return false unless eyr.match /^\d{4}$/
  eyr.to_i.between?(2020, 2030)
end

def valid_hgt?(entry)
  hgt = entry["hgt"].to_s
  if hgt.match /\d+cm/
    hgt.to_i.between?(150, 193)
  elsif hgt.match /\d+in/
    hgt.to_i.between?(59, 76)
  end
end

def valid_hcl?(entry)
  hcl = entry["hcl"].to_s
  hcl.match /^#[0-9a-f]{6}$/
end

def valid_ecl?(entry)
  ecl = entry["ecl"].to_s
  %w(amb blu brn gry grn hzl oth).include?(ecl)
end

def valid_pid?(entry)
  pid = entry["pid"].to_s
  pid.match /^\d{9}$/
end


valid_entries = reformat_database(database).find_all do |e|
  valid?(e)
end
puts valid_entries.count
