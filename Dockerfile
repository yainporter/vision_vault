# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.2
FROM ruby:3.2.5
# Use the official Ruby image
FROM ruby:3.2.5

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    zsh \
    curl \
    nodejs \                
    postgresql-client \     
    build-essential \       
    libpq-dev \             
    git      

# Install Yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#   && apt-get update && apt-get install yarn

# Set the working directory
WORKDIR /app

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code
COPY . .

# Precompile assets (if using Rails)
# RUN rake assets:precompile

# Expose port
EXPOSE 3000

# Start the Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
