FROM node:18.4.0-alpine3.16
USER root

RUN set -xe; \
    apk update \
    apk add --update --no-cache \
    make \
    jq \
    mc \
    python \
    bash \
    g++ && \
    mkdir /tmp/app

WORKDIR /tmp/app
