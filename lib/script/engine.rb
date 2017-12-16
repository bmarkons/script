class Script::Engine
  def initialize
    @steps = []
  end

  def steps
    @steps
  end

  def register_step(headline, block)
    @steps << Script::Step.new(headline, block)
  end

  def run
    @steps.each do |step|
      step.run
    end
  end
end
