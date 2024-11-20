# Write a regex that matches the last word in each line of text.
# Words are a sequence of non-whitespace characters.

text = "What's up, doc?
I tawt I taw a putty tat!
Thufferin' thuccotath!
Oh my darling, Clementine!
Camptown ladies sing this song, doo dah."

p text.scan(/\S+$/)

# This makes so much sense. $ means it's at the end of the line. Doof.
