def proc_maker(&block)
  block
end

a = proc_maker { puts 10 }
b = proc_maker { puts "Alakazam" }
c = proc_maker { puts :nononono }

a.call
b.call
c.call

def letter_maker
  letter_code = 64
  letters = ''

  proc do
    letter_code == 90 ? letter_code = 65 : letter_code += 1
    letters << letter_code.chr
  end
end

first = letter_maker
3.times { first.call }

second = letter_maker
2.times { second.call }

p first.call
p second.call