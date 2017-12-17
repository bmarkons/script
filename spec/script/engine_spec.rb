RSpec.describe Script::Engine do
  let(:engine) { Script::Engine.new }

  describe "#register_step" do
    it "registers new step" do
      headline = "Compilation"
      block = Proc.new { system("echo foo") }

      expect(Script::Step).to receive(:new).with(headline, block)
      engine.register_step(headline, block)
    end
  end

  describe "#run" do
    before do
      @engine = engine_with_steps
      @engine.steps.each { |step| allow(step).to receive(:result).and_return(:succeded) }
    end

    it "runs all registered steps" do
      @engine.steps.each do |step|
        expect(STDOUT).to receive(:puts).with(Script::Output.started(step))
        expect(step).to receive(:run)
        expect(STDOUT).to receive(:puts).with(Script::Output.result(step))
      end

      @engine.run
    end
  end
end

def engine_with_steps
  engine = Script::Engine.new

  engine.register_step("Remove cache", Proc.new { system("echo rmrf") })
  engine.register_step("Compile", Proc.new { system("echo compile") })
  engine.register_step("Test", Proc.new { system("echo test") })

  engine
end
