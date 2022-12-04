

# Part One
# Function to calculate the priority of a given character
def priority(c)
  # Lowercase characters have priorities 1 through 26
  return c.ord - 'a'.ord + 1 if c >= 'a' && c <= 'z'

  # Uppercase characters have priorities 27 through 52
  return c.ord - 'A'.ord + 27 if c >= 'A' && c <= 'Z'
end

# Function to find the common item type in both compartments of a given rucksack
def common_item_type(rucksack)
  # Split the rucksack into its two compartments
  first_compartment = rucksack[0, rucksack.length / 2]
  second_compartment = rucksack[rucksack.length / 2, rucksack.length]

  # Iterate over the characters in the first compartment and return the first
  # character that also appears in the second compartment
  first_compartment.each_char do |c|
    return c if second_compartment.include?(c)
  end
end

# Function to calculate the sum of the priorities of the common item type in
# both compartments of each rucksack
def sum_of_priorities(rucksacks)
  # Initialize the sum of priorities to 0
  sum = 0

  # Iterate over the rucksacks
  rucksacks.each do |rucksack|
    # Find the common item type in the rucksack
    common_item = common_item_type(rucksack)

    # Add the priority of the common item type to the sum of priorities
    sum += priority(common_item) if common_item
  end

  # Return the sum of priorities
  sum
end

rucksacks = File.read("./spec/test_inputs/day_tree_test.txt").split
puts sum_of_priorities(rucksacks)

# Part Two
def find_common_letters(input)
  common_letters = []
  strings = input.join()
  strings.each_char do |char|
    if input.all? { |s| s.include?(char) }
      common_letters << char
    end
  end
  common_letters.uniq
end

def calculate_priority(letters)
  letters.map { |l| priority(l) }.sum
end

def calculate_badge_priorities(strings)
  badge_priorities = []
  strings.each_slice(3) do |group|
    common_letters = find_common_letters(group)
    priority = calculate_priority(common_letters)
    badge_priorities << priority
  end
  badge_priorities.sum
end

puts calculate_badge_priorities(rucksacks)


# Alternatives for calculates the priority of an item type

# def priority(item_type)
#   # Lowercase item types have priorities 1 through 26
#   if item_type.match(/[a-z]/)
#     return item_type.ord - 'a'.ord + 1
#   end

#   # Uppercase item types have priorities 27 through 52
#   if item_type.match(/[A-Z]/)
#     return item_type.ord - 'A'.ord + 27
#   end
#   # Return 0 for any other type of item
#   0
# end
#
# def priority(item_type)
  #return item_type.ord - 'a'.ord + 1 if item_type >= 'a' && item_type <= 'z'
  #return item_type.ord - 'A'.ord + 27 if item_type >= 'A' && item_type <= 'Z'
#end
