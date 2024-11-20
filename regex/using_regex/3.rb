# Write a method that changes one of the math operators (+ - * /)
# to a ? sign and returns the resulting string

# Input: string
# Output: transformed string

# Rules: ^
  # only changes the first one.

# Examples:
# mystery_math('4 + 3 - 5 = 2')
# # '4 ? 3 - 5 = 2'

# mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # '(4 ? 3 + 2) / 7 - 1 = 1'

# Have to use `sub` since it only transforms the first occurrence. Lovely.

def mystery_math(formula)
  formula.sub(/([\+\-\*\/])/, '?')
end

p mystery_math('4 + 3 - 5 = 2')
# '4 ? 3 - 5 = 2'

p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# '(4 ? 3 + 2) / 7 - 1 = 1'