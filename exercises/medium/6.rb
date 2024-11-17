# Method to Proc

# In Integer#to_s, to_s can take an argument that determines what base it is.
# to switch to base 8, you can put 8 in as an argument.
# Then convert back to an integer.

def convert_to_base_8(n)
  n.to_s(8).to_i
end

# We can convert a method to a proc with Method#to_proc
# Use method(:method_name) syntax
# The method name should be a symbol, so it keeps up with symbol to_proc

base8_proc = method(:convert_to_base_8).to_proc

# use & here with the base8_proc object to convert to a block.
# Now, we have converted a method to a block which we can use
# as a closure we pass around in the code.
# This is especially useful for map calls, since it will transform the array into base 8 integers!

p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41] # true

# [10, 12, 14, 16, 20, 41]