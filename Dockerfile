ARG ALPINE_VERSION=3.19.1
ARG ALPINE_HASH=sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b


FROM alpine:${ALPINE_VERSION}@${ALPINE_HASH}

WORKDIR /opt/mnesi.ac
