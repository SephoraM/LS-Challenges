class Luhn
  def self.create(number)
    number *= 10
    luhnie = new(number)
    luhnie.valid? ? number : number + 10 - (luhnie.checksum % 10)
  end

  def initialize(number)
    @digits_with_index = number.digits.each_with_index
  end

  def addends
    double_odd_index.map { |digit| digit >= 10 ? digit - 9 : digit }
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  private

  attr_reader :digits_with_index

  def double_odd_index
    digits_with_index.map { |digit, idx| idx.odd? ? digit * 2 : digit }.reverse
  end
end
