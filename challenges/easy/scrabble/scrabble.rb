# Write a program that takes a word as the main input for a class
# and calculate the scrabble score for the word.

# Input: word
# Output: integer score value

# Rules:
  # take each character and compute the score
  # 1: A, E, I, O, U, L, N, R, S, T
  # 2: D, G
  # 3: B, C, M, P
  # 4: F, H, V, W, Y
  # 5: K
  # 8: J, X
  # 10: Q, Z

# Examples:
  # Cabbage: 14
  # C: 3, a: 1, b: 3, b: 3, a: 1, g: 2, e: 1
    # 14 total

# Data Structures:
  # simple. Add all the values together
  # Create a hash that keys every value from the letter.

  # iterate through the characters
  # probably iterate through the keys. If the character is included in a key, take the key
    # and map teh array by the value, which is the integer
  # then sum it

# Algorithm:
  # create a class Scrabble
  # it takes a word for an instance variable in the constructor method

  # it also has a method score, which computes the score.
  # also build the hash.

class Scrabble
  attr_reader :word

  SCORES = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10
  }
  
  def initialize(word)
    @word = word
  end

  def score
    self.class.score(word)
  end

  def self.score(test_word)
    return 0 if test_word == nil

    letter_scores = test_word.chars.map do |letter|
      value = 0

      SCORES.each do |letters, points|
        value = points if letters.include?(letter.upcase)
      end
      value
    end
    letter_scores.sum
  end
end

p Scrabble.new('Abc').score