class Palindromes
  Palindrome = Struct.new(:factors, :value)

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2).map do |x1, x2|
      product = x1 * x2
      @palindromes[product] << [x1, x2] if product.to_s == product.to_s.reverse
    end
  end

  def smallest
    Palindrome.new(@palindromes[min_product], min_product)
  end

  def largest
    Palindrome.new(@palindromes[max_product], max_product)
  end

  private

  def min_product
    @min_product ||= @palindromes.keys.min
  end

  def max_product
    @max_product ||= @palindromes.keys.max
  end
end
