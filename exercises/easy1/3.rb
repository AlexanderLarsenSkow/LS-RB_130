# Input: sorted array of integers
# Output: all the missing integers between the first and last elements of the array

# Rules:
  # Given an array of sorted integers, provide all the missing integers between the first element and the last element.
  # return them in a new array
  # return an empty array if there none
  # return an empty array if there is only 1 element

# Examples:

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4] # -1, 0, 2, 3, 4
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# Data Structures
  # Increment up to the final element
  # add the current number to a new array if it is no included in the main array

# Algorithm
  # return the array if there is only 1 element
  # take the first element and increment up to the last number
  # If the current num is not included in the argument, add it to the return array
  # return the array

def missing(sorted_numbers)
  missing_nums = []
  return missing_nums if sorted_numbers.size == 1

  sorted_numbers[0].upto(sorted_numbers[-1]) do |num|
    missing_nums << num unless sorted_numbers.include?(num)
  end

  missing_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []