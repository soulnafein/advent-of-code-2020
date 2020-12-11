rules = File.readlines('./input', chomp: true)

def parse_rules(rules)
  rules.map do |rule|
    bag_type, definition_text = rule.match(/([a-z ]+) bags? contain ([^.]+)\./).captures
    definitions = parse_rule_definition(definition_text).to_h

    parsed_rule = [ bag_type, definitions ]
    puts parsed_rule
    parsed_rule
  end.to_h
end

def parse_rule_definition(definition_text)
    if definition_text == "no other bags"
      []
    else
      definition_text.split(', ').map do |definition|
        amount, bag_type = definition.match(/(\d+) ([^,]+) bags?/).captures
        [bag_type, amount]
      end
    end
end

RULES = parse_rules(rules)

def bag_include?(bag_type, bag_type_to_check)
  if RULES[bag_type].nil?
    puts "=============="
    puts bag_type
    puts "=============="
  end
  included_bags = RULES[bag_type].keys
  if included_bags.empty?
    false
  else
    included_bags.include?(bag_type_to_check) ||
    included_bags.any? { |b| bag_include?(b, bag_type_to_check) }
  end
end

result = RULES.keys.find_all do |bag_type|
  bag_include?(bag_type, "shiny gold")
end

puts result.count
