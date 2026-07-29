class FoodChainSong
  ITEMS = ['fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse']
  LINES = [
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "It wriggled and jiggled and tickled inside her.",
      "How absurd to swallow a bird!",
      "Imagine that, to swallow a cat!",
      "What a hog, to swallow a dog!",
      "Just opened her throat and swallowed a goat!",
      "I don't know how she swallowed a cow!",
      ""
  ]

  def verse(stanza)
    item = ITEMS[stanza - 1]
    line = "I know an old lady who swallowed a #{item}.\n"
    line += line_sanitizer(related_line(stanza))
    line += middle_lines(stanza)
    line += line_sanitizer(last_line(stanza))
    line
  end

  def verses(first_stanza, last_stanza)
    (first_stanza..last_stanza).to_a.map { |stanza| verse(stanza) + "\n" }.join
  end

  def sing
    verses(1, ITEMS.count)
  end

  private

  def related_line(verse)
    LINES[verse - 1]
  end

  def line_sanitizer(line)
    line == "" ? line : line + "\n"
  end

  def middle_lines(verse)
    return "" if verse < 2 || verse == 8
    lines = (2..verse).to_a.reverse.map do |i|
      line = "She swallowed the #{ITEMS[i - 1]} to catch the #{ITEMS[i - 2]}"
      line += "#{LINES[i - 2]}".sub(/It/, ' that') if i == 3
      line += "." unless i == 3
      line_sanitizer(line)
    end
    lines.join
  end

  def last_line(verse)
    case verse
    when 2..7
      related_line(1)
    when 8
      "She's dead, of course!"
    else
      ""
    end
  end
end