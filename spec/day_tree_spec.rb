require 'spec_helper'
require './solutions/day_tree'
puzzle_input = File.read('./inputs/day_tree.txt').split
test_input = File.read("./spec/test_inputs/day_tree_test.txt").split

describe "Day tree" do

  it "returns the sum of the priorities for the badges in compartments" do
    expect(sum_of_priorities(test_input)).to eq(157)
    p "Part one solution is: #{sum_of_priorities(puzzle_input)}"
  end

  it "returns the sum of the priorities for the badges of each three-Elf group" do
    expect(calculate_badge_priorities(test_input)).to eq(70)
    p "Part two solution is: #{calculate_badge_priorities(puzzle_input)}"
  end

end

