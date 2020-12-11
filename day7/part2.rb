rules = File.readlines('./input', chomp: true)

def parse_rules(rules)
  rules.map do |rule|
    bag_type, definition_text = rule.match(/([a-z ]+) bags? contain ([^.]+)\./).captures
    definitions = parse_rule_definition(definition_text).to_h

    parsed_rule = [ bag_type, definitions ]
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

def count_bags?(bag_type)
  rule_definition = RULES[bag_type]
  included_bags = rule_definition.keys
  if rule_definition == {}
    0
  else
    included_bags.reduce(0) do |sum, b|
      number_of_bags = rule_definition[b].to_i
      sum + number_of_bags + (number_of_bags * count_bags?(b))
    end
  end
end

puts count_bags?("shiny gold")
