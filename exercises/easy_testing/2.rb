require 'minitest/autorun'

class Tester < Minitest::Test
  def test_downcase
    assert_equal('xyz', 'XYZ'.downcase)
  end
end

