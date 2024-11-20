# Write a regex that matches any line that ends in ?

text = "What's up, doc?
Say what? No way.
?
Who? What? Where? When? How?"

p text.scan(/.*\?$/)