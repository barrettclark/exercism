class Triplet
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(min_factor: 1, max_factor: 1000, sum: nil)
    return Euclid.pythagorean(s: sum) unless sum.nil?
    triplets = []
    mlimit = sum.nil? ? max_factor : Math.sqrt(sum/2)
    1.upto(mlimit) do |m|
      triplet_factory = TripletFactory.new(m: m, min_factor: min_factor, max_factor: max_factor, sum: sum)
      break if triplet_factory.factor_too_high?
      triplets += triplet_factory.generate_triplets
    end
    triplets
  end
end

class TripletFactory
  def initialize(m:, min_factor:, max_factor:, sum:)
    @m = m
    @n = m + 1
    @min_factor = min_factor
    @max_factor = max_factor
    @sum = sum
    @multiplier = 1
  end

  def generate_triplets
    triplets = []
    loop do
      break if factor_too_high?
      triplets << triplet unless factor_too_low? || !valid_sum?
      increment_multiplier
    end
    triplets
  end

  private def factor_a
    (@n**2 - @m**2) * @multiplier
  end

  private def factor_b
    2 * @n * @m * @multiplier
  end

  private def factor_c
    (@n**2 + @m**2) * @multiplier
  end

  private def factor_too_low?
    factor_a < @min_factor
  end

  def factor_too_high?
    factor_c > @max_factor
  end

  def valid_sum?
    return true if @sum.nil?
    triplet.sum == @sum
  end

  private def increment_multiplier
    @multiplier += 1
  end

  private def triplet
    Triplet.new(factor_a, factor_b, factor_c)
  end
end

module Euclid
  # https://www.mathblog.dk/pythagorean-triplets
  def self.pythagorean(s:)
    k = 0
    triplets = []
    mlimit = Math.sqrt(s/2)
    2.upto(mlimit) do |m|
      next unless (s / 2) % m == 0
      # ensure that we find an odd number for k
      k = m % 2 == 0 ? m + 1 : m + 2

      while (k < 2 * m && k <= s / (2 * m))
        if (s / (2 * m) % k == 0 && k.gcd(m) == 1)
          d = s / 2 / (k * m)
          n = k - m
          # NOTE: this can violate the rule that a < b < c
          a = d * (m**2 - n**2)
          b = 2 * d * n * m
          c = d * (m**2 + n**2)
          triplets << Triplet.new(a, b, c)
        end
        k += 2
      end
    end
    triplets
  end
end
