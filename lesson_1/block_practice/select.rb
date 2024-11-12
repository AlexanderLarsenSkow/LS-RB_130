def select(array)
  selected_values = []
  counter = 0

  while counter < array.size
    current_el = array[counter]
    el_tester = yield(current_el)

    selected_values << current_el if el_tester
    counter += 1
  end

  selected_values
end

# Test Cases

array = [1, 2, 3, 4, 5]

p select(array) { |n| n.odd? } # => [1, 3, 5]
p select(array) { |n| puts n } # => []
p select(array) { |n| n + 1} # => [1, 2, 3, 4, 5]
p select(['Joe', 'JOE', 'Sam']) { |str| str.start_with?('S')}
