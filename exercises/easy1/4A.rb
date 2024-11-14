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

  # It would be good to do this much faster. How can we accomplish this and achieve better results?
  #

include Math

def divisors(target_number)
  first_divs = []

  (1..sqrt(target_number)).each do |num|
    first_divs << num if target_number % num == 0
  end

  (first_divs + first_divs.map { |n| target_number / n }).uniq.sort
end

p divisors(1) #== [1]
p divisors(2)
p divisors(3)
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute