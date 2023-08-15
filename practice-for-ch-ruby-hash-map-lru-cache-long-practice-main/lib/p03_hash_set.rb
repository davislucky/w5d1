class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count == num_buckets
      resize!
    end

    if !self[key.hash % num_buckets].include?(key)
      self[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    self[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self[key.hash % num_buckets].include?(key)
      self[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end
end