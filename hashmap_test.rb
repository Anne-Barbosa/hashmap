require_relative 'hashmap'

test = HashMap.new

# Populating the hash map (12 items)
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Length original: #{test.length}"
puts "Initial capacity: #{test.capacity}"

# Overwriting existing nodes
test.set('apple', 'green-apple')
test.set('banana', 'dark-yellow')

puts "New value for apple: #{test.get('apple')}"
puts "New value for banana: #{test.get('banana')}"
puts "Length after overwrite: #{test.length}"

# Triggering growth by adding the 13th item
test.set('moon', 'silver')

puts "Length after add 'moon': #{test.length}"
puts "Capacity after add 'moon' (exceeded the load factor): #{test.capacity}"

test.set('moon', 'bright-silver')
test.set('dog', 'dark-brown')

puts "New value of moon: #{test.get('moon')}"
puts "New value of dog: #{test.get('dog')}"

puts "Length after overwrite: #{test.length}"

# Testing methods after expansion
puts "\n--- TESTING METHODS AFTER RESIZE ---"
puts "Has 'frog'? #{test.has?('frog')}"
puts "Has 'spaceship'? #{test.has?('spaceship')}"
puts "Value of 'elephant': #{test.get('elephant')}"
puts "Removing 'hat'. Deleted value: #{test.remove('hat')}"
puts "Length after removing 'hat': #{test.length}"
puts "All keys remaining: #{test.keys}"

# Testing clear
test.clear
puts "\nLength after #clear: #{test.length}"
puts "Keys after #clear: #{test.keys.inspect}"