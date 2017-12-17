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
      Script::Output.print_started(step)
      step.run
      Script::Output.print_result(step)
    end
  end
end
