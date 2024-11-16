# Kind Assertions

# Write a minitest assertion that will fail if value is not an
# instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'

class Tester < Minitest::Test
  def test_kind
    value = 1
    assert_kind_of(Numeric, value)
  end
end