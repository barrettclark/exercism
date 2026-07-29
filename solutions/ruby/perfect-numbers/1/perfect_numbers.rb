class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1

    factors = factors_for_number(number)
    aliquot_sum = factors.sum

    case aliquot_sum
    when number
      "perfect"
    when ..number
      "deficient"
    else
      "abundant"
    end
  end

  def self.factors_for_number(number)
    factors = []
    1.upto(number-1) do |x|
      factors << x if number % x == 0
    end
    factors
  end
end
