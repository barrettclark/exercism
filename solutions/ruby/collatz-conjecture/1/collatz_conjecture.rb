class CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError if number < 1
    return count if number == 1

    next_number = number % 2 == 0 ? number/2 : 3*number + 1
    steps(next_number, count+1)
  end
end
