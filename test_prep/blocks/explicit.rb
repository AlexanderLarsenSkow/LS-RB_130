# Create a method execute block that takes a proc as an argument and calls it.
# Then call the method in an explicit block and implicit block.

a_proc = proc { "I don't know what I've been told..." }

def execute_block(proc)
  proc.call
end

p execute_block(a_proc)

def run(&block)
  lyrics = "But this job is getting old"
  puts block.call + lyrics
end

run { execute_block(a_proc) }

def run2
  lyrics = "But this job is getting old"
  puts yield + lyrics
end

run2 { execute_block(a_proc) }
