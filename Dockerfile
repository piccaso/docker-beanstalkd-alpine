FROM alpine:3.11

RUN addgroup -S beanstalkd && adduser -S -G beanstalkd beanstalkd
RUN apk add --no-cache 'su-exec>=0.2'

RUN apk --update add --no-cache beanstalkd && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*
  
RUN mkdir /data && chown beanstalkd:beanstalkd /data

VOLUME ["/data"]

EXPOSE 11300

ENTRYPOINT ["beanstalkd", "-p", "11300", "-u", "beanstalkd"]
CMD ["-b", "/data"]
