# Convert an octal number to a decimal number.
# The only valid digis are 0, 1, 2, 3, 4, 5, 6, and 7.

# Input: octal string
# Output: decimal 10 integer

# Rules:
  # you have to build this yourself. No built-in implementations allowed.
  # getting an octal number from a decimal number,
    # take each digit, multiply by 8 to the power of 0 for the rightmost digit, and go + 1 for each one.
    # multiply this by the digit.

# Examples:
#   233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# 155
  # 1 * 8^2 + 5 * 8^1 + 5 * 8^0
    # 64 + 40 + 8 == 112

# Data Structures:
  # take each digit, starting at ther rightmost, and take 8 to the power of 0. and multiply by the digit
  # an array of digits and mapping it would be appropriate. Then add them all together.

# Algorithm:
  # class Octal
  # constructor method
  # instance variable base_8_num

  # to_decimal
    # take the digits in an array in reverse order DON'T USE REVERSE method
    # map the array with an index
    # take 8 to the power of hte index and multiply by the digit
    # sum this array
    # this is the decimal number.

class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid_octal?
    powered_digits = []

    number.to_i.digits.each_with_index do |digit, power|
      powered_digits << (digit * (8 ** power))
    end
    powered_digits.sum
  end

  private

  def valid_octal?
    number.chars.all? { |num| num.match?(/[0-7]/) }
  end
end

