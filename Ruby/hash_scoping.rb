
def do_something(value) 
   value = "abcde"
end

hash_literal = { "one" => "original 1", "two" => "original 2" }

hash_literal.each { |key,value|
   puts "value is initially #{value}"
   value = "something else"
   puts "value within routine is now #{value} compared to: #{hash_literal[key]}"
   do_something(value)
   puts "value after function call is now #{value} compared to: #{hash_literal[key]}"
}

puts hash_literal["one"]