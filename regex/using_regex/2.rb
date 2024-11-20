# Write a regex that returns all the fields in a haphazardly formatted string?
# spaces / commas / tabs

# Input: string
# Output: split array

# Rules:
  # split the string based on delimiters
    # commas, tab characters, white space, etc


# Examples:
# fields("Pete,201,Student")     # ["Pete", "201", "Student"]
# fields("Pete \t 201   ,  TA")  # ["Pete", "201", "TA"]
# fields("Pete \t 201")          # ["Pete", "201"]
# fields("Pete \n 201")          # ["Pete", "\n", "201"]

def fields(string)
  string.split(/[,\t ]+/)
end

p fields("Pete,201,Student")     # ["Pete", "201", "Student"]
p fields("Pete \t 201   ,  TA")  # ["Pete", "201", "TA"]
p fields("Pete \t 201")          # ["Pete", "201"]
p fields("Pete \n 201")          # ["Pete", "\n", "201"]

