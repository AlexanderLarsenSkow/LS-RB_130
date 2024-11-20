urls = "<h1>Main Heading</h1>
<h1>Another Main Heading</h1>
<h1>ABC</h1> <p>Paragraph</p> <h1>DEF</h1><p>Done</p>"

p urls.scan(/<h1>.*?<\/h1>/)

# Use ? for more lazy "takes" of the string.