# Match any words that begins with b and ends in e
# There can be any number of letters in between
# all lowercase

text = "To be or not to be
Be a busy bee
I brake for animals."

p text.scan(/\bb[a-z]*e\b/)