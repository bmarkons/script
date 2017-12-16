class Script::Step
  def initialize(headline, block)
    @headline = headline
    @block = block
  end

  def run
    @block.call
  end
end
