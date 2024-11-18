puts "0xDEADBEEF".match?(/[A-J0-9]/i) == true
puts "1234.5678".match?(/[A-J0-9]/i) == true
puts "Jamaica".match?(/[A-J0-9]/i) == true
puts "plow ahead".match?(/[A-J0-9]/i) == true

# all of them contain these digis somewhere, so there iit turns out to true.
