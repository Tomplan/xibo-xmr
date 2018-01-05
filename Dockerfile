FROM alpine:3.6
MAINTAINER Spring Signage Ltd <info@xibo.org.uk>

ENV XMR_DEBUG false
ENV XMR_QUEUE_POLL 5
ENV XMR_QUEUE_SIZE 10
ENV XMR_IPV6RESPSUPPORT false
ENV XMR_IPV6PUBSUPPORT false

RUN apk update && apk upgrade && apk add tar php7 curl php7-zmq php7-phar php7-json && rm -rf /var/cache/apk/*

EXPOSE 9505 50001

COPY ./entrypoint.sh /entrypoint.sh
COPY ./bin/xmr.phar /opt/xmr/xmr.phar

RUN chown -R nobody /opt/xmr && chmod 755 /entrypoint.sh

# Start XMR
USER nobody

CMD ["/entrypoint.sh"]