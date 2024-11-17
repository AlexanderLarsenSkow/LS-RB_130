# Input: text file, block
# Output: number of lines / words / paragraphs in the text file

# Rules:
  # take a text file and return how many lines, words, or paragraphs are there.
  # This should be accomplished in the block, or the block should tell us which one it is.
  # The block specifies what to focus on.

# Examples:
# 3 paragraphs
# 15 lines
# 126 words

# /n newline then Array size
# empty line?
# ' '


text = File.new("speech.txt", "r")

# p text.read#.split("\n\n").size
# p text.read#.split("\n").size
# p text.read

class TextAnalyzer
  def process(text)

    case yield.capitalize
    when "Words"
      number = text.read.split(' ').size
      text.rewind
      "There are #{number} words."

    when "Lines"
      number = text.read.split("\n").size
      text.rewind
      "There are #{number} lines."

    when "Paragraphs"
      number = text.read.split("\n\n").size
      text.rewind
      "There are #{number} paragraphs."
    end
  end
end

analyzer = TextAnalyzer.new
p analyzer.process(text) {"words"}
p analyzer.process(text) {"lines"}
p analyzer.process(text) {"paragraphs"}


class TextAnalyzer2
  def process
    text = File.open("speech.txt", 'r')
    yield(text.read)
    text.close
  end
end

analyzer2 = TextAnalyzer2.new
analyzer2.process { |text| puts "#{text.split(' ').size} words" }
analyzer2.process { |text| puts "#{text.split("\n").size} lines"}
analyzer2.process{ |text| puts "#{text.split("\n\n").size} paragraphs"}