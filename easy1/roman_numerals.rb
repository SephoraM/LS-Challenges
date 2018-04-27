class Integer
  def to_roman
    numerals = [
      %w[I II III IV V VI VII VIII IX], %w[X XX XXX XL L LX LXX LXXX XC],
      %w[C CC CCC CD D DC DCC DCCC CM], %w[M MM MMM]
    ]

    backwards_numerals = digits.map.with_index do |digit, index|
      digit.zero? ? '' : numerals[index][digit - 1]
    end

    backwards_numerals.reverse.reduce(:+)
  end
end
