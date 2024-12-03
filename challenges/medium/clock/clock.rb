# Input: first argument is hour, second argument is minutes
# Output: to_s converts to a string

# Rules:
  # Create clock that is independent of date
  # You can add or subtract minutes from the clock
  # Don't mutate the clock when adding/subtracting: Create a new Clock object.
  # Two clock objects with the same time should be equal
  # Don't use Date or Time classes: only math.

  # Don't care about anything over 24 for hours
  # - 24 as many times as you can for the real number.
  # for minutes, never go over 60.
  # you won't get minutes over 60 in the ::at method, but could get it with + or -

# Examples
  # Clock.at(10) (class method that initializes a new object) "10:00"
  # Clock.at(10, 50) => "10:50"
  # Clock.at(37, 30) => "1:30"
  # Clock.at(10) => "10:00" - 3061 (minutes) => "06:59"

# Data Structures:
  # Adding and Subtracting always goes in minutes, not hours.
    # you have to convert the minutes into hours here x.x, probably the most difficult part.
    #

# Algorithm:
  # Clock Class

  # initialize 2 arguments, both default to 0. first is hours, second is minutes (integers)
    # create two instance variables set to these two values.

  # at method:
    # should call a conversion method somehwere.
    # creates a new clock object with the times specified.

  # to_s
    # converts the converted time to a string in the correct format

  # + (minutes) adds minutes to a new clock object

  # - (minutes) minuses minutes to a new clock object

  # ==(other_clock)
    # check if the times are equal. Checks for equality between hours and minutes.

  # convert
    # should take the hours integer and convert to the correct hour in the day.
    # same for minutes.

    # until hours are less than 24,
      # - 24.

    # divmod could be useful here for minutes.
      # Yep! Take the division and 181.divmod(60) => [3, 1] add 3 hours, add 1 minute


class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours = 0, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    convert
    format('%.2d', hours) + ":" + format("%.2d", minutes)
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end

  def +(new_minutes)
    added_minutes = minutes + new_minutes
    Clock.at(hours, added_minutes)
  end

  def -(new_minutes)
    minused_minutes = minutes - new_minutes
    Clock.at(hours, minused_minutes)
  end

  def convert
    conversion = minutes.divmod(60)
    self.hours += conversion[0]
    self.minutes = conversion[1]

    until hours < 24
      self.hours -= 24
    end

    convert_for_negative if minutes < 0

    [hours, minutes]
  end

  def convert_for_negative
    self.hours = 23 if hours == 0
    self.hours -= (minutes / 60)
  end
end

clock = Clock.at(0)
clock2 = clock - 50
# clock2.convert_for_negative
puts clock2
# clock3 = Clock.at(0, -130)
# clock3.convert_for_negative
# puts clock

# clock2 = Clock.at(10)
# puts clock2 - 90
# puts clock2