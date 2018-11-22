FROM fluent/fluentd:v1.3

MAINTAINER GoAbout <tech@goabout.com>

RUN apk add --update --virtual .build-deps build-base ruby-dev && \
    gem install fluent-plugin-elasticsearch && \
    gem sources --clear-all && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* /home/fluent/.gem/ruby/2.5.0/cache/*.gem
