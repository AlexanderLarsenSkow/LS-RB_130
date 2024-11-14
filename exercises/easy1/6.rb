# Input: array
# Output: true or false depending on if one value is true or false

# Rules:
  # return true or false if one of the elements evals to true based on the block
  # stop iterating the first time something evaluates to true

# Examples

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# Data Structures:
  # just return true the first time something evals to true
  # return false if you finish iterating

# Algorithm:
  # iterate through the collection
  # return true if any element evals to true within the block
  # else return false

def any?(array)
  counter = 0

  while counter < array.size
    current_el = array[counter]
    return yield(current_el) if yield(current_el)

    counter += 1
  end

  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false