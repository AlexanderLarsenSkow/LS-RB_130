# Write a regex that returns true if its argument is a URL, else false

# Input: url string
# Output: Boolean

# Rules:
  # If the string is a url, return true. else, false
  # a url starts with http// or https// and ends in .com
  # can have any number of characters between.
  # must start the line with h

# Examples:
# url?('https://launchschool.com')     # -> true
# url?('http://example.com')           # -> true
# url?('https://example.com hello')    # -> false
# url?('   https://example.com')       # -> false

def url?(url_candidate)
  url_candidate.match?(/^https?:\/\/.*\.com$/)
end

p url?('https://launchschool.com')     # -> true
p url?('http://example.com')           # -> true
p url?('https://example.com hello')    # -> false
p url?('   https://example.com')       # -> false

