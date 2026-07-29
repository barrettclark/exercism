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
    (1...@number).select { |x| @number % x == 0 }
  end

  def aliquot_sum
    @aliquot_sum ||= factors_for_number.sum
  end

  def classification
    return "perfect" if aliquot_sum == @number

    aliquot_sum < @number ? "deficient" : "abundant"
  end
end
