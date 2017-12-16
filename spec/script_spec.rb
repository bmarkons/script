RSpec.describe Script do
  let(:script) { Script.new }

  it "has a version number" do
    expect(Script::VERSION).not_to be nil
  end

  describe "#step" do
    it "registers the step on the engine" do
      headline = "Compilation"
      compilation = Proc.new { system("ls") }
      expect_any_instance_of(Script::Engine).to receive(:register_step).with(headline, &compilation)
      script.step(headline, &compilation)
    end
  end
end
