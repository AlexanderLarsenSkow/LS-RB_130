# Input: 3 or less arguments
# Output: the count of arguments that eval to true in a block

# Rules:
  # return the count of elements that eval to true in a block
  # create default values that are nil
  # start with 3 arguments
  # 0 arguments given should just return 0

# Examples:

# count(1, 3, 6) { |value| value.odd? } == 2
# count(1, 3, 6) { |value| value.even? } == 1
# count(1, 3, 6) { |value| value > 6 } == 0
# count(1, 3, 6) { |value| true } == 3
# count() { |value| true } == 0
# count(1, 3, 6) { |value| value - 6 } == 3

# Data Structures:
  # put every arg into an array and use compact, then iterate over it.

# Algorithm: ^

def count(*arguments)
  count = 0

  arguments.each do |element|
    count += 1 if yield(element)
  end

  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

