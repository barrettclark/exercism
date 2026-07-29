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
    return if @prime_candidates.fetch(candidate) == false
    1.upto(@integers.last / candidate) do |multiple|
      @prime_candidates[candidate * (multiple + 1)] = false
    end
  end
end