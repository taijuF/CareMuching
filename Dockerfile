FROM ruby:2.2.0

# npm & bowerのインストール
RUN apt-get update -qq && apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -j4 --path vendor/bundle --without test development

COPY . /usr/src/app

RUN chmod +x /usr/src/app/script/docker.sh

ENTRYPOINT ["/usr/src/app/script/docker.sh"]
