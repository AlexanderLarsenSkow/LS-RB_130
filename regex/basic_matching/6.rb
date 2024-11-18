# Challenge: Match "blackberry" and "blueberry". Only write berry once in the Regex pattern.
# don't match the last two strings.

puts "blueberry".match?(/(black|blue)berry/) == true
puts "blackberry".match?(/(black|blue)berry/) == true
puts "black berry".match?(/(black|blue)berry/) == false
puts "strawberry".match?(/(black|blue)berry/) == false

# The regex pattern we wrote doesn't work with "black berry" because there is no space provided
# in the regex on line 6 so that string doesn't match the pattern.

# This makes it match:

puts "black berry".match?(/(black|berry) berry/) == true