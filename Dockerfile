FROM ruby:2.5-slim

WORKDIR /app

# 3: Install gems
ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

ADD . /app
