# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # just outputs the object code
puts my_proc.class # outputs the class
my_proc.call # calls the block but doesn't know what the variable thing is
my_proc.call('cat') # now it knows what the variable is.

# We have to call the block with a variable defined if we want the variable to be anything but nil
  # when the block executes.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # proc object? weird
puts my_second_lambda # also a proc object
puts my_lambda.class # proc class. Interesting.
my_lambda.call('dog') # calling the code within the lambda object with an argument outputs the full string.
# my_lambda.call # This line throws an error.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# The bigg difference so far is that the lambda `call` method needs to have the same number of
  # arguments as the block defined for it. Its arity is stricter.
# also, lambdas are a type of proc with strict arity.
# lambdas are a type of proc, as seen from line 19: it is an uninitialized constant error. We don't
  # create new lambdas from a Lambda class. They are a type of proc.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # "This is a ." You can pass a block in if yield is used.
# block_method_1('seal') # LocalJumpError because no block is provided. `yield` without `block_given?` runs only with a block.

# procs and lambdas can be passed around in the code as closures. However, blocks are passed in during method invocation
  # and are not defined beforehand. Using yield can be very strict, as it requires a block here.
  # The problem is that yield doesn't receive any arguments, so nothing actually gets passed into the block despite
    # a block parameter being defined on line 32. This shows that blocks have less strict arity as well,
    # as we don't pass any arguments to yield but can still define parameters in the block without throwing exceptions.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # "This is a turtle." argument passed in this time.
block_method_2('turtle') do |turtle, seal| # "This is a turtle and a " # second block param is not defined, no error
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."} # undefined local variable `animal` because this is not defined
  # as a parameter
  
# blocks can take any number of arguments in their blocks, it won't throw an error because blocks have lax arity.
# they are very flexible in this regard. However, trying to use a local variable like `animal` that hasn't been
# defined in the pipe brackets or that is bound to the block will throw an exception. `yield` takes an argument here
# but no parameter is written into the block, thus running an error.

# Ultimately, blocks and procs have much more flexible arity than lambdas do, considering that they can
# take fewer or more block arguments and it won't throw any exceptions. Lambdas, on the other hand, are much
# more strict and require the same number of arguments. They are a type of proc, and as such are a type of closure 
# that can be passed around, albeit one that demands a more precise following of the rules of its definition. Procs
# are much more flexible as closures go.

# EDIT: Blocks are still types of closures. They just are defined with the method call itself rather
  # than beforehand like procs or lambdas.