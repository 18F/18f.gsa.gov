FROM ruby:2.7.2

# set locales
RUN  apt-get update >/dev/null && \
     apt-get install -y locales >/dev/null && \
     echo "en_US UTF-8" > /etc/locale.gen  && \
     locale-gen en_US.UTF-8  && \
     gem install bundler -v 2.2.9 && \
     export LANG=en_US.UTF-8  && \
     export LANGUAGE=en_US.UTF-8  && \
     export LC_ALL=en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
apt-get install -y nodejs

COPY Gemfile Gemfile.lock /app/

RUN cd /app && gem install bundler && bundle install
