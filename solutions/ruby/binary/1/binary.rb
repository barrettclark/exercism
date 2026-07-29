class Binary
  def initialize(binary_number)
    @binary_number = binary_number
  end

  def to_decimal
    binary_to_decimal
  end

  private

  # `101 => 1*2^2 + 0*2^1 + 1*2^0 => 1*4 + 0*2 + 1*1 => 4 + 1 => 5 base 10`
  def binary_positional_values
    @binary_number.chars.reverse.map.with_index { |x, index| x.to_i * 2**index }
  end

  def binary_to_decimal
    valid_binary_number? ? binary_positional_values.reduce(:+) : 0
  end

  def valid_binary_number?
    @binary_number.match(/\D/) == nil
  end
end