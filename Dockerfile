FROM ruby:2.2.3

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
  apt-get install -y nodejs


COPY Gemfile Gemfile.lock /app/

RUN cd /app && gem install bundler && bundle install
