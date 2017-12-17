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

      abort_run if step.result == :failed
    end
  end

  def abort_run
    # TODO: Print the result per steps table
    abort
  end
end
