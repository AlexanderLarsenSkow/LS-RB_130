# Input:
  # class Dimaond
  # class method make_diamond
  # takes one argument, string character that is a letter 'A', 'B', 'C'

# Output:
  # outputs a diamond with all the letters.
  # 'A' is always at the top and bottom of the diamond.

# Rules:
  # Given a character that is a letter, make a diamond of letters.
  # The letter at the top and bottom is always 'A'
  # The given letter is in the middle.
  # When only 'A' is given, it's just 'A' and a \n character.
  # After this, 'A' goes up and down: A is always in the middle.

  # 'raise argument error if not an uppercase letter'

# Brainstorming:
  # A is always in middle. No spaces for 'A'
  # B always has 1 space between each 'B' every other

# Examples

  # 2 lines for each character, EXCEPT the given character.
  # The idea would be to do the same thing for the top and bottom.
  # pick one, then repeat for the bottom.
  # start a line with the current character. This is as wide as it goes: no space between
    # character and newline. space between characters is number of characters / 2

# 'B' given
  #  A
  # B B
  #  A

    # problem here is 3 / 2 is 1

# 'C' given
  #   A
  #  B B
  # C   C
  #  B B
  #   A

# Data Structures:
  # outer_spaces start at 0
  # inner_space starts at + 2 from previous.
  # If the letter is 'A', + 0.
  # If the letter is 'B' + 1.
  # If the letter is anything else, + 2

  # outer space starts at 0 but increments by + 1 with each change.

  # just going to start with an array from 'A' to the input character.
  # iterate through it.

# Algorithm:
  # class Diamond

  # Helper Method
  # ::calcualte_starting_space
    # iterate through the array of input characters.
    # if the letter is 'A', add 0
    # if the letter is 'B', add 1.
    # else, add 2.

  # Main Method:
    # create an array of the letters
    # create 2 different arrays and put them together.
    # Take the middle letters and put them together with the inner space in the middle.
    # outer_space should be 0 or non existent.

    # For the first array,
      # iterate through the array of letters from 'A' to the second to last element
      # outer_space = calculate outer_space, inner_space = 0
      # add 1 to inner space for B, - 1 to outer space
      # add 2 to outer space and - 2 from inner space

      # A is tricky. It's always one letter with max outer space
      # if only A, we just return 'A' with a \n character.
      # join by \n character but add \n to last A line.

    # diamond_creator
      # iterate through each half of the letters array
      # and add the correct things to each one.

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    letters = ('A'..letter).to_a
    inner_space = calculate_inner_space(letters)
    diamond = []

    diamond += make_half(letters)
    diamond << (letters[-1] + (' ' * inner_space) + letters[-1])
    diamond += make_half(letters).reverse

    diamond.join("\n") + "\n"
  end

   def self.make_half(letters)
    half = []
    outer_space_val = (calculate_inner_space(letters) + 1) / 2
    inner_space_val = 1

    half << ((' ' * outer_space_val) + 'A' + (' ' * outer_space_val))

    letters[1..-2].each do |letter|
      outer_space_val -= 1
      outer_space = ' ' * outer_space_val
      inner_space = ' ' * inner_space_val
      inner_space_val += 2

      half << (outer_space + letter + inner_space + letter + outer_space)
    end
    half
  end

  def self.calculate_inner_space(letters)
    letters.map { |letter| space_value(letter) }.sum
  end

  def self.space_value(letter)
    case letter
    when 'A' then 0
    when 'B' then 1
    else
      2
    end
  end
end