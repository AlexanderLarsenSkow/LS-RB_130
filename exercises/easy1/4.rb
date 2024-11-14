# Divisors

# Input: integer
# Output: return an array of all positive divisors for the integer

# Rules:
  # return an array of all positive divisors for the integer

# Examples:
# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
# divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Data Structures:
  # idk, upto again?
  # create an array of all the numbers from 1 to the number
  # select only numbers that are divise the input number

# Algorithm ^

def divisors(target_number)
  (1..target_number).to_a.select do |number|
    target_number % number == 0
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute