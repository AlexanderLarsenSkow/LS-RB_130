# Rules
  # reduce gets passed an array
  # We have a default parameter that is the accumulator. It defaults to the first value in the array
  # Pass the current element and the accumulator to the yield keyword / block

def reduce(array, accumulator = 0)
  counter = 0

  while counter < array.size
    current_element = array[counter]
    accumulator = yield(accumulator, current_element)

    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass