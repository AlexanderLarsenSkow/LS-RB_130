# Input: create new robot


# Rules:
  # Creating a new robot creates a random name
  # RX837. Two random letters and 3 random numbers.
  # The same numbers can be used.
  # Resetting a robot resets its name as well. Once a robot is reset, its name is RETIRED. # (isntance variable)
  # name should be an instance variable

# Example:
  # RX187 must not be used again.


# Data Structures:
  # use an array to store dead names
  # name instance variable for the name with a getter method
  # random_name helper should choose two random letters and 3 rand numbers for the name
  # map with index would be useful here. if index is less than 2, random letter, else, random number
  # go again if the name is in the dead characters array.

  # Algorithm:
    # Constant: All uppercase letters

    # Public methods:
      # initialize
      # getter for name instance variable
      # reset, do random name again.

    # Private methods:
      # random_name
        #until dead names doesn't include the current name
        # put 5 char array into map with index
        # if index is < 2, random letter
        # else, random number

        # return the new name joined together.

      # dead_names getter method

class Robot
  LETTERS = ('A'..'Z').to_a
  @@used_names = []

  attr_reader :name

  def initialize
    @name = random_name
    @@used_names << name
  end

  def reset
    initialize
  end

  private

  def random_name
    new_name = 'robot'.chars.map.with_index do |_, index|
      if index < 2
        LETTERS.sample

      else
        rand(9)
      end
    end.join

    @@used_names.include?(new_name) ? random_name : new_name
  end
end