class Script::Step
  def initialize(headline, block)
    @headline = headline
    @block = block
  end

  def run
    @block.call
    @result = :succeded
  rescue
    @result = :failed
  end

  def result
    @result
  end

  def headline
    @headline
  end
end
