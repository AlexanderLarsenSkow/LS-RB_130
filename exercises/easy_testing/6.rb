# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire(experience = nil)
    raise NoExperienceError.new("We can't hire you, kid.") if experience == nil
    "You're hired!"
  end
end

class EmployeeTest < Minitest::Test
  def test_hire
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end