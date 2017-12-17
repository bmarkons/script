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
      puts Script::Output.started(step)
      step.run
      puts Script::Output.result(step)
    end
  end
end
