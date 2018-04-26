class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase_split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1 }
  end

  private

  def phrase_split
    phrase.downcase.split(/[^a-z0-9']+/).map do |word|
      word[0] == "'" ? word.delete("'") : word
    end
  end
  # wish I had thought of this: phrase.downcase.scan(/\b[\w']+\b/)

  attr_reader :phrase
end
