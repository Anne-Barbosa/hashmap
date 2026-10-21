class HashMap
    attr_reader :capacity
    
    def initialize (load_factor = 0.75, capacity = 16)
        @load_factor = load_factor
        @capacity = capacity
        @buckets = Array.new(@capacity)
    end

    def hash(key)
        hash_code = 0
        prime_number = 31

        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

        hash_code % @capacity
    end

    def get(key)
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length

        bucket = @buckets[index]
        return nil unless bucket

        bucket.each do |pair|
            return pair[1] if pair[0] == key
        end

        nil
    end

    def has?(key)
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length

        bucket = @buckets[index]
        return false unless bucket

        bucket.each do |pair|
            return true if pair[0] == key
        end

        false
    end

    def remove(key)
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length

        bucket = @buckets[index]
        return false unless bucket

        bucket.each_with_index do |pair, i|
            if pair[0] == key
                deleted_pair = bucket.delete_at(i)
                return deleted_pair[1]
            end
        end

        nil
    end

    def length
        count = 0
        @buckets.each do |bucket|
            count += bucket.length if bucket
        end

        count
    end

    def clear
        @buckets = Array.new(@capacity)
    end

    def keys 
        @buckets.compact.flat_map { |bucket| bucket.map { |pair| pair.first } }
    end

    def values
        @buckets.compact.flat_map { |bucket| bucket.map { |pair| pair[1] } }
    end

    def entries
        @buckets.compact.flat_map { |bucket| bucket }
    end

    def set(key, value)
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length

        @buckets[index] ||= []

        key_exists = false
        @buckets[index].each do |pair|
            if pair[0] == key
                pair[1] = value
                key_exists = true
                break
            end
        end

        @buckets[index] << [key, value] unless key_exists

        if length > (@capacity * @load_factor)
            grow
        end
    end

    private

    def grow
        old_entries = entries

        @capacity *= 2
        @buckets = Array.new(@capacity)

        old_entries.each do |key, value|
            idx = hash(key)
            @buckets[idx] ||= []
            @buckets[idx] << [key, value]
        end
    end
end

