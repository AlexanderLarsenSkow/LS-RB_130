# All?

# Input: collection
# Output: true or false

# Rules:
  # stop processing results after one evals to false
  # return true at the end if iteration finished

# Examples:
# all?([1, 3, 5, 6]) { |value| value.odd? } == false
# all?([1, 3, 5, 7]) { |value| value.odd? } == true
# all?([2, 4, 6, 8]) { |value| value.even? } == true
# all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# all?([1, 3, 5, 7]) { |value| true } == true
# all?([1, 3, 5, 7]) { |value| false } == false
# all?([]) { |value| false } == true

def all?(collection)
  collection.each do |element|
    return false unless yield(element)
  end

  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true