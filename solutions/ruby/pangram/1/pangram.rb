module BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram?(str)
    str.downcase.chars.uniq.grep(/[a-z]/).count == 26
  end
end