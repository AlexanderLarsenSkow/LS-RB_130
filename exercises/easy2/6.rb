# each_with_index

# Input: array and block
# Output: value and index value

# Rules:
  # pass in a value and index to the block
  # return the original collection itself

# Examples:
  # result = each_with_index([1, 3, 6]) do |value, index|
#     puts "#{index} -> #{value**index}"
  # end

  # puts result == [1, 3, 6]

  # Output:
  # 0 -> 1
  # 1 -> 3
  # 2 -> 36
  # true

  # Data Structures:
    # use each and have another value that is index that starts at 0.
    # then increment it.

  # algo ^

  def each_with_index(array)
    index = 0

    array.each do |element|
      yield(element, index) if block_given?
      index += 1
    end
    array
  end

    result = each_with_index([1, 3, 6]) do |value, index|
        puts "#{index} -> #{value**index}"
      end

  puts result == [1, 3, 6]

  # Output:
  # 0 -> 1
  # 1 -> 3
  # 2 -> 36
  # true