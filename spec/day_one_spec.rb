require 'spec_helper'
require './solutions/day_one'
puzzle_input = File.read('./inputs/day_one.txt')
test_input = File.read("./spec/test_inputs/day_one_test.txt")

describe "Day one" do

  it "returns the most calories carried by an elf" do
    expect(most_calories(test_input)).to eq(24000)
    p "Part one solution is: #{most_calories(puzzle_input)}"
  end

  it "returns the most calories carried by tree elfs" do
    expect(tree_most_colories(test_input)).to eq(45000)
    p "Part two solution is: #{tree_most_colories(puzzle_input)}"
  end
end
