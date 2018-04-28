# Refactored this Class in the beer_song_bonus file in this directory
class BeerSong
  def verse(number) # rubocop:disable Metrics/MethodLength
    case number
    when 0 then 'No more bottles of beer on the wall, no more bottles '\
       "of beer.\nGo to the store and buy some more, 99 bottles of "\
       "beer on the wall.\n"
    when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\n"\
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2 then "2 bottles of beer on the wall, 2 bottles of beer.\n"\
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when (3..99) then "#{number} bottles of beer on the wall, #{number} "\
       "bottles of beer.\nTake one down and pass it around, #{number - 1} "\
       "bottles of beer on the wall.\n"
    else
      'Invalid input. That many bottles exceeds the scope of the beer song!'
    end
  end

  def verses(starting_number, ending_number)
    all_verses = []
    starting_number.downto(ending_number) do |number|
      all_verses << verse(number)
    end
    all_verses.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
