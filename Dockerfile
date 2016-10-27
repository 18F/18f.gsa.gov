FROM ruby:2.3.1

# set locales 
RUN  apt-get update >/dev/null && \
     apt-get install -y locales >/dev/null && \
     echo "en_US UTF-8" > /etc/locale.gen  && \
     locale-gen en_US.UTF-8  && \
     export LANG=en_US.UTF-8  && \
     export LANGUAGE=en_US:en  && \
     export LC_ALL=en_US.UTF-8  

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
apt-get install -y nodejs


COPY Gemfile Gemfile.lock /app/

RUN cd /app && gem install bundler && bundle install