FROM fluent/fluentd:v1.3

MAINTAINER GoAbout <tech@goabout.com>

RUN apk add --update --virtual .build-deps build-base ruby-dev \
        automake autoconf libtool libc6-compat geoip-dev && \
    apk add --no-cache geoip libmaxminddb && \
    fluent-gem install fluent-plugin-anonymizer && \
    fluent-gem install fluent-plugin-elasticsearch && \
    fluent-gem install fluent-plugin-geoip && \
    gem sources --clear-all && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* /home/fluent/.gem/ruby/2.5.0/cache/*.gem
