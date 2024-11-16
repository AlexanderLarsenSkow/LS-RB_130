# Each Cons Part 2

# Update each_cons so that it can handle as many elements as needed.

# Input: Array, integer representing number of elements to take at a time in the block, and block
# Output: nil, something in the block

# Rules:
  # This time, take a number of items that you put in the block
  # still return nil
  # should be able to take as many items as needed in the block

# Examples:

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value| # 1 el at a time
#   hash[value] = true
# end

# hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2| # 2
#   hash[value1] = value2
# end
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values| # 3
#   hash[value1] = values
# end
# hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values| # 5, too many, returns an empty hash.
#   hash[value1] = values
# end
# hash == {}

# Data Structures:
  # iterate from 0 to the size of the array - the input number.
  # now, we want to put in that number many arguments in the block for yield.
  # That's my biggest issue right now: how to pass in an increasingly bigger field of arguments into yield?
    # oh yeah that doesn't mattter lmao. Yield doesn't care about how many arguments you give.

  # Add each element to an array, inner loop and pass each one into yield.

# Algorithm:
  # Iterate from 0 to the size of the array - the input number
  # add the number of elements to another array

    # times method called on the input number to get all the elements in.

  # iterate over this array and yield each element to the block
  # return nil at the end


def each_cons(array, number)
  (0..array.size - number).each do |index|
    block_values = []

    number.times do |_|
      block_values << array[index]
      index += 1
    end

    yield(*block_values)
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value| # 1 el at a time
  hash[value] = true
end

p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2| # 2
  hash[value1] = value2
end

p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values| # 3
  hash[value1] = values
end

p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end

p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values| # 5, too many, returns an empty hash.
  hash[value1] = values
end

p hash == {}