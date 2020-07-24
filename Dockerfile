FROM mhart/alpine-node:8
USER root

RUN set -xe; \
    apk add --update --no-cache \
    make \
    jq \
    mc \
    python \
    bash \
    g++ && \
    mkdir /tmp/app

WORKDIR /tmp/app
