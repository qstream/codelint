FROM ruby:2.5.1-alpine

RUN apk update && \
    apk upgrade && \
    apk add ruby-dev build-base nodejs yarn git cmake && \
    rm -rf /var/cache/apk/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install

COPY . .

ENV PATH /usr/src/app:$PATH

CMD [ "pronto", "run" ]
