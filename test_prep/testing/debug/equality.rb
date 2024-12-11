require 'minitest/autorun'

class MyClass
  def initialize(value)
    @value = value
  end

  def ==(other)
    value == other.value
  end

  protected

  attr_reader :value
end

class MyClassTest < Minitest::Test
  def test_equality
    obj1 = MyClass.new(5)
    obj2 = MyClass.new(5)
    assert_equal(obj1, obj2)
  end
end