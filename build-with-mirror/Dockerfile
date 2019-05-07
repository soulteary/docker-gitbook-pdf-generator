FROM python:3.7-alpine3.9
LABEL  MAINTAINER="soulteary <soulteary@gmail.com>"

ENV LIBRARY_PATH /lib:/usr/lib

RUN wget https://github.com/soulteary/gitbook2pdf/archive/master.zip -O /tmp/app.zip && \
    cd /tmp && unzip app.zip && mv /tmp/gitbook2pdf-master /app

RUN cat /etc/apk/repositories | sed -e "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/" | tee /etc/apk/repositories && \
    apk add build-base python3-dev gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev libxslt-dev && \
    cd /app && pip install -i https://mirrors.aliyun.com/pypi/simple/ -r /app/requirements.txt && \
    apk del build-base && rm -rf /var/cache/apk/*

VOLUME [ "/app/output" ]
VOLUME [ "/usr/share/fonts/" ]

WORKDIR /app

ENTRYPOINT [ "python", "/app/gitbook.py" ]
