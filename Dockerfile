FROM ruby:2.7.4

RUN gem install bundler -v 2.1.4
RUN gem update --system
WORKDIR /app
COPY Gemfile Gemfile.lock ./
COPY . /app/
ENV BUNDLE_PATH /gems
RUN bundle check || bundle install

COPY . ./

# Add a script to be executed every time the container starts.
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
