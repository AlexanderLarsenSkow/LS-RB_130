# Input: any number of integers that determines the verse of the song
# Output: verse(s) of the beer song

# Rules:
  # Design a class that has two methods:
    # BeerSong#verse that takes an integer(s) input
      # can be any number of integers.
    # BeerSong#lyrics with no arguments, just plays the entire song.
    #

# Examples:
  # BeerSong#verse(2)
  # expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
  #     "Take one down and pass it around, 1 bottle of beer on the wall.\n"

  # 2 difficult spots: 2 bottles
    # 1 bottle

  # 0 go to the store and buy some more,
  # 1 take one down and pass it around, no more bottles of beer on the wall.

  # No problems start before verse 2. Every verse above 2 is the same.
  # At 2, then there is 1 bottle of beer on the wall at the end.

# Data Structures:
  # number, number - 1
    # if /1 bottles/ verse.gsub(/s\b/, '')
  # if either number or number < 1, replace the number with "no more"
  # At 0, "Go to the store and buy some more," replaces take it down and pass it around

  # verse method can take any number of arguments. iterate over it and play each verse.
    # helper method? that actually does it? That sounds like the easiest thing.

# Algorithm:
  # verse takes any number of arguments, iterates over the array of args
    # and then calls play_verse with the correct number.

  # lyrics method takes an array 99 to 0 and plays the entire song.

  # private method # create_verse
    # takes an integer and plays the song.
    # if the number is 1 or the other number is 1, sub out the s after the number.
    # If the verse is 2, sub out two more bottles => 1 more bottle
    # if the verse is 1, sub out one more bottle => no more bottles
    # if the verse is 0, no more bottles of beer
      # go to the store and buy some more replaces Take one down...
      
  # Thinking of putting all lines into an array.
  # end each verse with \n character.
  # 

class BeerSong
  def self.verse(*verse_numbers)
    verse_numbers.max.downto(verse_numbers.min) do |number|
      puts create_verse(number)
    end
  end

  def self.lyrics
    99.downto(0) do |number|
      puts create_verse(number)
    end
  end

  private

  def self.remove_s(line)
    (line.split.map do |word|
      if word == 'bottles'
        word.sub(/s/, '')

      else
        word
      end
    end).join(' ')
  end

  def self.line_one(number)
    line = "#{number} bottles of beer on the wall, #{number} bottles of beer.\n\n" 
    return self.remove_s(line) if number == 1
    line
  end

  def self.line_two(number)
    line = "Take one down and pass it around, #{number -1} bottles of beer on the wall.\n\n"
    return self.remove_s(line) if (number - 1) == 1
    line
  end

  def self.create_verse(verse_number)
    self.line_one(verse_number) + self.line_two(verse_number)
  end
end


BeerSong.verse(1)
BeerSong.verse(10, 5)