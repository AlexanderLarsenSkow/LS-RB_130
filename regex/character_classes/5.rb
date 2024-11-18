# 6 in exercises

puts "THE quick BROWN fox JUMPS over THE lazy DOG!".match?(/[A-Z \n\r]/i) == true
# only matches the "!" at the end.