class SumOfMultiples
  DEFAULT_SET = [3, 5].freeze

  def initialize(*args)
    @arguments = args.empty? ? DEFAULT_SET : args
  end

  def self.to(number)
    new(*DEFAULT_SET).to(number)
  end

  def to(number)
    multiples = (1...number).select do |digit|
      arguments.any? { |argument| (digit % argument).zero? }
    end
    multiples.inject(0) { |acc, multiple| acc + multiple }
  end

  private

  attr_reader :arguments
end
