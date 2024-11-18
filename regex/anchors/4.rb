# Challenge

# match entire line of text
# first word is A or The
# There is a single space between first and second words
# The second word is any 4 letter word
# There is a single space here
# The third word is either dog or cat

text = "A grey cat
A blue caterpillar
The lazy dog
The white cat
A loud dog
--A loud dog
Go away dog
The ugly rat
The lazy, loud dog"

# 3 matches

p text.scan(/^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (cat|dog)$/)

# My solution matches the solution that LS provides.
# However, scan isn't taking the second word in the line which is weird.
# But it matches the full line on Rubular. Not sure why that is.
