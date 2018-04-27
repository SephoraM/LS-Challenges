class PerfectNumber
  def self.classify(number)
    raise 'Invalid number' if number.negative? # RuntimeError is default

    sum_of_factors = (1..number / 2).select { |i| (number % i).zero? }.sum

    if sum_of_factors == number
      'perfect'
    elsif sum_of_factors > number
      'abundant'
    else
      'deficient'
    end
  end
end
