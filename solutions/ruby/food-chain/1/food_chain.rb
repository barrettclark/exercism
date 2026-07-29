class FoodChainSong
  ITEMS = ['fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse']

  def verse(stanza)
    item = ITEMS[stanza - 1]
    line = "I know an old lady who swallowed a #{item}.\n"
    line += related_line(stanza)
    line += middle_lines(stanza)
    line += last_line(stanza)
    line
  end

  def verses(first_stanza, last_stanza)
    (first_stanza..last_stanza).to_a.map { |stanza| verse(stanza) + "\n" }.join
  end

  def sing
    verses(1, ITEMS.count)
  end

  private

  def spider_action
    "wriggled and jiggled and tickled inside her"
  end

  def related_line(verse)
    case verse
    when 1
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    when 2
      "It #{spider_action}.\n"
    when 3
      "How absurd to swallow a bird!\n"
    when 4
      "Imagine that, to swallow a cat!\n"
    when 5
      "What a hog, to swallow a dog!\n"
    when 6
      "Just opened her throat and swallowed a goat!\n"
    when 7
      "I don't know how she swallowed a cow!\n"
    else
      ""
    end
  end

  def middle_lines(verse)
    return "" if verse < 2 || verse == 8
    lines = (2..verse).to_a.reverse.map do |i|
      line = "She swallowed the #{ITEMS[i - 1]} to catch the #{ITEMS[i - 2]}"
      line += " that #{spider_action}" if i == 3
      line += ".\n"
    end
    lines.join
  end

  def last_line(verse)
    case verse
    when 2..7
      related_line(1)
    when 8
      "She's dead, of course!\n"
    else
      ""
    end
  end
end