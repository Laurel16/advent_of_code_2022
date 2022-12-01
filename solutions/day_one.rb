
file = File.read("./inputs/day_one.txt")

def elf_carry_weights(input)
  return input.split("\n\n").map{|elf| elf.split("\n").map(&:to_i).sum}
end

def most_calories(input)
  return elf_carry_weights(input).max
end

def tree_most_colories(input)
  return elf_carry_weights(input).sort[-3..].sum
end

