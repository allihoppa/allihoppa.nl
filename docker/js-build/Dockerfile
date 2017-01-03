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

# Create writable XDG compatible dir structure where config dirs can be mounted on
RUN mkdir -p \
    /home/.cache \
    /home/.config/configstore \
    /home/.local \
    && chmod -R o+w /home

WORKDIR /workspace

ENTRYPOINT ["/sbin/tini", "--"]
