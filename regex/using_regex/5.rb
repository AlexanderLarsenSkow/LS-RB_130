# Write a method that changes the first occurrence of the word
# 'apple' blueberry or cherry to danish

# Input: string
# Output: transformed string with danish in it

# Rules:
  # if apple blueberry or cherry are present
  # change this first word out with danish
  # Don't change any further occurrences after the first
  # Don't change anything if one of these isn't present.

# Examples:
# danish('An apple a day keeps the doctor away')
# # -> 'An danish a day keeps the doctor away'

# danish('My favorite is blueberry pie')
# # -> 'My favorite is danish pie'

# danish('The cherry of my eye')
# # -> 'The danish of my eye'

# danish('apple. cherry. blueberry.')
# # -> 'danish. cherry. blueberry.'

# danish('I love pineapple')
# # -> 'I love pineapple'

def danish(baked_string)
  baked_string.sub(/\b(apple|blueberry|cherry)\b/i, 'danish')
end

p danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

p danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

p danish('The cherry of my eye')
# -> 'The danish of my eye'

p danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

p danish('I love pineapple')
# -> 'I love pineapple' # apple, don't change apple here. need a word boundary