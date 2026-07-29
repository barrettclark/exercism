class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end

  def to(limit)
    (1...limit).inject(0) do |sum, n|
      sum += n if is_a_multiple?(n)
      sum
    end
  end

  private

  def is_a_multiple?(number)
    @multiples.select { |multiple| number % multiple == 0 }.count > 0
  end
end