# Count

# Input: Array
# Output: Integer representing how many times the element evaled in the block got true

# Rules:
  # count how many times the elemnents in the array eval to true in the block

# Examples:
  # count([1,2,3,4,5]) { |value| value.odd? } == 3
  # count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
  # count([1,2,3,4,5]) { |value| true } == 5
  # count([1,2,3,4,5]) { |value| false } == 0
  # count([]) { |value| value.even? } == 0
  # count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Data Structures:
  # use an incrementing value

# Algorithm:
  # set a value to 0
  # increase the value if the el evals to true in the block
  # return the value after iterating

def count(array)
  count = 0

  array.each do |element|
    count += 1 if yield(element)
  end

  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Don't use each, while, loop, or until

def count2(array)
  array.select { |element| yield(element) }.size
end

p count2([1,2,3,4,5]) { |value| value.odd? } == 3
p count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count2([1,2,3,4,5]) { |value| true } == 5
p count2([1,2,3,4,5]) { |value| false } == 0
p count2([]) { |value| value.even? } == 0
p count2(%w(Four score and seven)) { |value| value.size == 5 } == 2