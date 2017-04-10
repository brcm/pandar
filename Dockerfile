FROM alpine:edge
MAINTAINER AliYunECS <support@aliyun.com>

RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

RUN wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocksr-manyuser/shadowsocks /pandar \
    && rm -rf /tmp/*

ADD pandar.json /pandar.json

WORKDIR /pandar
EXPOSE 80

CMD python server.py -c /pandar.json
