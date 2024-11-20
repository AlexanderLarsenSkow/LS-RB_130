# Modify the previous example so that the URL anywhere on each line so long as it begins with a word boundary.

urls = "https://launchschool.com/
http://mail.google.com/mail/u/0/#inbox
htpps://example.com
Go to http://launchschool.com/
https://user.example.com/a.cgi?a=p&c=0 hello
    https://launchschool.com/"

p urls.scan(/\bhttps?:\/\/\S*/)