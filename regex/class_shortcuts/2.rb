"Doc in a big red box.
Hup! 2 3 4"

# ' big ' and ' 2 3 ' match the pattern but these other values aren't.
# ' 2 3 ' matches because the . regex shortcut includes empty spaces.

# 'Doc ' makes sense because it starts the string, doesn't have a whitespace char before it.
# I'm not sure why ' red ' doesn't match. My only theory is that it's next to ' big ', which shares a whitespace character with it.
  # That was it. Interesting.
  # adding 'black' between 'red' and 'box' shows that ' red ' matches afterwards. So some issue with character sharing. 
     
# ' box.' doesn't match because of the '.' character at the end.
# '\nHup!' doesn't match because of the '!'
# 