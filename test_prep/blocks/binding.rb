animal = "tiger"

code_chunk = proc {puts "This #{animal} is vicious!" }

code_chunk.call # => "This tiger is vicious!"

animal = "penguin"

code_chunk.call # => "This penguin is vicious!"