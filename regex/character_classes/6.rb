# 7

puts "aBc".match?(/[Aa][Bb][Cc]/) == true
puts "aBc".match?(/(ABC|abc)/) == false

# The character class provides a little bit more flexibility.
# For example, you can have an uppercase character among the lowercase or vice versa.
# you cannot do this with the alternating patterns on line 4. It must be 'abc' or 'ABC' everytime.