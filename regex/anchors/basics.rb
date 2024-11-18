# ^ forces pattern to be at beginning of string
p "cat".scan(/^c.t/i)          # ["cat"] #
p "cot\n".scan(/^c.t/i)        # ["cot"] #
p "CATASTROPHE".scan(/^c.t/i)  # ["CAT"]
p "WILDCAUGHT".scan(/^c.t/i)   # []
p "wildcat\n".scan(/^c.t/i)    # [] # => empty array because ^ forces it to be at beginning. Without ^, returns ['cat']
p "-CET-".scan(/^c.t/i)        # []
p "Yacht".scan(/^c.t/i)        # []

p 'at'.match?(/[^c]/) == true

p "I love popcorn".scan(/[a-z]o/)

# $ tells Ruby to match at the end of a string.
p "cat".scan(/c.t$/i)          # ["cat"]
p "cot\n".scan(/c.t$/i)        # ["cot"]
p "CATASTROPHE".scan(/c.t$/i)  # []
p "WILDCAUGHT".scan(/c.t$/i)   # []
p "wildcat\n".scan(/c.t$/i)    # ["cat"] # matches becasue 'wildcat' end in 'cat'. Ruby ignores \n characters at the end of a string.
p "-CET-".scan(/c.t$/i)        # []
p "Yacht".scan(/c.t$/i)        # ["cht"] matches because 'Yacht' end in 'cht'


text = "cat\ncot\nCATASTROPHE\nWILDCAUGHT\n" +
       "wildcat\n-GET-\nYacht"

p text.scan(/^c.t/i) # ["cat", "cot", "CAT"] ^ matches if at beginning of a new line.
p text.scan(/c.t$/i) # ["cat", "cot", "cat", "cht"] $ matches if at the end of a new line. Interesting!


p text.scan(/\Ac.t/i) # ["cat"] # use \A to only match at beginning and ignore all \n characters.
p text.scan(/c.t\z/i) # ["cht"] # use \z to match only at the end and ignore all \n characters.

# Notes and Tips:
  # Avoid using anchors like $ and ^ when working with embedded \n characters.
  # If you have to do this, split the string by \n characters.
  # apply the regex to each substr in a loop.
  
  # Word Boundaries
  # \b : word boundaries (\w)
  # \B : non-word boundaries (\W)

  
  
