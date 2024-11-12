def times(number)
  counter = 0

  loop do
    break if counter == number
    yield(counter)
    counter += 1
  end

  number
end

times(5) do |_|
  puts 'Hello There'
end

# 0 1 2 3 4
# returns 5