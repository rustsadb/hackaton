FROM ruby:2.7.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . ./
# Add a script to be executed every time the container starts.
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
