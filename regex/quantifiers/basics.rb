text = "Four and 20 black birds
365 days in a year, 100 years in a century.
My phone number is 222-555-1212.
My serial number is 345678912."

p text.scan(/\b\d\d\d\d*\b/)

# \d* adds 0 or more additional digits to the regex pattern.
# so we match from 3 concurrent digits in the same word then take all occurrences that have more than 3 digits.

p text.scan(/x*/) # matches all these empty strings. OOF
# definitely means ZERO or more.

text2 = 'ct
cot
coot
cooot
coooooooooot'

p text2.scan(/co*t/) # increasing number of o's. Doesn't matter how many.

text3 = '15
12345
12342342345
1234235'

p text3.scan(/1(234)*5/)

# +
# matches one or more, not zero or more
# adds one to your total of characters.

p text.scan(/\b\d\d\d+\b/)

text4 = 'a single x matches.
As is a string of xxxxx like that.'

p text4.scan(/x+/)


# ?
# Zero or One
# applies to the pattern to the left like the previous examples.

text5 = "Scott scoots but doesn't act cooot."

p text5.scan(/coo?t/)

# gives an option for whether to take between 1 and 0.
# In this example, can take 'cot' or 'coot' but not more o's than this.

dates = "20170111
2017-01-11
2017-0111
201701-11"

p dates.scan(/\b\d\d\d\d-?\d\d-?\d\d\b/)
# good option for checking for matching if there's a - between dates or not.

# Ranges:

# p {m} matches precisely m occurrences of the pattern.
# p {m,} matches m or more occurrences
# p {m, n} matches m or more occurrences of the pattern, but not more than n. Establishes a range.

phone = "2225551212 1234567890 123456789 12345678900"

p phone.scan(/\b\d{10}\b/)

# Match digits 3 or more in length:

text6 = "Four and 20 black birds
365 days in a year, 100 years in a century.
My phone number is 222-555-1212.
My serial number is 345678912."

p text6.scan(/\b\d{3,}\b/)

# Match words of 5 to 8 letters

text7 = "Bizarre
a
one two three four five six seven eight nine
sensitive
dropouts"

p text7.scan(/\b[a-zA-Z]{5,8}\b/) # no space between the ranges in p {m,n}

# Greediness vs laziness.
# greediness means we want to match the biggest possible one, or keep getting bigger
# laziness means we want smaller matches.