# Script[<img width="40" align="left" src="misc/ruby.png">](https://github.com/bmarkons/script#script)

The Script is everything you need to make the most of Ruby, as fabulous scripting language.

###### Table of contents
- [Setup](#setup)
- [Usage](#usage)
  - [Steps](#steps)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)

## Setup

Install gem:

```
gem install script
```

And require it in your script file:

```
require 'script'
```

## Usage

### Steps

Reason about the step as a logical group of commands. Lets take for instance, the deploy script which builds a docker image, pushes it to Dockerhub and eventually creates the deployment on Kubernetes.

```ruby
#!/usr/local/bin/ruby

require "script"

deploy = Script.new

deploy.step("Setup tools") do

  `sudo apt-get install -y google-cloud-sdk kubectl`
  `gcloud auth activate-service-account $GCLOUD_SERVICE_ACCOUNT_NAME`
  `gcloud config set project dummy-project`
  `gcloud container clusters get-credentials default --zone us-east`

end

deploy.step("Deploy docker image") do

  `docker pull dummy`
  `docker build --cache-from dummy -t dummy`
  `docker build -t scripter/script .`
  `docker push dummy`

end

deploy.step("Deploy to Kubernetes cluster") do

  `kubectl apply -f k8s.yml --record`

end

# Finally, run the script

deploy.run
```

The steps are run in order in which they are registered.

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
