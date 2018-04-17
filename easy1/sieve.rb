class Sieve
  def initialize(number)
    @highest_number = number
    @range_of_numbers = (2..number)
    @numbers = @range_of_numbers.map { |i| [i, 'unmarked'] }.to_h
  end

  def primes
    mark_composites
    numbers.select { |_, status| status == 'unmarked' }.keys
  end

  def mark_composites
    numbers.each do |number, status|
      if status == 'unmarked'
        multiples(number).each { |multiple| numbers[multiple] = 'composite' }
      end
    end
  end

  def multiples(number)
    range_of_numbers.each_with_object([]) do |multiplier, multiples|
      multiple = number * multiplier
      return multiples if  multiple > highest_number
      multiples << multiple
    end
  end

  private

  attr_reader :numbers, :highest_number, :range_of_numbers
end
