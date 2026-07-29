module BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram?(string)
    pangram_tester = Pangram.new(string)
    pangram_tester.contains_all_letters?
  end

  def initialize(string)
    @string = string
  end

  def normalized_string
    @string.downcase
  end
  private :normalized_string

  def unique_characters
    normalized_string.chars.uniq
  end
  private :unique_characters

  def filtered_letters
    unique_characters.grep(/[a-z]/)
  end
  private :filtered_letters

  def contains_all_letters?
    filtered_letters.count == 26
  end
end