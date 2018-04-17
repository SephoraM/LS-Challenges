class Octal
  def initialize(string)
    @string = string.to_i.to_s
    @decimals = string.reverse.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if invalid_input?
    decimals.each_with_index.inject(0) { |acc, (n, idx)| acc + n * (8**idx) }
  end

  private

  def invalid_input?
    string.include?('9') || string.include?('8') || string == '0'
  end

  attr_reader :string, :decimals
end
