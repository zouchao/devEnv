FROM devenv-ruby:latest

WORKDIR /project/ruby-project-example
# COPY . /project/ruby-project-example
# RUN rbenv install 2.7.6  # if you want to install a different ruby version 如果你需要安装不同版本的 ruby
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json package.json
ADD vendor vendor
RUN rbenv install
RUN gem install bundler --no-document \
  && gem install bundler && bundle install \
  && yarn install --check-files

# CMD ["rails", "server", "-b", "0.0.0.0"]
