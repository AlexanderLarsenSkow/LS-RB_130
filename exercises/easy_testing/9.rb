# Same Object Assertions

# Write a test that will fail if list and the
# return value of list.process are different objects.

require 'minitest/autorun'

class List
  def process
    self
  end
end

class ListTest < Minitest::Test
  def test_process
    list = List.new
    assert_same(list, list.process)
  end
end