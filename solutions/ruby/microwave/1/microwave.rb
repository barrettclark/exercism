class Microwave
  def initialize(time)
    @time = time
  end

  def timer
    minutes = @time / 100
    seconds = @time % 100
    total_seconds = minutes * 60 + seconds
    format('%02d:%02d', total_seconds / 60, total_seconds % 60)
  end
end
