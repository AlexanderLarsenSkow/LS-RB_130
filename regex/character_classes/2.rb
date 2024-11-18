text = "My cats, Butterscotch and Pudding, like to
sleep on my cot with me, but they cut my sleep
short with acrobatics when breakfast time rolls
around. I need a robotic cat feeder."

puts text.match?(/[cb][aou][t]/)

# This matches 'cut', 'cot', 'but', 'cat', 'bat', and 'bot' from the text.