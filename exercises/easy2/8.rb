# max_by

# Input: array and block
# Output:

# Rules:
  # passes elements into a block and then takes the largest one out based on the block
  # Return the current value that is largest based on the block.
  # return nil if the array is empty

# Examples:
# max_by([1, 5, 3]) { |value| value + 2 } == 5 # have to use the block, but don't change the values.
# max_by([1, 5, 3]) { |value| 9 - value } == 1
# max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# max_by([-7]) { |value| value * 3 } == -7
# max_by([]) { |value| value + 5 } == nil

# Data Structures:
  # iterate over the collection
  # iterate over the collection again and check against each value evaluated in the block.
  # return the value that is <=> than every value.
    # skip if the index is the same
    # all?

# Algorithm:
  # iterate over the collection with the index
    # for each member of the collection, iterate over a selected collection that doesn't include the
      # element at the current index
    # if every element in the selected array is less than the current element based on the block, return
      # the current element


def max_by(array)
  return nil if array.empty?

  array.each_with_index do |element, index1|
    other_els = array.select.with_index do |_, index2|
      index1 != index2
    end

    return element if other_els.all? do |element2|
       (yield(element) <=> yield(element2)) == 1
    end
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

def max_by2(array)
  greatest = array[0]
  array.each { |element| greatest = element if yield(element) > yield(greatest) }
  greatest
end

p max_by2([1, 5, 3]) { |value| value + 2 } == 5
p max_by2([1, 5, 3]) { |value| 9 - value } == 1
p max_by2([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by2([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by2([-7]) { |value| value * 3 } == -7
p max_by2([]) { |value| value + 5 } == nil