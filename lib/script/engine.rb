class Script::Engine
  def initialize
    @steps = []
  end

  def register_step(headline, &block)
    @steps << Script::Step.new(headline, block)
  end
end
