# Write a program that converts modern decimal numbers to their Roman Numeral counterparts

# 1  => I
# 10  => X
# 7  => VII

# Romans didn't use 0's
# Don't worry about converting over 3000

# Essential Letters:
  # I, V, X, L, C, D, M

# 1000=M
# 900=CM
# 90=XC

# 1990 =>
  # [1, 9, 9, 0]
    # 1000 # M
    # 900 # CM
    # 90 # XC
    # add them all => MCMXC

    # Take the digit
    # Take the place it it's in.
    # Going to have to check the index vs. the size of the array.
    # index 0 and size is 4
    # means 1000's

# 2000=MM
# 8=VIII

# Problem

# Input: number
# Output: the number converted to a Roman Numeral

# Rules:
  # Don't worry about converting over 3000
  # The class should take an integer, not a string
  # Then convert it to a Roman Numeral

  # The Roman system works in 3's III
  # Then it does something weird at 4 of something:
    # IV for 4
    # V for 5
    # VI for 6

  # This system continues for larger numbers:
    # XL => 40
    # => LX => 60

  # If a smaller number appears before a larger number
    # then you subtract. If the smaller number appears after the larger number, you add.
    #

  # You can add 3 of one to to another number
    # LXXX => 80
    # XIII # => 13
    # MIII # => 2003

  # And - 1 from another number
    # IX # => 9
    # XC => 90
    # XCIX => 99

# Examples:
  # 1 => I
  # 2 => II
  # 3 => III

  # I => 1
  # V => 5
  # X => 10
  # L => 50
  # C => 100
  # D => 500
  # M => 1000

# Data Structures:
  # expressing each digit separately starting with the left most digit
  # and skipping any digit with a value of zero

  # Take your number and split it into an array of digits.
  # Iterate over the array and convert each digit to its corresponding numeral.

  # Hash constant where Roman numerals point at numbers...
  # - this part from the number and add the part of the numeral to a return string

# Algorithm:
  # Class RomanNumeral
    # 2 methods, 1 constant

    # constant: hash for all numerals and their basic value

    # method 1: constructor, takes 1 argument (integer)
    # sets up instance variable, that's it.

    # method 2: to_roman
      # take the number and try to convert it to a roman numeral
      # create empty string
      # iterate through the constant keys. If the number is greater than the key, add the value to the string.

class RomanNumeral
  NUMERAL_VALUES = {
    '1' => 'I',
    '5' => 'V',
    '10' => 'X',
    '50' => 'L',
    '100' => 'C',
    '500' => 'D',
    '1000' => 'M'
  }

  def initialize(number)
    @numeral = number
  end

  def to_roman
    roman_numeral = ''
    counter = numeral

    NUMERAL_VALUES.keys.reverse.each do |value|
      if numeral >= value
        roman_numeral << NUMERAL_VALUES[value]
        counter -= value

        break if counter == 0
      end
    end
    roman_numeral
  end

  private

  attr_reader :numeral
end

num = RomanNumeral.new(10)

p num.to_roman

num2 = RomanNumeral.new(40)
p num2.to_roman