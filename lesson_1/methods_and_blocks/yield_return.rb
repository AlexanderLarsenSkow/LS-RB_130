def compare(string)
  puts "Before: #{string}"
  puts "After: #{yield(string)}"
end

compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

# Using `yield` in the final line makes the block your return value. Pretty simple stuff.

def compare(string)
  puts "Before: #{string}"
  after = yield(string)
  puts "After: #{after}"
end

compare("alejandro") { |name| name.capitalize }

# Before: alejandro
# After: Alejandro

# You can assign a variable to save the return value from the block and use it as the return value as well.

# nil is returned here, remember. So the main focus of this method is output / display