# Script[<img width="40" align="left" src="misc/ruby.png">](https://github.com/bmarkons/script#script)
[![Build Status](https://semaphoreci.com/api/v1/bmarkons/script/branches/master/badge.svg)](https://semaphoreci.com/bmarkons/script)
[![Gem Version](https://badge.fury.io/rb/script.svg)](https://badge.fury.io/rb/script)

The Script is everything you need to make the most of Ruby - a fabulous scripting language. The one started with idea of having nicely formatted output, but ended up in much more...

###### Table of contents
- [Setup](#setup)
- [Usage](#usage)
  - [Steps](#steps)
  - [Error handling](#error-handling)
  - [Output](#output)
  - [Shareables](#shareables)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)

## Setup

Install gem:

```
gem install script
```

Or add it as dependency to your Gemfile:

```ruby
gem 'script'
```

Then simply require it in your script file:

```
require 'script'
```

And you're good to go.

## Usage

### Steps

Steps encourages you to split commands into higher level constructs which are essential for more complex scripts. 

Use Script to define the steps:

```ruby
#!/usr/bin/env ruby

require "script"

Script.define do |s|
  s.step("step 1") do
    # Commands
  end

  s.step("step 2") do
    # Commands
  end
end
```

Once you've run the ruby script, it will execute each of the steps in the order they were defined.

### Error handling

In case of an error in one of the steps, the script is stopped right away without executing further steps.

### Output

Nicely formatted output is the primary motivation behind the Script. Most of the time you want to separate your commands output, in order to help investigation or debugging later.

Let's take for an example the following script:

```ruby
#!/usr/bin/env ruby

require "script"

Script.define do |s|
  s.step("setup") do
    system("bundle install") 
  end

  s.step("build") do
    system("bundle exec rake spec")
  end

  s.step("deploy") do
    system("gem push script-*")
  end
end
```

It will produce the following output:

```
--------------------------------------------------------------------------------
Started: setup

Using rake 10.4.2
Using bundler 1.16.0
Using byebug 9.0.6
Using colorize 0.8.1
Using diff-lcs 1.3
Using rspec-support 3.7.0
Using rspec-core 3.7.0
Using rspec-expectations 3.7.0
Using rspec-mocks 3.7.0
Using rspec 3.7.0
Using rspec-autotest 1.0.0
Using script 1.0.0 from source at `.`
Bundle complete! 6 Gemfile dependencies, 12 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

Succeded: setup
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Started: build

/usr/bin/ruby2.3 -I/var/lib/gems/2.3.0/gems/rspec-core-3.7.0/lib:/var/lib/gems/2.3.0/gems/rspec-support-3.7.0/lib /var/lib/gems/2.3.0/gems/rspec-core-3.7.0/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb

Script::Engine
  #register_step
    registers new step
  #run
    runs all registered steps

Script::Output
  #started
    returns the output to be printed before the step is run
  #result
    when the step has succeded
      returns the output with the result after the step has finished
    when the step has failed
      returns the output with the result after the step has finished

Script
  has a version number
  #step
    registers the step on the engine
  #run
    runs each step from the script

Finished in 0.01004 seconds (files took 0.07973 seconds to load)
8 examples, 0 failures


Succeded: build
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Started: deploy

Pushing gem to https://rubygems.org...
Successfully registered gem: script (1.0.0)

Succeded: deploy
--------------------------------------------------------------------------------
```

### Shareables

In case you need to share data between steps, you can pass hash of shareables to the step block:

```ruby
script.step("Step 1") do |shareables|
  shareables["environment"] = "production"
end

script.step("Step 2") do |shareables|
  environment = shareables["environment"]
  puts "Deploying on #{environment} environment"
end
```

## Contributing

```
# Clone the repo
git clone git@github.com:bmarkons/script.git

# Install
bundle install

# Run tests
bundle exec rspec
```

Pull requests are always welcome. In case you notice any bug or simply want to propose an improvement, please feel free to open an issue.

## Code of Conduct

Please [be nice](https://github.com/bmarkons/script/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
