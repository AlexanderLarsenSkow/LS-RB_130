# Write a program that takes a word and a list of possible words
  # and returns a sublist of all the words that are anagrams of hte main word.


# Problem:
  # Input: word, and list of words
  # output: list of words that are all anagrams of the main word

  # Rules:
    # an anagram is a word that can be reorganized into another word
    # select all words that are anagrams.
    # anagrams are case insensitive.
    # anagrams can't be the same word

  # Examples:
    # fowl and wolf are anagrams
    # flow and wolf are anagrams
    # ride and dire are anagrams

  # Data Structures:
    # build a method that returns an array of all the anagrams for the main word

  # Algorithm:
    # Main Class Anagram
      # constructor method
      # 1 instance variable, which is the word

      # match method
        # selects all words from an argument array that are anagrams

      # is_anagram?(word1, word2)
        # word1 and word2 are split into arrays and sorted.
        # if they equal one another, they are anagrams.

class Anagram
  def initialize(word)
    @main_word = word
  end

  def match(words)
    words.select { |word| are_anagrams?(word) && !same_word?(word) }
  end

  private

  def same_word?(word)
    main_word.downcase == word.downcase
  end

  def are_anagrams?(word)
    main_word.downcase.chars.sort == word.downcase.chars.sort
  end

  attr_reader :main_word
end