class Script::Step
  def initialize(headline, block)
    @headline = headline
    @block = block
  end

  def run(shared)
    @block.call(shared)
  end
end
