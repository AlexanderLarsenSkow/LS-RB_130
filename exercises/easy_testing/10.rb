# Refutations

# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class Tester < Minitest::Test
  def test_include
    array = ['xyz']
    refute_includes(array, 'xyy')
  end
end

