require 'minitest/autorun'
require 'minitest/reporters' # to colorize the text when you run
Minitest::Reporters.use! # using the colorizer

require_relative 'car' # testing this file

class CarTest < Minitest::Test
    # test one to check if the constant is equal to 4
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip("Skipped it") # to skip a test
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

