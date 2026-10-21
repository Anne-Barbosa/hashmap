class HashSet
  attr_reader :capacity

  def initialize(load_factor = 0.75, capacity = 16)
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

  def set(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index] ||=  []

    unless @buckets[index].include?(key)
      @buckets[index] << key
    end

    if length > (@capacity * @load_factor)
      grow
    end
  end

  def has?(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    return false unless bucket

    bucket.include?(key)
  end

  def remove(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    return nil unless bucket

    if bucket.delete(key)
      return key
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
    @buckets.compact.flat_map { |bucket| bucket }
  end

  private

  def grow
    capacity *= 2
    @buckets = Array.new(@capacity)

    old_keys.each do |key|
      idx = hash(key)
      @buckets[idx] ||= []
      @buckets[idx] << key
    end
  end
end