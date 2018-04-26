class Anagram
  def initialize(test_word)
    @test_word = test_word.downcase
  end

  def match(words)
    words.select { |word| anagram?(word.downcase) }
  end

  private

  def anagram?(word)
    word != test_word && word.chars.sort == test_word.chars.sort
  end

  attr_reader :test_word
end
