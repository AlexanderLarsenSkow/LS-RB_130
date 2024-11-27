class Text
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end

# txt = Text.new(File.new('sample.txt').read)
# p txt.text

# txt.swap('a', 'b')

# p txt.text
# p txt.swap('a', 'e')


# p txt.swap('a', 'e')
# # p txt.text.rewind
# p abc
# # .to_s.swap('a', 'e')
# p abc.swap('a', 'e')