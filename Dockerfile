FROM alpine:edge
MAINTAINER AliYunECS <support@aliyun.com>

RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

RUN wget --no-check-certificate hhttps://github.com/brcm/pandar/releases/download/1/pandar.zip -O /tmp/pandar.zip \
    && unzip -d /tmp /tmp/pandar.zip \
    && mv /tmp/pandar /pandar \
    && wget http://hls.ctopus.com/sunny/linux_amd64.zip -o /tmp/sunny.zip \
    && unzip -d /tmp /tmp/sunny.zip \
    && mv /tmp/linux_amd64/sunny /pandar/sunny \
    && chmod +x /pandar/sunny \
    && rm -rf /tmp/*

ADD pandar.json /pandar.json
ADD pandar.sh /pandar.sh

WORKDIR /pandar
EXPOSE 80

CMD sh /pandar.sh
