
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "script/version"

Gem::Specification.new do |spec|
  spec.name          = "script"
  spec.version       = Script::VERSION
  spec.authors       = ["bmarkons"]
  spec.email         = ["mamaveb@gmail.com"]

  spec.summary       = %q{Ruby scripting}
  spec.description   = %q{Gives you a hand with composing neat Ruby scripts.}
  spec.homepage      = "https://github.com/bmarkons/script"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rspec-autotest"
end
