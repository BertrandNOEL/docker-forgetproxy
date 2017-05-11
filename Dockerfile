FROM alpine

RUN apk update
RUN apk add bash iptables procps psmisc redsocks
    
ADD redsocks.conf /tmp/
ADD redsocks /root/

ENTRYPOINT ["/bin/bash", "/root/redsocks"]

