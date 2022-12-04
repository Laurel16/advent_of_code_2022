require 'spec_helper'
require './solutions/day_two'
puzzle_input = File.read('./inputs/day_two.txt')
test_input = File.read("./spec/test_inputs/day_two_test.txt")

describe "Day two" do
  it "returns the total score" do
    expect(total_score(test_input)).to eq(15)
    p "The total score for part one is: #{total_score(puzzle_input)}"
  end

  it "returns the new total score after the strategy was explained" do |variable|
    expect(new_total_score(test_input)).to eq(12)
    p "The total score for part two is: #{new_total_score(puzzle_input)}"
  end
end
