puts "banana".match?(/banana|orange|apple|strawberry/) == true
puts "orange".match?(/banana|orange|apple|strawberry/) == true
puts "pineapples".match?(/banana|orange|apple|strawberry/) == true
puts "strawberry".match?(/banana|orange|apple|strawberry/) == true
puts "raspberry".match?(/banana|orange|apple|strawberry/) == false
puts "grappler".match?(/(banana|orange|apple|strawberry)/) == true