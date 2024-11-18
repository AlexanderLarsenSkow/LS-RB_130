text = "The lazy cat sleeps
The number 623 is not a cat
The Alaskan drives a snowcat"

p text.scan(/\bcat$/) == ['cat']

# $ goes at the end
# \b goes at the beginning since we want a word boundary so that we only match the word 'cat' and no substrings from other words.

