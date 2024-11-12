3.times { |num| puts num } # 0 1 2

# `num` is an argument given for the block in this case.

# method implementation
def increment(number)
  number + 1
end

# method invocation
increment(5)                            # => 6

# Basic increment method with Integers

def increment(number)
  yield(number + 1) if block_given?
  number + 1
end

increment(5) { |n| puts n } # 6

# So here the code we give the block an argument by using that in the `yield` keyword.
# Interesting.

# method implementation
def test
  yield(3, 2) # passing 2 block arguments at block invocation time
end

# method invocation
test { |num| puts num } # outputs 3, since this is the first argument given to `yield` in `test`.

# It doesn't matter how many arguments we pass in to a block.
# Fewer is okay, more is okay.