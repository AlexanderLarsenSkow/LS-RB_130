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

  # adding
    # first digit is 1, 2, 3, 6, 7, 8

  # Subtracting
    # first digit is 4 or 9

  # 1's have a symbol, as do 5's

# Algorithm:
  # Class RomanNumeral
    # 2 methods, 1 constant

    # constant: hash for all numerals and their basic value

    # method 1: constructor, takes 1 argument (integer)
    # sets up instance variable, that's it.

    # method 2: to_roman


    # Method 3: to_digits
      # # Take each digit of the input number in an array
      # convert to a string and add 0's based on the array size and index
      # array.size - 1 - index * 0
        # [3, 1, 2, 4]
        # array_size = 4
        # index = 0

class RomanNumeral
  NUMERALS = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }

  def initialize(number)
    @numeral = number
  end

  def to_roman
    roman_numeral = ''
    big_digits = to_digits

    big_digits.each do |digit|
      next if digit == 0
      roman_numeral << NUMERALS[digit] unless NUMERALS[digit] == nil
      roman_numeral << add_numerals(digit) if add?(digit)
      roman_numeral << subtract_numerals(digit) if subtract?(digit)
    end

    roman_numeral
  end

  def get_first_digit(digit)
    digit.digits.reverse[0]
  end

  def find_next_smallest_number(digit)
    NUMERALS.each do |integer_val, _|
      next if get_first_digit(integer_val) == 5
      return integer_val if digit > integer_val
    end
  end

  def find_next_biggest_number(digit)
    NUMERALS.keys.reverse.each do |integer_val|
      return integer_val if digit < integer_val
    end
  end

  def add?(digit)
    first_digit = get_first_digit(digit)
    first_digit == 2 || first_digit == 3 || first_digit == 6 ||
      first_digit == 7 || first_digit == 8
  end

  def subtract?(digit)
    first_digit = get_first_digit(digit)
    first_digit == 4 || first_digit == 9
  end

  def need_five?(first_digit)
    first_digit == 6 || first_digit == 7 || first_digit == 8
  end
  
  def determine_multiplier(first_digit)
    if first_digit == 6
      1

    elsif first_digit == 2 || first_digit == 7
      2

    elsif first_digit == 3 || first_digit == 8
      3
    end
  end

  def add_numerals(digit)
    first_digit = get_first_digit(digit)
    multiplier = determine_multiplier(first_digit)
    next_smallest = find_next_smallest_number(digit)

    if need_five?(first_digit)
      possible_five = calculate_five_value(next_smallest)

    else
      possible_five = ''
    end

    possible_five + (NUMERALS[next_smallest] * multiplier)
  end

  def calculate_five_value(next_smallest)
    case next_smallest
    when (1..9) then 'V'
    when (10..99) then 'L'
    when (100..999) then 'D'
    end
  end

  def subtract_numerals(digit)
    first_digit = get_first_digit(digit)
    return '' unless first_digit == 4 || first_digit == 9

    smaller = find_next_smallest_number(digit)
    bigger = find_next_biggest_number(digit)

    NUMERALS[smaller] + NUMERALS[bigger]
  end

  def to_digits
    digits = numeral.digits.reverse.map(&:to_s)

    big_digits = digits.map.with_index do |digit, index|
      tens_place = '0' * (digits.size - 1 - index)
      digit + tens_place
    end

    big_digits.map(&:to_i)
  end

  private

  attr_reader :numeral
end