class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @qualifier = qualifier
  end

  def to_s
    sentences.join("\n")
  end

  private

  def sentences
    @words.each_index.map do |idx|
      if @words[idx+1]
        "For want of a #{@words[idx]} the #{@words[idx+1]} was lost."
      else
        wanted = @qualifier ? "#{@qualifier} #{@words.first}" : @words.first
        "And all for the want of a #{wanted}."
      end
    end
  end
end
