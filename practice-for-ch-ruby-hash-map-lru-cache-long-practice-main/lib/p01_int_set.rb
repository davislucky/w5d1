class MaxIntSet

  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0

    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num % 20] << num #if self[num] 

    # p @store
  end

  def remove(num)
    self[num % 20].delete(num)
  end

  def include?(num)
    self[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count == num_buckets
      resize!
    end

    if !self[num % num_buckets].include?(num)
      self[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if self[num % num_buckets].include?(num)
      self[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    if count == num_buckets
      i = 0
      until i == num_buckets
        self[i].each do |ele|
          new_store[ele % new_store.length] << ele
        end

        i += 1
      end
      @store = new_store
    end
  end

  def [](num)
    @store[num]
  end
end