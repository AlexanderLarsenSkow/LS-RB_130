require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text = File.new("sample.txt")
    @text_obj = Text.new(@text.read)
    @text.rewind
  end

  def test_swap
    expected = @text.read.gsub('a', 'e')
    actual = @text_obj.swap('a', 'e')
    assert_equal expected, actual
  end

  def test_word_count
    expected = @text.read.split.size
    actual = @text_obj.word_count

    assert_equal expected, actual
  end

  def teardown
    @text.close
    puts "File has been closed: #{@text.closed?}"
  end
end
