RSpec.describe Script do
  let(:script) { Script.new }

  before do
    allow(Kernel).to receive(:system)
  end

  it "has a version number" do
    expect(Script::VERSION).not_to be nil
  end

  describe "#step" do
    it "registers the step on the engine" do
      headline = "Compilation"
      compilation = Proc.new { system("ls") }
      expect_any_instance_of(Script::Engine).to receive(:register_step).with(headline, compilation)
      script.step(headline, &compilation)
    end
  end

  describe "#run" do
    it "runs each step from the script" do
      script.step("Set up credentials") do
        system("gcloud init")
        system("gcloud config set")
        system("gcloud container clusters get-credentials")
      end

      script.step("Install bundle") do
        system("bundle config build.mysql --with-mysql-config=config")
        system("bundle install")
      end

      script.step("Precompile assets") do
        system("bundle exec rake assets:precompile")
        system("aws s3 sync")
      end

      script.step("Push to Dockerhub") do
        system("docker pull dummy")
        system("docker build --from-cache dummy")
        system("docker push dummy")
      end

      script.step("Deploy to Kubernetes") do
        system("kubectl apply -f k8s.yml --record")
      end

      expect(script.engine).to receive(:run)

      script.run
    end
  end
end
