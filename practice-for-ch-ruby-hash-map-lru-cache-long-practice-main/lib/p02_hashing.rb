class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash

    return 0.hash if self.empty?
    xor = self[0].hash

    self[1..-1].each_with_index do |num,i|
      hash = num.hash
      xor = (xor ^ hash)
    end

    xor
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end