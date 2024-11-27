# Input: string of numbers, and intger input
# Output: all combinations of string numbers added to an array, and converted to integers.
  # should be an array of arrays

# Rules:
  # Add each combination at the specified length to a final array
  # should be array of arrays
  # convert each number to an integer
  # raise an ArgumentError if the number is greater than the size of the string.
  # Stop when you can't get any more arrays of that size into the final array.

# Examples:

# '0123'
# (3)

# [[0, 1, 2], [1, 2, 3]]

# 0123
# (2)

# [[0, 1], [1, 2], [2, 3]]

# Data Structures:
  # basically, start iterating from the first value and add each character to an array. Convert here.
  # add the array to the return array when it is at teh specified length
  # break if the current item is nil.
  # string[index] maybe.

# Algorithm:
  # initialize(number)
    # should initialize with a string number


  # slices
  # iterate from the first value to the end of the array. Iterate with an index
  # for every value, iterate from the next value to the end of the array, iterate from index + 1
  # convert each element to an integer
  # break if the current element is nil.
  # return the new array.

class Series
  attr_reader :string_number

  def initialize(number)
    @string_number = number
  end

  def slices(max_length)
    raise ArgumentError if max_length > string_number.size
    combinations = []

    (0..string_number.size - max_length).each do |index|
      combo = [string_number[index].to_i]

      (index + 1...string_number.size).each do |index2|
        break if combo.size >= max_length
        combo << string_number[index2].to_i
      end
      combinations << combo
    end

    combinations
  end
end