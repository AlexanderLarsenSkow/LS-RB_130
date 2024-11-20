# Write a regex that matches a line if it only contains a URL
# A url begins with http:// or https:// and ends in a whitespace character or \n

urls = "https://launchschool.com/
http://mail.google.com/mail/u/0/#inbox
htpps://example.com
Go to http://launchschool.com/
https://user.example.com/a.cgi?a=p&c=0 hello
    https://launchschool.com/"

# p urls.scan(/^(http:\/\/|https:\/\/).*\s$/) # attempt one

# p urls.scan(/^https?:\/\/\S$/)

p urls.scan(/^https?:\/\/\S*$/)

