# one?

# Input: array
# Output: true or false

# Rules:
   # Return true or false if exactly one value evals to true
   # else return false
   # Stop processing results immediatley after two items eval to true
   #

# Examples:

# one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# one?([1, 3, 5, 7]) { |value| true }           # -> false
# one?([1, 3, 5, 7]) { |value| false }          # -> false
# one?([]) { |value| true }                     # -> false

# Data Structures:
  # pretty easy

# Algo ^

def one?(array)
  number = 0

  array.each do |element|
    number += 1 if yield(element)
    return false if number == 2
  end

  number == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }  == true  # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? } == false    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true # -> true
p one?([1, 3, 5, 7]) { |value| true } == false           # -> false
p one?([1, 3, 5, 7]) { |value| false } == false          # -> false
p one?([]) { |value| true } == false                     # -> false

