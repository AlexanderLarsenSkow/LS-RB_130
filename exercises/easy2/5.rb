# drop_while

# Input: array and block
# Output: array of values

# Rules:
  # iterate over the collection and return an array of the first value that evals to false
    # and every value afterwards
  # DO NOT include the values before the falsey value
  # No falsey value, take nothing

# Examples:
# drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# drop_while([1, 3, 5, 6]) { |value| true } == []
# drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# drop_while([]) { |value| true } == []

# Data Structures:
  # use a boolean value as a button. Turn it on when we have reacehd a falsey value
    # add values to the array when it is on.


def drop_while(array)
  false_achieved = false
  result = []

  array.each do |element|
    false_achieved = true unless yield(element)
    result << element if false_achieved
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

