# all natural numbers are either
  # abundant
  # perfect
  # deficient

# this is based on the number and teh sum of its positive divisors
# the numebr that can be evenly divided in with no remainder, excluding hte number itself.

# Positive Divisors of 15:
  # 1, 3, 5
  # Aliquot Sum

# Input: integer
# Output: string

# Rules:
  # Perfect Numbers: Aliquot sum equals teh number
  # Abundant Numbers: Aliquot sum is more than the number
  # Deficient Numbers: Aliquot sum is less than the number
  # Raise a StandardError if the number given is below 0

# Examples:

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Data Structures:
  # classify method:
    # return 'abundant', 'perfect', or 'deficient'
    # the obvious thing is to iterate up to the number and take each number where the modulo is 0.
    # That can't be very efficient though.
    # range from 1 to the number / 2, since over the halfway point won't matter.
    # Then we select values

# Algorithm:
  # class PerfectNumber

  # getter method
  # no constructor method, just a class method PerfectNumber::classify

  # classify method
    # take a range from 1 to the number / 2
    # select every value that is an even modulo with the number
    # if these value summed are greater than the number, return 'abundant'
    # if less, return 'deficient'
    # if the same, return 'perfect'

class PerfectNumber
  def self.classify(number)
    aliquot_sum = aliquot_sum(number)
    if aliquot_sum > number
      "abundant"

    elsif aliquot_sum < number
      "deficient"

    else
      "perfect"
    end
  end

  def self.aliquot_sum(number)
     raise StandardError if number <= 0

    positive_divisors = (1..number / 2).select do |divisor|
      number % divisor == 0
    end

    positive_divisors.sum
  end
end

p PerfectNumber.classify(28)
