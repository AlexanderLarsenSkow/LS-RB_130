# Provide an example of how you would use the &:symbol shorthand in Ruby. Explain what it does and when it's useful.

array = ["Hello", "my", "darling"]

p array.map(&:upcase).map(&:reverse)

