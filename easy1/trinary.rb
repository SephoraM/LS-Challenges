class Trinary
  def initialize(string)
    @string = string
  end

  def to_decimal
    trinary? ? digits_with_idx.inject(0) { |acc, (n, i)| acc + n * (3**i) } : 0
  end

  private

  attr_reader :string

  def trinary?
    !string.match(/[^012]/)
  end

  def digits_with_idx
    string.reverse.chars.map(&:to_i).each_with_index
  end
end
