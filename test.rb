string = "Hello hElLo"
hash = string.scan(/\w/).each_with_object(Hash.new(0)) { |char, hash| hash[char.upcase] += 1 }
puts hash


string = "Hello hElLo"
hash = string.downcase.scan(/\w/).each_with_object(Hash.new(0)) { |char, hash| hash[char.upcase] += 1 }
puts hash


string = "Hello hElLo"
hash = string.upcase.scan(/\w/).each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
puts hash


hash.each do |key, value|
  puts "#{key} => #{value}"
end