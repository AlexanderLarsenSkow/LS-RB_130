def echo(string)
  yield
  string
end

# p echo("hello") # => "hello" # not providing a block when `yield` is used will cause an error
  # LocalJumpError no block given

def echo(string)
  yield if block_given?
  string
end

p echo('doggie') # => "doggie" # This code executes because the `yield` keyword only runs if a block is given as an argument.

# echo { puts 'yo' } # block only runs if `yield` keyword is used to execute the block.

echo("hello") { puts "Yo Yo" } # "Yo Yo runs because the code in the method def yields to the code provided in the block."