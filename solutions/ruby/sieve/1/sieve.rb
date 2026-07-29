class Sieve
  def initialize(limit)
    @numbers = (2..limit).to_a
    @primes  = [2]
  end

  def primes
    while @numbers.count > 0
      remove_composites_for_prime(@primes.last)
    end
    @primes
  end

  private

  def remove_composites_for_prime(prime)
    @numbers.delete_if { |n| n % prime == 0 }
    @primes << @numbers.first unless @numbers.empty?
  end
end