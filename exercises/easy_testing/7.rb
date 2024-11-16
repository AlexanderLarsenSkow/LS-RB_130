# Type Assertions

# Write a minitest assertion that will fail if value is not an instance of
# the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'

class Tester < Minitest::Test
  def test_numeric
    assert_instance_of(Numeric, 1)
    assert_instance_of(Numeric, 1.0)
  end
end