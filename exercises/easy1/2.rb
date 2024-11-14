# input: optional block, no arguments
# output: return block if block provided, otherwise, string "Does not compute"

# Rules ^

def compute
  return yield if block_given?
  "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute2(value)
  return "Does not compute." unless block_given?
  yield(value)
end

p compute2('Alex') { |name| "Hello " + name }
p compute2(2) { |n| 1 + n }
p compute2(2)