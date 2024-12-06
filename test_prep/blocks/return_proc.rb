def proc_maker(&block)
  block
end

a = proc_maker { puts 10 }
b = proc_maker { puts "Alakazam" }
c = proc_maker { puts :nononono }

a.call
b.call
c.call