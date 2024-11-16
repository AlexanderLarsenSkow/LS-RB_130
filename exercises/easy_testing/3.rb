require 'minitest/autorun'

class Tester < Minitest::Test
  def test_nil
    array = [1, 2, 3]
    assert_nil(array[100])
  end
end