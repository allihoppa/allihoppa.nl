FROM node:7.4-alpine

RUN apk add --update \
    git \
    tini \
    && rm -rf /var/cache/apk/*

RUN npm install \
    --no-optional \
    -g \
    bower \
    gulp-cli

WORKDIR /workspace

ENTRYPOINT ["/sbin/tini", "--"]
