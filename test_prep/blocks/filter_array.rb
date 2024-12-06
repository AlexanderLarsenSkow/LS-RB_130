# Filter Array
# Takes array and block as arguments
# should only return of elements for which teh block returns true (select)

def filter_array(array, &block)
  truthy_els = []

  array.each do |element|
    truthy_els << element if block.call(element)
  end

  truthy_els
end

p filter_array([1, 2, 3]) { |n| n > 1 }

def filter2(array)
  truthy_els = []

  array.each do |element|
    truthy_els << element if yield(element)
  end

  truthy_els
end

p filter2([1, 2, 3], &:odd?)

# converts the symbol to a proc which converts to a block seemlessly inside the method definiton of filter2.
# Nice!