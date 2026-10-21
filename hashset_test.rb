require_relative 'hashset'

set = HashSet.new

# Adding keys
set.set('apple')
set.set('banana')
set.set('carrot')
set.set('dog')
set.set('apple') # Duplicate, should not increase length

puts "Length after adding items (apple added twice): #{set.length}" 
puts "Has 'banana'? #{set.has?('banana')}" 
puts "Has 'spaceship'? #{set.has?('spaceship')}" 

# Testing removal
puts "Removing 'carrot'. Returned: #{set.remove('carrot')}"
puts "Length after removal: #{set.length}" 
puts "Has 'carrot' now? #{set.has?('carrot')}" 

# Testing all keys
puts "All keys in set: #{set.keys.inspect}"

# Testing clear
set.clear
puts "Length after #clear: #{set.length}"