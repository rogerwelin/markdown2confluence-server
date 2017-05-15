FROM alpine:3.5
MAINTAINER Roger Welin <roger.welin@icloud.com>

ENV BUILD_PACKAGES bash curl curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app && \
    mkdir /usr/src/app/lib
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock config.ru app.rb /usr/src/app/
COPY lib/ /usr/src/app/lib/
RUN bundle install

EXPOSE 9292
CMD ["bundle", "exec", "rackup", "-E", "PRODUCTION", "-o", "0.0.0.0"]
