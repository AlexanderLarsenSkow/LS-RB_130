# Match any line taht ends in '?'
# but don't include lines that are only '?'

text = "What's up, doc?
Say what? No way.
?
Who? What? Where? When? How?"

p text.scan(/.+\?$/)

# Matches another character first before trying to match '?'