FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/
COPY Gemfile.lock /app
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

# Configure the main process to run when running the image
CMD ["rails", "server","-p","4000", "-b", "0.0.0.0"]