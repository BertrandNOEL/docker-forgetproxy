FROM alpine

RUN apk update
RUN apk add wget bash iptables procps psmisc libevent make clang gcc musl-dev libevent-dev linux-headers
RUN wget --no-check-certificate https://github.com/darkk/redsocks/archive/master.zip
RUN unzip master.zip
WORKDIR redsocks-master
RUN make
RUN cp redsocks /usr/bin/redsocks
RUN addgroup -S redsocks && adduser -S -g redsocks redsocks
RUN apk del make clang gcc musl-dev libevent-dev linux-headers wget
RUN rm -f /master.zip && rm -rf /redsocks-master
    
ADD redsocks.conf /etc/redsocks/redsocks.conf
ADD forgetproxy /

ENTRYPOINT ["/bin/bash", "/forgetproxy"]

