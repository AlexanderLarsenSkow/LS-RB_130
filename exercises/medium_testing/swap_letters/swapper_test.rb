require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text = File.new("sample.txt")
    @text_obj = Text.new(@text.read)
  end

  def test_swap
    @text.rewind
    expected = @text.read.gsub('a', 'e')
    actual = @text_obj.swap('a', 'e')
    assert_equal expected, actual
  end

  def teardown
    @text.close
  end
end
