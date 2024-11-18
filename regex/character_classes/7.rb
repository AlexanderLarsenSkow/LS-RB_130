puts "ABC".match?(/abc/i)
puts "Abc".match?(/[Aa][Bb][Cc]/)

# There is essentially no difference between these two regex patterns.
# The first one can work with abc of any case
# The second one does the same.