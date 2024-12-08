# Input: day, number, month, and year
  # Meetup Object takes month and year

  # day method takes two strings

# Output: should be a new date or time object

# Rules:
  # construct objects that represent a meetup date
  # each object takes a month number (1 - 12) and a year (2021)
  # can take a descriptor like "first", "second"
    # case of these descriptor strings doesn't matter.
  # days of the week given as strings "Monday", "Tuesday", etc. case doesn't matter.

# teenths rule:
  # every day will have a teenth at some point, since there are 7 teenths in a row in a month.
  #

# Examples:
  # second Wednesday of May 2021, => May 12th, 2021
  # meetup = Meetup.new(2020, 4) # => April 2020

  # meetup.day("Monday", "first") # => return new date. Get the day number from this.

  # converting the "Monday" and "first" strings to a workable day. And then also "teenths."


# Data Structures:
  # add 1 to the day until we have the wday for the day AND satisfy the condition for the "first" / "last" string, etc
  # days of the week will be hash
    # "Monday" => 1
    # "Tuesday" => 2

  # teenth => 13, 14, 15, 16, 17, 18, 19

  # add each day to an array. And indicies. add them until the month is the next month.
  # then take the 0, 1st, 2nd, and last index.


# Algorithm:
  # create constants for week days
  # create constant for desciptor indicies
  # create constant for teenths

  # constructor method that takes a year and a month
    # 2 instance variables @year and @month with a getter method

  # day method
    # calculates, from the two strings (1 is a day, the other is the descriptor), both are downcased
    # iterate through the wday constant and find the weekday number.

    # day will equal the current_day if the .wday equals the wday and is the same as the
    # add 1 to the date until the day equals the wday

require 'date'

class Meetup
  WEEKDAYS = %w(Sunday Monday Tuesday Wednesday Thursday
              Friday Saturday).zip(0..6).to_h

  TEENTHS = [13, 14, 15, 16, 17, 18, 19]

  DESCRIPTOR_INDICIES = {
    "first" => 0,
    "second" => 1,
    "third" => 2,
    "fourth" => 3,
    "fifth" => 4,
    "last" => -1
  }

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    day = 1
    weekday, descriptor = weekday.capitalize, descriptor.downcase

    weekday_number = find_weekday_number(weekday)
    possible_days = find_matching_days(weekday_number)

    if descriptor == "teenth"
      possible_days.each do |current_day|
        day = current_day if TEENTHS.include? current_day
      end

    else
      day = possible_days[get_index(descriptor)]
    end

    return day if !day
    Date.civil(year, month, day)
  end

  private

  def get_index(descriptor)
    DESCRIPTOR_INDICIES.each do |version, index|
      return  index if descriptor == version
    end
  end

  def find_weekday_number(weekday)
    WEEKDAYS.each do |day, number|
      return number if day == weekday
    end
  end

  def find_matching_days(weekday_number)
    days = []
    current_date = Date.civil(year, month, 1)

    while current_date.month == month
      current_day = current_date.day
      days << current_day if current_date.wday == weekday_number
      current_date += 1
    end
    days
  end
end
