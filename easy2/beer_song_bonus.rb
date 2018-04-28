class BeerSong
  LAST_VERSES =
    { 0 => "No more bottles of beer on the wall, no more bottles of beer.\n"\
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
      1 => "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and"\
      " pass it around, no more bottles of beer on the wall.\n",
      2 => "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down"\
      " and pass it around, 1 bottle of beer on the wall.\n" }.freeze

  def verse(number)
    LAST_VERSES[number] || create_verse(number)
  end

  def verses(start_number, end_number)
    (end_number..start_number).reverse_each.map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def create_verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"\
    "Take one down and pass it around, #{number - 1} bottles of beer on the "\
    "wall.\n"
  end
end
