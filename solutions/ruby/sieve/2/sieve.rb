class Sieve
  def initialize(limit)
    @integers = (2..limit).to_a
    @prime_candidates = Hash[@integers.map { |k| [k, true] }]
  end

  def primes
    mark_composite_numbers
    extract_primes
  end

  private

  def extract_primes
    @prime_candidates.select { |k,v| v }.keys
  end

  def mark_composite_numbers
    @integers.each { |candidate| sift(candidate) }
  end

  def sift(candidate)
    return if @prime_candidates[candidate] == false
    (@integers.last / candidate).times do |multiple|
      next if multiple == 0
      @prime_candidates[candidate * (multiple + 1)] = false
    end
  end
end