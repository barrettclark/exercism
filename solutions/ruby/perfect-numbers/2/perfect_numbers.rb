class PerfectNumber
  def initialize(number)
    @number = number
  end

  def self.classify(number)
    raise RuntimeError if number < 1

    perfect_number = PerfectNumber.new(number)
    perfect_number.classification
  end

  def factors_for_number
    factors = []
    1.upto(@number-1) do |x|
      factors << x if @number % x == 0
    end
    factors
  end

  def aliquot_sum
    factors_for_number.sum
  end

  def classification
    case aliquot_sum
    when @number
      "perfect"
    when ..@number
      "deficient"
    else
      "abundant"
    end
  end
end
