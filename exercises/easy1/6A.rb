# Build any? that takes either hash or array

# any? with a hash should either
  # A) one argument that is key / value pair array in the block
  # B) two arguments that is key / value pair in the block
  # C) just an array

def any?(collection)
  collection.each do |element|
    return yield(element) if yield(element)
  end
  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?({a: 1, b: 2, c: 3}){ |key, value| value > 2 } == true
p any?({a: 1, b: 2, c: 3}){ |key, value| value < 0 } == false


