FROM alpine:3.9

LABEL MAINTAINER="Marc André Freiheit <marcandre@freiheit.software>"

RUN apk add --no-cache wget

# Fix provided by: https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
# Problem: Go-compiled library was not found
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /cli

RUN wget https://github.com/apache/incubator-openwhisk-cli/releases/download/latest/OpenWhisk_CLI-latest-linux-amd64.tgz -O /tmp/wsk.tgz && \
    tar -xvzf /tmp/wsk.tgz -C /tmp && \
    mv /tmp/wsk /bin

