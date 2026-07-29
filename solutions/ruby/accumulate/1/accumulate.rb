module Accumulate
  def accumulate(&block)
    accumulated = []
    each { |element| accumulated << yield(element) }
    accumulated
  end
end

class Array
  include Accumulate
end