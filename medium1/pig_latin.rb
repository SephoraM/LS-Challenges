class PigLatin
  VOWEL_SOUND = /(^[aeiou]|^(y|x)[^aeiou])/i
  CONSONANT_SOUND = /([^aeiou]?qu|[^aeiou]+)/

  def self.translate(string)
    string.split.map { |word| translate_word.call(word) }.join(' ')
  end

  def self.move_consonant(word)
    consonant_sound = word.slice!(CONSONANT_SOUND)
    word + consonant_sound + 'ay'
  end

  def self.translate_word
    proc { |word| word =~ VOWEL_SOUND ? word + 'ay' : move_consonant(word) }
  end
end
