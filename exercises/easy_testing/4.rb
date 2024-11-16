require 'minitest/autorun'

class Tester < Minitest::Test
  def test_empty
    arr = []
    assert_empty(arr)
  end
end