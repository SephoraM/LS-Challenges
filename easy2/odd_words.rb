def odd_words(str)
  reversed_odd_words = str.delete('.').split.map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end

  result = reversed_odd_words.join(' ')
  str[-1] == '.' ? result + '.' : result
end

puts odd_words('')
puts odd_words('hello')
puts odd_words('.')
puts odd_words('hello.')
puts odd_words('hello  world hello.')
puts odd_words('my  world is  spinning and ringing   .')
puts odd_words('   there are large  wheels   on the truck .')
