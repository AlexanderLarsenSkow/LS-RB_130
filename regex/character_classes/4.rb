# 4 and 5

puts "0x1234".match?(/[A-WYZ]/i) == true
puts "x".match?(/[^Xx]/) == false


# [^xX] isn't a valid solution because we will match absolutely any character that isn't
# 'x' or 'X', not just letters. So in this case, it will cause us to match extra characters
# that we don't want.