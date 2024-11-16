require 'minitest/autorun'

class ValueTest < Minitest::Test
  def test_odd
    value1 = 2
    value2 = 3

    assert_equal(false, value1.odd?)
    assert_equal(true, value2.odd?)
  end
end

