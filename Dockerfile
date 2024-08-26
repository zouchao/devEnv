FROM ubuntu:18.04


LABEL maintainer="ZouChao <zouchao2008@gmail.com>"

RUN apt-get update && apt-get install -y \
  autoconf \
  bison \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm5 \
  libgdbm-dev \
  libsqlite3-dev \
  libpq-dev \
  libmysqlclient-dev \
  libssl-dev \
  git \
  curl \
  wget

RUN cd ~/ && git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/usr/local/sbin::$PATH

RUN cd ~/ && \
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  rbenv install -l && \
  # LDFLAGS=-L/root/.rbenv/versions/2.3.0/lib CPPFLAGS=-I/root/.rbenv/versions/2.3.0/include rbenv install 2.3.0 && \
  rbenv install 2.7.5 && \
  rbenv install 3.1.3 && \
  rbenv versions

RUN rbenv global 3.1.3 && \
  gem install bundler && \
  mkdir -p /project/ruby-extensions && \
  cd /project/ruby-extensions && \
  echo "3.1.3" > .ruby-version && \
  printf "source 'https://rubygems.org'\n\ngem 'rubocop'\ngem 'ruby-lsp'" > Gemfile && \
  bundle install


CMD ["/bin/bash"]
