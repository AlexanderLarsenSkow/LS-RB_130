# Conditions for default

# if it's an integer, then we want the default to be 0.
# If it's not an integer, the default should be the first element in the collection.

# Problem
  # Input: array value that gets reduced
  # Output: array that gets reduced into a single object.

  # Rules:
    # given an array of any kind of value, reduce all the elements by adding them into one element.
    # You should consider objects that are non-numeric.
    # If the method gets passed a second argument, this is where the accumulator starts at
    # Else, it starts at the first element.


  # Data Structures:
    # Integer and no default given: should start at 0
    # Integer and default given: should start at default
    # Integer and default given and same as first element: should start at default

    # Just start at the second element you dope! LMAO

    # Couldn't quite come to a working solution for all test cases.

def reduce(array, default = nil)
  if default
    accumulator = default
    counter = 0

  else
    accumulator = array[0]
    counter = 1
  end

  while counter < array.size
    current_element = array[counter]
    accumulator = yield(accumulator, current_element)

    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce([1, 2, 3]) { |acc, num| acc + num} # => 6
p reduce([1, 2, 3], 1) { |acc, num| acc + num } # => 7

# I was having trouble on this one because adding the values together becomes an issue if you start
# at the first element as a default. The solution is to iterate from the second element if
# there is no accumulator given. If an accumulator is given as an argument, start from the first element.