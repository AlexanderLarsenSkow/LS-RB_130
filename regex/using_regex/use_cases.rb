# Match

# fetch_url(url) if text.match(/\Ahttps?:\/\/\S+\z/)
# String#match returns a `MatchData` object that deccribes the substring if there's a match
# If no match, returns nil.

# Splitting Strings

record = "xyzzy\t3456\t334\tabc"
fields = record.split("\t")
p fields
# ["xyzzy", "3456", "334", "abc"]

# Splitting using regex whitespace characters
# \s+

record = "xyzzy  3456  \t  334\t\t\tabc"
fields = record.split(/\s+/)
p fields
# ["xyzzy", "3456", "334", "abc"]


# Capture Groups:
  # Use () and \1 \2 \3 etc to capture a piece of the regex and refer back to it later
  # Useful, for example, if you want to match "" or '' to each other in a character class.

# Transformations
  # using gsub

text = 'Four score and seven'
vowelless = text.gsub(/[aeiou]/, '*')
p vowelless
# -> 'F**r sc*r* *nd s*v*n'

# replaces any vowel character with a `'*'` sign

