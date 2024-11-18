text = "reds and blues
The lazy cat sleeps.
The number 623 is not a word. Or is it?"

p text.scan(/\b[a-z][a-z][a-z]\b/i) == ["and", "The", "cat", "The", "not"]