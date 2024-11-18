puts "This line has spaces".match?(/(,| )/) == true
puts "This,line,has,commas,".match?(/(,| )/) == true
puts "No-spaces-or-commas".match?(/(,| )/) == false