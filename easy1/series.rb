class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(n)
    length = digits.size
    raise ArgumentError.new("Invalid Number!") if n > length
    idx = 0
    digits.each_with_object([]) do |_, arr|
      arr << digits[idx, n]
      return arr if idx == length - n
      idx += 1
    end
  end

  private

  attr_reader :digits
end
