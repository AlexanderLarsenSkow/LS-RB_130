# What does each do?
# Iterates over a collection.

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])

    counter += 1
  end

  array
end

each(['Joe', 'Montana']) do |el|
  puts el
end

# 1 2 3