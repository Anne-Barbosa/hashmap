# Ruby HashMap & HashSet Implementation

A custom implementation of **HashMap** and **HashSet** data structures written from scratch in Ruby, built as part of The Odin Project curriculum.

##  Features

* **Collision Handling:** Uses separate chaining (storing arrays of pairs inside each bucket).
* **Dynamic Resizing (Grow):** Automatically doubles the capacity and rehashes entries when the load factor threshold ($0.75$) is exceeded.
* **Input Validation:** Enforces index boundary checks to prevent out-of-bounds access.
* **Complete API:** Fully featured methods replicating standard hash map functionality.

---

## Implemented Methods

### `HashMap`
* `#hash(key)`: Generates a unique hash code for a string key and applies modulo based on current capacity.
* `#set(key, value)`: Inserts a new key-value pair or updates the value if the key already exists. Triggers automatic resizing if the load factor is exceeded.
* `#get(key)`: Returns the value associated with a given key, or `nil` if not found.
* `#has?(key)`: Returns a boolean indicating whether the key exists in the hash map.
* `#remove(key)`: Deletes an entry by its key and returns its value, or `nil` if not found.
* `#length`: Returns the total number of stored entries.
* `#clear`: Removes all entries and resets the hash map.
* `#keys`: Returns an array containing all keys.
* `#values`: Returns an array containing all values.
* `#entries`: Returns an array of all `[key, value]` pairs.

### `HashSet` (Extra Credit)
* Similar implementation focused purely on storing unique keys with no associated values (featuring `#set(key)`, `#has?(key)`, `#remove(key)`, `#length`, `#clear`, and `#keys`).

---

## Usage Example

```ruby
require_relative 'hashmap'

test = HashMap.new

# Insert key-value pairs
test.set('apple', 'red')
test.set('banana', 'yellow')

# Retrieve values
puts test.get('apple') # => "red"

# Check existence
puts test.has?('banana') # => true

# Check size (automatically triggers resize when load factor is exceeded)
puts test.length # => 2
```

## Running Tests

You can run the test files included in the repository using Ruby:

```ruby
ruby hashmap_test.rb
ruby hash_set_test.rb
```

## License

This project is open-source and available under the MIT License.
