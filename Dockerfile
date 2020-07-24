FROM mhart/alpine-node:8
USER root

RUN set -xe; \
    apk add --update --no-cache \
    make \
    jq \
    mc \
    python \
    bash \
    g++

WORKDIR /tmp/app
