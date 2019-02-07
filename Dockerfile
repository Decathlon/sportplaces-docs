FROM ruby:2.5.3

# Install NodeJS for execJS
RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install nodejs -yq \
    && apt-get clean

# Set Workdir
WORKDIR /app

# Install Dependancy
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

# Copy all Sources
COPY . .

# RUN Documentation
CMD ["bundle", "exec", "middleman", "server"]