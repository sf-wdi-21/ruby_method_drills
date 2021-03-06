# THIS FILE PERFORMS RSPEC TESTS ON `drills.rb`
# TO RUN YOUR TESTS TYPE: `rspec spec/3_iterator_spec.rb`

require "./drills.rb"

###########################
#### LOOPS & ITERATORS ####
###########################

describe "#count_spaces" do
  it "counts the spaces in a string" do
    space = " "
    expect( count_spaces(space*1) ).to eq 1
    expect( count_spaces(space*2) ).to eq 2
    expect( count_spaces(space*10) ).to eq 10
    expect( count_spaces("") ).to eq 0
    expect( count_spaces(" | | ") ).to eq 3
  end
end

describe "#count_to" do
  it "returns a list of every interger from 0 to n" do
    expect( count_to(0) ).to eq [0]
    expect( count_to(2) ).to eq [0,1,2]
    expect( count_to(3) ).to eq [0,1,2,3]
  end

  it "uses the absolute value of n" do
    expect( count_to(-3) ).to eq [0,1,2,3]
  end

  it "rounds down" do
    expect( count_to(3.9) ).to eq [0,1,2,3]
  end
end

describe "#string_lengths" do
  it "converts a list of strings to a list of string lengths" do
    expect( string_lengths(["abc"]) ).to eq [3]
    expect( string_lengths([""]) ).to eq [0]
    expect( string_lengths(["abc", "a", "123456"]) ).to eq [3, 1, 6]
  end
end

describe "#remove_falsy_values" do
  it "filters out falsy values from a list" do
    expect( remove_falsy_values(["hi"]) ).to eq ["hi"]
    expect( remove_falsy_values([]) ).to eq []
    expect( remove_falsy_values([nil]) ).to eq []
    expect( remove_falsy_values([false]) ).to eq []
    expect( remove_falsy_values([10,"hi"]) ).to eq [10,"hi"]
    expect( remove_falsy_values([0, "", nil, false, -1]) ).to eq [0,"",-1]
  end
end

describe "#exclude_last" do
  it "removes the last item from an array" do
    expect( exclude_last([1,2,3]) ).to eq [1,2]
    expect( exclude_last([1,2]) ).to eq [1]
    expect( exclude_last([1]) ).to eq []
  end

  it "removes the last item from a string" do
    expect( exclude_last("123") ).to eq "12"
    expect( exclude_last("12") ).to eq "1"
    expect( exclude_last("1") ).to eq ""
  end
end

describe "#exclude_first" do
  it "removes the first item from an array" do
    expect( exclude_first([1,2,3]) ).to eq [2,3]
    expect( exclude_first([1,2]) ).to eq [2]
    expect( exclude_first([1]) ).to eq []
  end

  it "removes the first character from a string" do
    expect( exclude_first("123") ).to eq "23"
    expect( exclude_first("12") ).to eq "2"
    expect( exclude_first("1") ).to eq ""
  end

  it "does not alter the original input (non-destructive)" do
    input_array = [1,2,3]
    exclude_first(input_array)
    expect( input_array.length ).to eq 3

    input_string = "123"
    exclude_first(input_string)
    expect( input_string.length ).to eq 3
  end
end

describe "#exclude_ends" do
  it "removes the first and last items from an array" do
    expect( exclude_ends([1,2,3]) ).to eq [2]
    expect( exclude_ends([1,2]) ).to eq []
  end

  it "removes the first and last characters from a string" do
    expect( exclude_ends("123") ).to eq "2"
    expect( exclude_ends("12") ).to eq ""
  end
end

describe "#select_every_even" do
  it "returns a list of even-indexed items" do
    expect( select_every_even([0,1,2]) ).to eq [0,2]
    expect( select_every_even(["a","b","c","d","e"]) ).to eq ["a","c","e"]
  end
end

describe "#select_every_odd" do
  it "returns a list of odd-indexed items" do
    expect( select_every_odd([0,1,2]) ).to eq [1]
    expect( select_every_odd(["a","b","c","d","e"]) ).to eq ["b","d"]
  end
end

describe "#select_every_n" do
  it "returns a list of items at an index evenly divisible by n" do
    expect( select_every_n(["a","b","c","d","e"], 3) ).to eq ["a","d"]
    expect( select_every_n(["a","b","c","d","e"], 4) ).to eq ["a","e"]
  end

  it "defaults to an n value of 1" do
    expect( select_every_n([0,1,2]) ).to eq [0,1,2]
  end
end
