p = "xxx wed jan 01 00:00:00 2014 xxx\n yyyy\n zzzz";

p.sub!(/\w{3}\s\w{3}\s\d+\s\d+:\d+:\d+\s\d{4}/,"boo")

puts p
