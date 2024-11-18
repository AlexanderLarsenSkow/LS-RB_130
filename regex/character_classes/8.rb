text = "The regex /[^a-z]/i matches any character that is
not a letter. Similarly, /[^0-9]/ matches any
non-digit while /[^A-Z]/ matches any character
that is not an uppercase letter. Beware: /[^+-<]/
is at best obscure, and may even be wrong."

p text.match?(/\[\^[a-zA-Z0-9]\-[a-zA-Z0-9]\]/)