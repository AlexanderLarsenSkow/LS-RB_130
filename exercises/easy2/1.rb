# Range step

# Input: 3 integers
# Output: # output, return the final value

# Rules:
  # The first argument is the starting number
  # The second number is the end
  # the last number is how many we add each time.
  # if we go over the final number, break.

# Examples:
  # step(1, 10, 3) { |value| puts "value = #{value}" } # 1, 4, 7, 10
  # step(2, 8, 2) { |value| puts "value = #{value}" } #  2, 4, 6, 8

# Data Structures:
  # while loop maybe.

# Algorithm:
  # Start at the starting number
  # Increase by the increment value
  # break if the starting number has gone over the final number
  # return the value that we have gotten

def step(start_num, end_num, increment_value)
  counter = start_num

  while counter <= end_num
    yield(counter)
    counter += increment_value
  end
  
  counter - increment_value
end

p step(1, 10, 3) { |value| puts "value = #{value}" } # 1, 4, 7, 10
p step(2, 8, 2) { |value| puts "value = #{value}" } #  2, 4, 6, 8

