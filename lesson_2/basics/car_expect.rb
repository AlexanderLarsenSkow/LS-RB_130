# A different way to write an assertion.
# Called Expectation Matcher

require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do # use describe method
  it 'has 4 wheels' do # use it method to write expectation
    car = Car.new
    _(car.wheels).must_equal 4           # this is the expectation
  end
end