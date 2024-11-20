# Modify the regex from number 4 so that teh url can have optional trailing or leading whitespace
# but is still on a line by itself.
# Test it by adding some trailing whitespace somewhere.

urls = "   https://launchschool.com/
       http://mail.google.com/mail/u/0/#inbox
htpps://example.com
Go to http://launchschool.com/
https://user.example.com/a.cgi?a=p&c=0 hello
    https://launchschool.com/   "

p urls.scan(/^\s*http?s:\/\/\S*\s*$/)