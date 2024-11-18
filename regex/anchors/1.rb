text = "The lazy cat sleeps.
The number 623 is not a word.
Then, we went to the movies.
Ah. The bus has arrived."

p text.scan(/^The\b/) == ['The', 'The']

 # \b creates a word boundary so that you don't match substrings inside of a word like 'then'.
 # Really useful.