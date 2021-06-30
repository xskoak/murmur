FROM alpine:latest AS builder

RUN apk --no-cache upgrade

RUN apk --no-cache add murmur

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

FROM scratch

COPY --from=builder / /

USER murmur

ENTRYPOINT ["/docker-entrypoint.sh"]
