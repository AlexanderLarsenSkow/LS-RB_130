# Passing Parameters 2

def group(birds)
  yield(birds)
end

birds = ['raven', 'finch', 'hawk', 'eagle']

group(birds) do |bird1, bird2, *raptors|
  puts raptors
end