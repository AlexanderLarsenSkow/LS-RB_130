# Write a program to determine whether a triangle is
  # equilateral (all 3 sides the same length)
  # isosceles (2 sides the same)
  # scalene (all 3 sides different)

# all sides must be length > 0
# The sum of any two sides must be greater than the third.

# PEDAC

# Triangle Class
  # initialize(side1, side2, side3)
  # takes 3 arguments and has 3 instance vars

# Methods:
  # kind:
    # determines what kind the triangle is, returns a string (constant maybe)
  # initialize: raise ArgumentError if any side is 0 or negative or two sides are less than a third side

  # less than third side
    # input: sides array
    # output: true if any 2 sides are less than a third side

    # Rules:
      # if any 2 sides are less than a third side, return true. else, false

    # Examples:
      # [1, 2, 6] 1 and 2 less than 6

    # Data Structures:
      # select every element that doesn't share the same index.
      # if the sum is less than the current element, return true.

    # Algo
      # Iterate over each integer with an index
      # select all the values that don't share this index
      # if the current integer is greater than teh sum of this array, return true.
      # else, false

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]

    raise ArgumentError if impossible_triangle?
  end

  def impossible_triangle?
    less_than_one? || less_than_other_side?
  end

  def less_than_one?
    sides.any? { |side| side <= 0 }
  end

  def less_than_other_side?
    sides.each_with_index do |side, index1|
      other_sides = sides.select.with_index do |_, index2|
        index1 != index2
      end

      return true if side >= other_sides.sum
    end

    false
  end

  def kind
    if equilateral?
      "equilateral"

    elsif isosceles?
      "isosceles"

    elsif scalene?
      "scalene"
    end
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end

  def scalene?
    sides.uniq.size == 3
  end

  private

  attr_reader :side1, :side2, :side3, :sides
end

# triangle = Triangle.new(1, 1, 3)