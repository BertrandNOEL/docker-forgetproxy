FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk update
RUN apk add bash iptables procps psmisc "redsocks>=0.5"
RUN addgroup -S redsocks && adduser -S -g redsocks redsocks
    
ADD redsocks.conf /etc/redsocks/redsocks.conf
ADD forgetproxy /

ENTRYPOINT ["/bin/bash", "/forgetproxy"]

