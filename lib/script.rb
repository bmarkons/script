require "script/version"
require "script/engine"
require "script/step"
require "script/output"

require "colorize"

class Script
  def initialize
    @engine = Script::Engine.new
  end

  def engine
    @engine
  end

  def step(headline, &block)
    @engine.register_step(headline, block)
  end

  def run
    @engine.run
  end
end
