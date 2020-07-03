FROM ruby:2.5

RUN gem install semaphore_test_boosters

ADD . /app
WORKDIR /app
RUN bundle install
