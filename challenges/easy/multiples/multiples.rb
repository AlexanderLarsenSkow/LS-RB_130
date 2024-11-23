# Write a program that, given a natural number and a a set (array) of one or more other numbers
  # can find the sum of all the multiples in the set that are less than the first number.

  # If the set of numbers aren't given, use a default set of 3 and 5

# Input: number and set of numbers
# Output: sum of all multiples of the set that are less than the number

# Rules:
  # Given a number and an array of numbers,
    # compute the sum of all multiples of the numbers in the set from the lowest multiple up to the number.
  # default set is [3, 5]
  # The set is default in the constructor method
  # you can only take a multiple one time.

# Examples:
  # 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
  # The sum of these multiples is 78.

# Data Structures:
  # constructor:
    # if the arguments for the class constructor is an empty array, set the instance variable equal to [3, 5]
    # else, assign the args to the instance variable.

  # iterate from the min of the set upto the argument for the #to method
  # if the current number moduloed by any of the numbers in the instance array, add them to another array.
  # sum the array

class SumOfMultiples
  def initialize(*numbers)
    numbers == [] ? @base_numbers = [3, 5] : @base_numbers = numbers
  end

  def to(limit)
    multiples = []

    (base_numbers.min...limit).each do |number|
      multiples << number if base_numbers.any? { |base| number % base == 0 }
    end
    multiples.sum
  end

  def self.to(limit)
    self.new.to(limit)
  end

  private

  attr_reader :base_numbers
end

# p SumOfMultiples.new.base_numbers
# p SumOfMultiples.new(2, 3).to(20)