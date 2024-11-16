# Move the output to a block / let the method caller figure out the implementation

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) do |items|
  puts "#{items.join(', ')}"
end