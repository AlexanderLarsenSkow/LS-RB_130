# each cons
# loop in a loop

# Input: array
# Output: nil, some achievement with the block

# Rules:
  # take pairs of values from the first element to the second to last element
  # we don't want to include the last element because the second value will be nil
  # these should be used in the block somehow

# Examples:
#   hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end

# result == nil
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end

# hash == {}
# result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end

# hash == {'a' => 'b'}
# result == nil

# Data Structures:
  # iterate from 0 to array.size - 2
  # take the element and element at index + 1

# Algorithm:
  # iterate from 0 to the size of the array - 2
  # take each element and each element at index + 1 and put it in the block
  # return nil at the end

def each_cons(array)
  (0...array.size - 1).each do |index|
    val_one = array[index]
    val_two = array[index + 1]
    
    yield(val_one, val_two)
  end
  
  nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end

p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end

p hash == {'a' => 'b'}
p result == nil



