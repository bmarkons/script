RSpec.describe Script::Output do
  before do
    @step = Script::Step.new("Example step", nil)
  end

  describe "#started" do
    it "returns the output to be printed before the step is run" do
      expect(cript::Output.started(@step)).to eq(
        "#{'-' * 80}\nStarted: #{@step.headline}\n".colorize(:yellow)
      )
    end
  end

  describe "#result" do
    context "when the step has succeded" do
      before do
        allow(@step).to receive(:result).and_return(:succeded)
      end

      it "returns the output with the result after the step has finished" do
        expect(Script::Output.result(@step)).to eq(
          "\nSucceded: #{@step.headline}\n#{'-' * 80}".colorize(:green)
        )
      end
    end

    context "when the step has failed" do
      before do
        allow(@step).to receive(:result).and_return(:failed)
      end

      it "returns the output with the result after the step has finished" do
        expect(Script::Output.result(@step)).to eq(
          "\nFailed: #{@step.headline}\n#{'-' * 80}".colorize(:red)
        )
      end
    end
  end
end
