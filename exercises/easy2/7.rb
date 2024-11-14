# each_with_object

# Input: array, object type (array or hash), and block
# Output: returns the object

# Rules:
  # Return the object given as an argument
  # given an array, pass each element and the object itself into a block
  # almost all the work is being done by the block here

# Examples:

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# result == {}

# Data Structures:
  # execute a block but don't do anything else with it in the method
  # return the object

def each_with_object(array, object, &block)
  array.each do |element|
    yield(element, object) if block_given?
  end

  object
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}