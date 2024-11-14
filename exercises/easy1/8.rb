# None?

# Input: collection
# Output: true or false

# Rules:
  # return true if all els eval to false
  # otherwise return false
  # Stop iterating if something evals to true

# Examples:
# none?([1, 3, 5, 6]) { |value| value.even? } == false
# none?([1, 3, 5, 7]) { |value| value.even? } == true
# none?([2, 4, 6, 8]) { |value| value.odd? } == true
# none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# none?([1, 3, 5, 7]) { |value| true } == false
# none?([1, 3, 5, 7]) { |value| false } == true
# none?([]) { |value| true } == true

def none?(collection)
  collection.each do |element|
    return false if yield(element)
  end

  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
