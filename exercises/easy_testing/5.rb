require 'minitest/autorun'

class Tester < Minitest::Test
  def test_include
    array = [1]
    assert_includes(array, 1)
  end
end